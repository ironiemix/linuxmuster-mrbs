#!/bin/bash

LATEST=linuxmuster-mrbs-2.3.tar.gz
SVNURL=https://svn.linuxmuster.net/svn/linuxmuster/linuxmuster-mrbs/branches/2.3-1/tarfiles/
DBINSTALLFILE="/usr/lib/linuxmuster-mrbs/mrbs_db.my.sql"
DB_EXISTS=0;
LINK_SET=0;

printf "Geben Sie das mysql ROOT Passwort ein: "; read MYSQLPW
echo "Checking database access..."
if ( ! mysql -u root -p${MYSQLPW} -e "use mysql;" > /dev/null 2>&1 ) then
  echo "ERROR: Could not connect to mysql as root."
  echo "       You have to supply the correct mysql "
  echo "       root password to install the mrbs "
  echo "       database." 
  exit 1
fi
echo "  OK"

echo "Checking for existing mrbs-databse..."
if (  mysql -u root -p${MYSQLPW} -e "use mrbs;" > /dev/null 2>&1 ) then
  echo "INFO: You have already a mrbs database on your system"
  echo "      I will not overwrite this DB."
  DB_EXISTS=1
else
  echo "  OK, no mrbs-database found"
fi

echo "Getting latest tar package..."
wget -q ${SVNURL}/${LATEST} -O ./${LATEST}

if [ ! -f ./${LATEST} ]; then
 echo "Failed to download latest tar-Package"
 echo "Failes command:"
 echo "wget -q ${SVNURL}/${LATEST} -O ./${LATEST}"
 exit 1
fi

echo "Unpacking archive..."
tar -C / -xvzf ./${LATEST} > /dev/null 2>&1

if [ ! -L /usr/share/mrbs-1.2.5/web/config.inc.php ]; then
  echo "INFO  Linking main mrbs configuration config.inc.php"
  echo "      to /etc/mrbs/config.inc.php"
  if [ -f  /usr/share/mrbs-1.2.5/web/config.inc.php ]; then
     echo "INFO: Saving old config..."
     mv /usr/share/mrbs-1.2.5/web/config.inc.php /etc/mrbs/
  fi
  ln -s /etc/mrbs/config.inc.php /usr/share/mrbs-1.2.5/web/config.inc.php
  LINK_SET=1
fi

if [ $DB_EXISTS -eq 0 ]; then
   echo "INFO: Installing empty mrbs DB..."
   mysql -h localhost -u root -p${MYSQLPW} < $DBINSTALLFILE
fi

echo "==================================================="
echo "Die mrbs DB muss durch ein Passwort vor direktem"
echo "Zugriff geschützt werden. Geben Sie im folgenden"
echo "bitte ein Passwort für die mysql DB an"
echo "Dieses PW wird in die Konfiguration geschrieben, Sie"
echo "müssen es sich nicht notieren."
echo "==================================================="
printf "Geben Sie ein Passwort für die mrbs DB an: "; read MRBSDBPW

   echo "INFO: Setting new mrbs DB passwd..."
   mysql -s -u root -p${MYSQLPW} -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,INDEX,ALTER ON mrbs.* TO mrbsadmin@localhost IDENTIFIED BY '$MRBSDBPW';"
   perl -p -i -e "s/db_password\s*=.*/db_password =\"$MRBSDBPW\";/" /etc/mrbs/config.inc.php

if [ -L /etc/httpd/mrbs.conf ]; then 
  rm /etc/httpd/mrbs.conf
fi
if [ -f  /etc/mrbs/mrbs.conf ]; then  
   rm /etc/mrbs/mrbs.conf
fi
ln -s /etc/mrbs/mrbs_apache.conf /etc/httpd/mrbs.conf
ln -s /etc/mrbs/mrbs_usermod.css /usr/share/mrbs-1.2.5/web/mrbs_usermod.css 

CONF_INCLUDED=0
grep -q MRBS-TAR /etc/httpd/httpd.conf && CONF_INCLUDED=1
if [ $CONF_INCLUDED -eq 0 ]; then
echo "#MRBS-TAR" >> /etc/httpd.conf
echo "Include /etc/httpd/mrbs.conf" >> /etc/httpd/httpd.conf
fi
/etc/init.d/apache restart

