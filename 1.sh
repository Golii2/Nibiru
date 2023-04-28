#!/bin/bash
while [[ -z $NIBIRU_MONIKER ]]; do
    read -p "Введите значение для NIBIRU_MONIKER: " NIBIRU_MONIKER
done

echo "Вы ввели: $NIBIRU_MONIKER"

while [[ -z $NIBIRU_WALLET ]]; do
    read -p "Введите значение для NIBIRU_WALLET: " NIBIRU_WALLET

done

echo "Вы ввели: $NIBIRU_WALLET"
