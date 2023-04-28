#!/bin/bash
read -p "Введите значение переменной NIBIRU_MONIKER: " $NIBIRU_MONIKER=
while [[ -z $NIBIRU_MONIKER ]]; do
    read -p "Введите значение: " $NIBIRU_MONIKER
done
echo "Вы ввели: $NIBIRU_MONIKER"
export NIBIRU_MONIKER='$NIBIRU_MONIKER'

read -p "Введите значение переменной NIBIRU_WALLET: " $NIBIRU_WALLET=
while [[ -z $NIBIRU_WALLET ]]; do
    read -p "Введите значение: " $NIBIRU_WALLET
done
echo "Вы ввели: $NIBIRU_WALLET"
export NIBIRU_WALLET='$NIBIRU_WALLET'
