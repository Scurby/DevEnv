#!/bin/bash
#
# setup 
if  [[ ! "$(/usr/sbin/service mysql status)" =~ "start/running" ]]
then
    sudo service mysql start
fi
#!/bin/bash
#
# dbmaria
if mysql -p1234 -NB -e 'show databases'|grep swgemu > /dev/null 2>&1; then
  echo "swgemu database already exists"
  :
else
  echo "Enter mysql root password"
  createdb swgemu scurby 123456      # See createdb script in /home/bin
  echo "Restore blank swgemu database to mysql"
  mysql -p1234 -e source -e ~/workspace/Core3/MMOCoreORB/sql/swgemu.sql;
  echo "Enter mysql root password"
  createdb mantis scurby 123456      # See createdb script in /home/bin
  echo "Restore blank mantis database to mysql"
  mysql -p1234 -e source -e ~/workspace/Core3/MMOCoreORB/sql/mantis.sql;
  for sql in ~/workspace/Core3/MMOCoreORB/sql/updates/*.sql
  do
    echo "Runing mysql update: $sql"
    mysql -p1234 swgemu -e source -e $sql
  done
fi
