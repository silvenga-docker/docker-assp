if [ ! -d /var/lib/mysql/mysql ]; then

    echo 'Rebuilding MySQL data dir'        
    chown -R mysql.mysql /var/lib/mysql
	mkdir -p /var/log/mysql
	chown -R mysql.mysql /var/log/mysql
    mysql_install_db > /dev/null

    rm -rf /var/run/mysqld/*

    echo 'Starting mysqld'
    mysqld_safe &

    echo 'Waiting for mysqld to come online'
    while [ ! -x /var/run/mysqld/mysqld.sock ]; do
        sleep 1
    done
    
    echo 'Setting root password to root'
    /usr/bin/mysqladmin -u root password 'root'

	echo 'Setting up defaults'
	mysql -proot -e " GRANT ALL PRIVILEGES ON *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY 'vAyk4VOita3IBZZB';"
	
	mysql -proot -e "create database assp;"
	mysql -proot -e "grant usage on *.* to assp@localhost identified by 'assp';"
	mysql -proot -e "grant all privileges on assp.* to assp@localhost;"
	
	
    echo 'Shutting down mysqld'
    mysqladmin -uroot -proot shutdown
fi

chown -R mysql.mysql /var/lib/mysql

service mysql start
service assp start

tail -f /opt/assp/logs/maillog.txt