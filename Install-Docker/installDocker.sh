#!/bin/sh
echo --------------------------------------------
echo Installing Script, Docker created by: Uqutub
echo --------------------------------------------
echo Updating the apt package index:
echo --------------------------------------------
sudo apt-get update
echo -------------------------------------------- 
echo Installing packages to allow apt to use a repository over HTTPS:
echo --------------------------------------------
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
echo --------------------------------------------
echo Adding Docker’s official key GPG
echo --------------------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo --------------------------------------------
echo Verifying that you now have the key with fingerprint:
echo --------------------------------------------
sudo apt-key fingerprint 0EBFCD88
echo --------------------------------------------
echo sub-command below returns the name of your Ubuntu distribution:
echo --------------------------------------------
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo --------------------------------------------
echo Updating the apt package index:
echo --------------------------------------------
sudo apt-get update
echo --------------------------------------------
echo Installing the latest version of Docker CE and containerd,
echo --------------------------------------------
sudo apt-get -y install docker-ce docker-ce-cli containerd.io