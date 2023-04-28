#!/bin/bash

#!/bin/bash

read -p "Введите значение для MONIKER: " MONIKER
read -p "Введите значение для WALLET: " WALLET

export MONIKER=$MONIKER
export WALLET=$WALLET

echo "Значения успешно присвоены:"
echo "MONIKER=${MONIKER}"
echo "WALLET=${WALLET}"

NIBIRU_CHAIN="nibiru-itn-1"

echo 'export MONIKER='${MONIKER} >> $HOME/.bash_profile
echo 'export NIBIRU_CHAIN='${NIBIRU_CHAIN} >> $HOME/.bash_profile
echo 'export WALLET='${WALLET} >> $HOME/.bash_profile
source $HOME/.bash_profile
