#/bin/bash

_term() {
	HOMEGEAR_PID=$(cat /var/run/homegear/homegear.pid)
	kill $(cat /var/run/homegear/homegear-management.pid)
	kill $(cat /var/run/homegear/homegear-webssh.pid)
	kill $(cat /var/run/homegear/homegear-influxdb.pid)
	kill $HOMEGEAR_PID
	wait "$HOMEGEAR_PID"
	/etc/homegear/homegear-stop.sh
	exit 0
}

chown homegear:homegear /dev/tty*

if ! [ -d "/config/homegear" ]
then
	mkdir /config/homegear
	echo "Create config dir"
fi

if ! [ -d "/share/homegear" ]
then
	mkdir /share/homegear
	echto "create share dir"
fi

if ! [ -d "/share/homegear/lib" ]
then
	mkdir /share/homegear/lib
	echo "create lib dir"
fi


trap _term SIGTERM

if [[ $GET_VERSION -eq 1 ]]; then
	homegear -v
	exit $?
fi

USER=homegear

USER_ID=$(id -u $USER)
USER_GID=$(id -g $USER)

USER_ID=${HOST_USER_ID:=$USER_ID}
USER_GID=${HOST_USER_GID:=$USER_GID}


ln -nfs /config/homegear /etc/homegear
ln -nfs /share/homegear /var/lib/homegear
ln -nfs /data/homegear/log /var/log/homegear



if [ $USER_ID -ne 0 ]; then
	sed -i -e "s/^${USER}:\([^:]*\):[0-9]*:[0-9]*/${USER}:\1:${USER_ID}:${USER_GID}/" /etc/passwd
	sed -i -e "s/^${USER}:\([^:]*\):[0-9]*/${USER}:\1:${USER_GID}/" /etc/group
fi

if ! [ "$(ls -A /etc/homegear/families)" ]; then
	cp -a /etc/homegear.config/* /etc/homegear/
	echo "copy config files"
fi

if ! [ "$(ls -A /var/lib/homegear/www)" ]; then
	cp -a /var/lib/homegear.data/* /var/lib/homegear/
	echo "copy data files"
else
	rm -Rf /var/lib/homegear/modules/*
	mkdir -p /var/lib/homegear.data/modules
	cp -a /var/lib/homegear.data/modules/* /var/lib/homegear/modules/
	[ $? -ne 0 ] && echo "Could not copy modules to \"homegear.data/modules/\". Please check the permissions on this directory and make sure it is writeable."

	rm -Rf /var/lib/homegear/flows/nodes/*
	mkdir -p /var/lib/homegear.data/node-blue/nodes
	cp -a /var/lib/homegear.data/node-blue/nodes/* /var/lib/homegear/node-blue/nodes/
	[ $? -ne 0 ] && echo "Could not copy nodes to \"homegear.data/node-blue/nodes\". Please check the permissions on this directory and make sure it is writeable."

	cd /var/lib/homegear/admin-ui; ls /var/lib/homegear/admin-ui/ | grep -v translations | xargs rm -Rf
	mkdir -p /var/lib/homegear.data/admin-ui
	cp -a /var/lib/homegear.data/admin-ui/* /var/lib/homegear/admin-ui/
	[ ! -f /var/lib/homegear/admin-ui/.env ] && cp -a /var/lib/homegear.data/admin-ui/.env /var/lib/homegear/admin-ui/
	cp -a /var/lib/homegear.data/admin-ui/.version /var/lib/homegear/admin-ui/
	[ $? -ne 0 ] && echo "Could not copy admin UI to \"homegear.data/admin-ui\". Please check the permissions on this directory and make sure it is writeable."
fi
rm -f /var/lib/homegear/homegear_updated

if ! [ -f /var/log/homegear/homegear.log ]; then
	touch /var/log/homegear/homegear.log
	touch /var/log/homegear/homegear-webssh.log
	touch /var/log/homegear/homegear-flows.log
	touch /var/log/homegear/homegear-scriptengine.log
	touch /var/log/homegear/homegear-management.log
	touch /var/log/homegear/homegear-influxdb.log
fi

if ! [ -f /etc/homegear/dh1024.pem ]; then
	openssl genrsa -out /etc/homegear/homegear.key 2048
	openssl req -batch -new -key /etc/homegear/homegear.key -out /etc/homegear/homegear.csr
	openssl x509 -req -in /etc/homegear/homegear.csr -signkey /etc/homegear/homegear.key -out /etc/homegear/homegear.crt
	rm /etc/homegear/homegear.csr
	chmod 400 /etc/homegear/homegear.key
	openssl dhparam -check -text -5 -out /etc/homegear/dh1024.pem 1024
	chmod 400 /etc/homegear/dh1024.pem
fi

chown -R root:root /etc/homegear
chown ${USER}:${USER} /etc/homegear/*.key
chown ${USER}:${USER} /etc/homegear/*.pem
chown ${USER}:${USER} /etc/homegear/ca/private/*.key
find /etc/homegear -type d -exec chmod 755 {} \;
chown -R ${USER}:${USER} /var/log/homegear /var/lib/homegear
find /var/log/homegear -type d -exec chmod 750 {} \;
find /var/log/homegear -type f -exec chmod 640 {} \;
find /var/lib/homegear -type d -exec chmod 750 {} \;
find /var/lib/homegear -type f -exec chmod 640 {} \;
find /var/lib/homegear/scripts -type f -exec chmod 550 {} \;

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

mkdir -p /var/run/homegear
chown ${USER}:${USER} /var/run/homegear

/etc/homegear/homegear-start.sh
/usr/bin/homegear -u ${USER} -g ${USER} -p /var/run/homegear/homegear.pid &
sleep 5
/usr/bin/homegear-management -p /var/run/homegear/homegear-management.pid &
/usr/bin/homegear-webssh -u ${USER} -g ${USER} -p /var/run/homegear/homegear-webssh.pid &
/usr/bin/homegear-influxdb -u ${USER} -g ${USER} -p /var/run/homegear/homegear-influxdb.pid &
tail -f /var/log/homegear/homegear-webssh.log &
tail -f /var/log/homegear/homegear-flows.log &
tail -f /var/log/homegear/homegear-scriptengine.log &
tail -f /var/log/homegear/homegear-management.log &
tail -f /var/log/homegear/homegear-influxdb.log &
tail -f /var/log/homegear/homegear.log &
child=$!
wait "$child"
