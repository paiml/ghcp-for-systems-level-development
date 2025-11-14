#!/bin/bash
# Messy deployment script with quality issues

d=$1
e=$2

if [ -z $d ]; then
echo "need dir"
exit 1
fi

echo deploying to $d

cd $d
git pull
npm install

if [ $e == "prod" ]; then
npm run build
cp -r dist /var/www/html
sudo systemctl restart nginx
fi

echo done
