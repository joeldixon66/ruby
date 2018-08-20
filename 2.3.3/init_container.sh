#!/usr/bin/env bash
cat >/etc/motd <<EOL 
  _____                               
  /  _  \ __________ _________   ____  
 /  /_\  \\___   /  |  \_  __ \_/ __ \ 
/    |    \/    /|  |  /|  | \/\  ___/ 
\____|__  /_____ \____/ |__|    \___  >
        \/      \/                  \/ 
A P P   S E R V I C E   O N   L I N U X

Documentation: http://aka.ms/webapp-linux
Ruby quickstart: https://aka.ms/ruby-qs
ImageMagick ruby 2.4.0

EOL
cat /etc/motd

service ssh start

# Get environment variables to show up in SSH session
eval $(printenv | awk -F= '{print "export " $1"="$2 }' >> /etc/profile)

eval "$(rbenv init -)"
echo "LD_LIBRARY_PATH - $LD_LIBRARY_PATH"
rbenv global 2.4.0
/opt/startup.sh "$@"

