
#!/bin/bash
# Enter into ~/.bashrc :
# alias ess='source ~/scripts/enable-solo-site.sh'

if [ "$1" == "" ]
  then
  echo "You need to enter a site to enable";

elif [ "$1" == "--list" ]
  then
  ls /etc/apache2/sites-available/;

else

  # Check if site is not already enabled
  if [ `grep "$1" /etc/apache2/sites-enabled/* | wc -l` -eq "0" ];
    then
    #echo "Disabling all sites"
    #sudo rm -Rf /etc/apache2/sites-enabled/*
    echo "Enabling $1"
    sudo a2ensite "$1"
    echo "Restarting Apache"
    sudo service apache2 reload
  fi

fi




echo 'Done.'
