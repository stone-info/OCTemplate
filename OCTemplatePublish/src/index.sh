#!/usr/bin/env bash

#filePath="../../OCTemplate.podspec"
#
##cat $filePath
#
#
#sed -E -n -e '/^ *spec.version/p' $filePath
#
##sed -E -n -e '/^ *spec.version/s/.*/spec.version = "0.0.2"/gp' $filePath

#cd ../../
#
#git add .
#git status
##git commit -m "update repo ${1}"
##git tag "$1"
##git push --tags

cd ..

git add .
git commit -m "update podspec ${1}"
git push

#git add .
#git commit -m "update repo ${1}"
git tag "$1"
git push --tags

#git status
#echo $1
