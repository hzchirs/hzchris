#!/bin/sh

if [[ $(git status -s) ]]
then
  cd ~/Projects/hzchris
  echo "Following files will be updated!"
  git status -s
  git add --all
  git commit -m "Regular update on: `date +%Y-%m-%d`"
  git push
else
  echo "Nothing have to update!"
fi
  
