#!/bin/bash

if [[ -z "$NIBIRU_MONIKER" ]]; then
  read -p "Enter your NIBIRU_MONIKER name : " _NIBIRU_MONIKER
  export NIBIRU_MONIKER=$_NIBIRU_MONIKER
fi

echo 'export NIBIRU_MONIKER='\"$NIBIRU_MONIKER\" >> $HOME/.bash_profile
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
source $HOME/.bash_profile
