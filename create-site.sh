#!/bin/bash

# Run like:
# sudo create-site.sh site_name

if [ "$USER" == "root" ]
  then
  echo 'Script must not be run as root (or with sudo)'
elif [ "$1" == "" ]
  then
  echo "You must include a site name. Run command as ./create-site.sh site_name";
else ## closing fi at bottom of script

# DB user settings - change these to suit your environment
DB_USER='test_devel'
DB_PASS='D3velD3vel'

# Site is first argument
SITE=$1
# DB NAME must not have hyphens or dots
DB_NAME=$(echo "$SITE" | sed -e 's/-/_/g' -e 's/\./_/g')

echo "Enter database root password and press [ENTER]: "
read -s DB_ROOT_PASS
echo "Creating database $DB_NAME (if it doesn't exist)"
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -u root -p$DB_ROOT_PASS
echo "Setting grant permissions- edit the config file to change db user/pass"
echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';" | mysql -u root -p$DB_ROOT_PASS

TEMPLATE=$(echo "<VirtualHost *:80>
        ServerName SITE
        ServerAlias www.SIIE
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/SITE/www
        <Directory /var/www/SITE/www>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Order allow,deny
                allow from all
        </Directory>

        ErrorLog ${APACHE_LOG_DIR}/error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
");

echo "Creating Apache Virtualhost file"
sudo sh -c "echo '$TEMPLATE' > /etc/apache2/sites-available/$SITE.conf"
sudo sh -c "sed -i 's/SITE/$SITE/g' /etc/apache2/sites-available/$SITE.conf"
sudo sh -c "sed -i 's/HOST/$HOSTNAME/g' /etc/apache2/sites-available/$SITE.conf"

if [ ! -d /var/www/$SITE/www ]; then
  echo "Creating docroot at /var/www/$SITE"
  mkdir -p /var/www/$SITE/www
fi

echo "Done. Now run ess $SITE to enable the site."

fi

echo 'Done.'

