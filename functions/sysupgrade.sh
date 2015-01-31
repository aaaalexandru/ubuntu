# SYSTEM UPGRADE
function sysupgrade {
# Perform system upgrade
echo ''
# Update repository information
echo 'Updating repository information...'
echo 'Requires root privileges:'
sudo apt-get update
# Dist-Upgrade
echo 'Performing system upgrade...'
sudo apt-get dist-upgrade -y
echo 'Done.'
}