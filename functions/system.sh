# INSTALL SYSTEM TOOLS
function system {

echo ''
echo 'Installing favourite system utilities...'
echo ''
echo 'Current package list:
aptitude
dconf-tools
openjdk-7-jdk
openssh-server
p7zip-full
ppa-purge
python-soappy
samba
ssh
supybot
symlinks
virt-manager
zsync'
echo ''
# Feel free to change to whatever suits your preferences.
sudo apt-get install -y --no-install-recommends aptitude dconf-tools openjdk-7-jdk openssh-server p7zip-full ppa-purge python-soappy samba ssh supybot symlinks  virt-manager zsync

# Return back to previous directory
cd -

echo 'Done.'
}