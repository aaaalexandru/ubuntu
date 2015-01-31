
# THIRD PARTY APPLICATIONS
function thirdparty {
echo 'What would you like to install? '
echo ''
echo '1. Google Chrome?'
echo '2. Google Talk Plugin?'
echo '3. Steam?'
echo '4. Sublime Text 3 (build 3059)?'
echo '5. Spotify client'

# Google Chrome 
echo 'Downloading Google Chrome...'
# Download Debian file that matches system architecture
if [ $(uname -i) = 'i386' ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
elif [ $(uname -i) = 'x86_64' ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
fi
# Install package(s)
echo 'Installing Google Chrome...'
echo 'Requires root privileges:'b
sudo dpkg -i google-chrome*.deb
sudo apt-get install -fy
# Cleanup and finish
rm google-chrome*.deb
cd
echo 'Done.'
# Google Talk Plugin
echo 'Downloading Google Talk Plugin...'
# Download Debian file that matches system architecture
if [ $(uname -i) = 'i386' ]; then
    wget https://dl.google.com/linux/direct/google-talkplugin_current_i386.deb
elif [ $(uname -i) = 'x86_64' ]; then
    wget https://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb
fi
# Install package(s)
echo 'Installing Google Talk Plugin...'
echo 'Requires root privileges:'
sudo dpkg -i google-talkplugin_current*.deb
sudo apt-get install -fy
# Cleanup and finish
rm google-talkplugin_current*.deb
cd
echo 'Done.'
# Steam
echo 'Downloading Steam...'
cd $HOME/Downloads
# Download Debian file that matches system architecture
if [ $(uname -i) = 'i386' ]; then
    wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
elif [ $(uname -i) = 'x86_64' ]; then
    wget http://repo.steampowered.com/steam/archive/precise/steam_latest.deb
fi
# Install package(s)
echo 'Installing Steam...'
echo 'Requires root privileges:'
sudo dpkg -i steam*.deb
sudo apt-get install -fy
# Cleanup and finish
rm steam*.deb
cd
echo 'Done.'
# Sublime Text 3 (build 3059)
echo 'Downloading Sublime Text 3 (build 3059)...'
# Add Repository
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
# Install package(s)
echo 'Installing Sublime Text 3 (build 3059)...'
echo 'Requires root privileges:'
sudo apt-get update; sudo apt-get install -y sublime-text-installer
# Create symbolic link
echo 'Creating symbolic link...'
echo 'Requires root privileges:'
sudo ln -sf /opt/sublime_text/sublime_text /usr/bin/sublime
echo 'Done.'
cd
echo 'Done.'
# Spotify
echo 'Adding Spotify repository to sources...'
echo 'Creating apt list file...'
touch spotify.list
echo "deb http://repository.spotify.com stable non-free" >> spotify.list
echo 'Moving spotify.list to /etc/apt/sources.list.d/'
echo 'Requires root privileges:'
sudo mv -f spotify.list /etc/apt/sources.list.d/
echo 'Done.'
# Update repository information
echo 'Adding repository key and updating repository information...'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
sudo apt-get update
# Install package(s)
echo 'Installing Spotify client...'
sudo apt-get install -y spotify-client
echo 'Done.'
}