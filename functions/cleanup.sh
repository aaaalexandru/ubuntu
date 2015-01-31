# CLEANUP SYSTEM
function cleanup {
echo ''
echo '1. Remove unused pre-installed packages'
echo '2. Remove old kernel(s)'
echo '3. Remove orphaned packages'
echo '4. Remove leftover configuration files'
echo '5. Clean package cache'
echo 'Removing selected pre-installed applications...'
echo 'Requires root privileges:'
sudo apt-get purge landscape-client-ui-install ubuntuone-control-panel* overlay*
echo 'Done.'
# Remove Old Kernel
echo 'Removing old Kernel(s)...'
echo 'Requires root privileges:'
sudo dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | grep -v linux-libc-dev | xargs sudo apt-get -y purge
echo 'Done.'
# Remove Orphaned Packages
echo 'Removing orphaned packages...'
echo 'Requires root privileges:'
sudo apt-get autoremove -y
echo 'Done.'
# Remove residual config files?
echo 'Removing leftover configuration files...'
echo 'Requires root privileges:'
sudo dpkg --purge $(COLUMNS=200 dpkg -l | grep '^rc' | tr -s ' ' | cut -d ' ' -f 2)
echo 'Done.'
# Clean Package Cache
echo 'Cleaning package cache...'
echo 'Requires root privileges:'
sudo apt-get clean
echo 'Done.'
}