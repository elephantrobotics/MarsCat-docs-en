#!/bin/env bash 
_install(){
  _core=$(uname)
  if [[ ${_core}=="Darwin" ]]; then
	brew install nodejs
  elif [[ ${_core}=="Linux" ]]; then
	_name=$(cat /etc/os-release  | grep "^NAME=" | cut -f 2 -d=)
	if [ ${_name}=="Ubuntu" ]; then
	  echo "ubuntu"
	  sudo apt install $1
	elif [ ${_name}=="Manjaro" ];then
	  echo "Manjaro"
	  sudo pacman -S nodejs
	else
	  echo "Please install nodejs use your system package manager"
	  exit
	fi
  else
    echo "Please install nodejs by yourself"
	exit
  fi
}

if [[ ! `which nodejs` ]]; then
  echo "Will install nodejs and npm..."
  _install nodejs
#   sudo apt install nodejs
else
  echo "Found nodejs"
fi

echo `pwd`
 # if has package.json
if [[ ! -e ./book.json ]]; then
  echo "dir not right, please go to right path and run this script"
  exit
fi

echo "Will install gitbook..."
sudo npm install -g gitbook-cli
sudo gitbook serve # build and run serve