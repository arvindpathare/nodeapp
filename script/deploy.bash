#!/bin/sh
ssh -T ec2-user@52.66.201.253 <<EOF
    cd ~/node-app
	yum install git -y
    git pull origin master
    curl -o-   https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
    . ~/.nvm/nvm.sh
    nvm install v10.11.0
    npm install
    npm install -g nodemon pm2
    pm2 restart ecosystem.config.js
    exit
EOF