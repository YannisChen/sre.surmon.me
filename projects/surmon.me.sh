#!/bin/bash
 
WEB_PATH='/usr/local/wwwroot/surmon.me'
WEB_USER='root'
WEB_USERGROUP='root'
 
echo "Start deployment Surmon.me"
cd $WEB_PATH
echo "pulling source code..."
# git reset --hard origin/release
# git clean -f
git pull
git checkout master
echo "changing permissions..."
chown -R $WEB_USER:$WEB_USERGROUP $WEB_PATH
sudo pm2 stop surmon.me
npm run build && sudo pm2 restart surmon.me
echo "Finished."
