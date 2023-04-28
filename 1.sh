#!/bin/bash

#!/bin/bash

read -p "Введите значение для NIBIRU_MONIKER: " NIBIRU_MONIKER
read -p "Введите значение для NIBIRU_WALLET: " NIBIRU_WALLET

export NIBIRU_MONIKER=$NIBIRU_MONIKER
export NIBIRU_WALLET=$NIBIRU_WALLET

echo "Значения успешно присвоены:"
echo "NIBIRU_MONIKER=${NIBIRU_MONIKER}"
echo "NIBIRU_WALLET=${NIBIRU_WALLET}"

NIBIRU_CHAIN="nibiru-itn-1"

echo 'export NIBIRU_MONIKER='${NIBIRU_MONIKER} >> $HOME/.bash_profile
echo 'export NIBIRU_CHAIN='${NIBIRU_CHAIN} >> $HOME/.bash_profile
echo 'export NIBIRU_WALLET='${NIBIRU_WALLET} >> $HOME/.bash_profile
source $HOME/.bash_profile
