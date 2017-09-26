#!/bin/bash
if [ -z "$HTTP_PORT" ]; then
    HTTP_PORT=8080
fi
if [ -z "$COMM_PORT" ];then
	COMM_PORT=1099
fi
if [ -z "$DB_NAME" ]; then
    DB_NAME=otter
fi
if [ -z "$MAX_MEN" ];then
	MAX_MEN=3072m
fi
if [ -z "$DB_PORT" ];then
	DB_PORT=3306
fi
if [ -z "$ZK_TIMEOUT" ];then
	ZK_TIMEOUT=60000
fi


echo DOMAIN_NAME: $DOMAIN_NAME
echo HTTP_PORT: $HTTP_PORT
echo COMM_PORT: $COMM_PORT
echo DB_HOST: $DB_HOST
echo DB_PORT: $DB_PORT
echo DB_NAME: $DB_NAME
echo DB_USER: $DB_USER
echo DB_PASSWORD: $DB_PASSWORD
echo MAX_MEN: $MAX_MEN
echo ZK_DEFAULT: $ZK_DEFAULT
echo ZK_TIMEOUT: $ZK_TIMEOUT
echo SMTP_HOST: $SMTP_HOST
echo SMTP_USERNAME: $SMTP_USERNAME
echo SMTP_PASSWORD: $SMTP_PASSWORD
echo SMTP_PORT: $SMTP_PORT

sed -i s/"-server -Xms32m -Xmx3072m"/"-server -Xms32m -Xmx$MAX_MEN"/g /opt/otter_manager/bin/startup.sh
sed -ri "s/(otter.domainName).*/\1 = $DOMAIN_NAME/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.port).*/\1 = $HTTP_PORT/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.database.driver.url).*/\1 = jdbc:mysql:\/\/$DB_HOST:$DB_PORT\/$DB_NAME/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.database.driver.username).*/\1 = $DB_USER/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.database.driver.password).*/\1 = $DB_PASSWORD/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.zookeeper.cluster.default).*/\1 = $ZK_DEFAULT/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.communication.manager.port).*/\1 = $COMM_PORT/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.zookeeper.sessionTimeout).*/\1 = $ZK_TIMEOUT/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.manager.monitor.email.host).*/\1 = $SMTP_HOST/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.manager.monitor.email.username).*/\1 = $SMTP_USERNAME/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.manager.monitor.email.password).*/\1 = $SMTP_PASSWORD/" /opt/otter_manager/conf/otter.properties
sed -ri "s/(otter.manager.monitor.email.smtp.port).*/\1 = $SMTP_PORT/" /opt/otter_manager/conf/otter.properties

/opt/otter_manager/bin/startup.sh
tail -f /opt/otter_manager/logs/manager.log & wait