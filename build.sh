#!/bin/bash

git config --global credential.helper "cache --timeout=40000"

[[ ! $1 ]] && {
	echo 'please provide comment'
	exit 0	
}

git pull

git add .
git commit -m "$1"
git push origin master
