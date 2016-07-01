#!/bin/bash
/root/c9sdk
git pull origin master
scripts/install-sdk.sh
forever server.js -p $PORT -l $HOST -w /workspace -a $USERNAME:$PASSWORD
