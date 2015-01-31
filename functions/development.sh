# INSTALL DEVELOPMENT TOOLS
function development {
# Positive action
echo 'Requires root privileges:'

echo "Enabling the 'partner' repository"
sed -i "/^# deb .*partner/ s/^# //" /etc/apt/sources.list

echo "Updating system packages"
apt-get update
apt-get upgrade -y

echo "Install Synaptic package manager"
apt-get install -y synaptic

# install packages

echo "Installing gnome-session-fallback"
apt-get install -y gnome-session-fallback

# LAMP stack

echo "Installing tasksel"
apt-get install -y tasksel

echo "Installing lamp-server"
tasksel install lamp-server

echo "Installing mail-server"
tasksel install mail-server

echo "Increasing memory and upload limits in php.ini"
sed -i "s/^memory_limit =.*M$/memory_limit = 1024M/" /etc/php5/apache2/php.ini
sed -i "s/^upload_max_filesize =.*M$/upload_max_filesize = 2024M/" /etc/php5/apache2/php.ini
sed -i "s/^post_max_size =.*M$/post_max_size = 2024M/" /etc/php5/apache2/php.ini

echo "Install OpenSSH via metapackage"
apt-get install -y ssh

echo "Installing phpmyadmin"
apt-get install -y phpmyadmin

echo "Enabling apache modules and setting ServerName"
a2enmod ssl rewrite
echo "ServerName localhost" >> /etc/apache2/apache2.conf
service apache2 restart

echo "Installing git"
apt-get install -y git git-cola gitk tig

echo "Install curl"
apt-get install -y curl	php5-curl

echo "Add mod_rewrite"
a2enmod rewrite

echo "Installing MySQL Workbench"
apt-get install -y mysql-workbench

echo "installing mailutils"
apt-get install -y mailutils

echo "Installing geany and plugins"
apt-get install -y geany-common geany-plugin-addons geany-plugins-common geany-plugin-codenav geany-plugin-debugger geany-plugin-gendoc geany-plugin-prettyprinter geany-plugin-numberedbookmarks geany-plugin-macro geany-plugin-gproject geany-plugin-extrasel geany-plugin-spellcheck geany-plugin-lipsum

echo "Installing chromium-browser"
apt-get install -y chromium-browser

echo "Installing Compiz settings manager"
apt-get install -y compizconfig-settings-manager

echo "Installing inkscape"
apt-get install -y inkscape

echo "Installing Gimp"
apt-get install -y gimp

echo "Installing Dia"
apt-get install -y dia-common



}