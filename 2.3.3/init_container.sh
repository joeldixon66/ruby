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
ImageMagick ld_library_path

EOL
cat /etc/motd

service ssh start

# Get environment variables to show up in SSH session
eval $(printenv | awk -F= '{print "export " $1"="$2 }' >> /etc/profile)

eval "$(rbenv init -)"
export LD_LIBRARY_PATH=/usr/local/lib
echo "LD_LIBRARY_PATH - $LD_LIBRARY_PATH"
rbenv global 2.3.3
/opt/startup.sh "$@"

