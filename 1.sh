#!/bin/bash

read -p "Введите значение для NIBIRU_MONIKER: " NIBIRU_MONIKER
read -p "Введите значение для NIBIRU_WALLET: " NIBIRU_WALLET

export NIBIRU_MONIKER=$NIBIRU_MONIKER
export NIBIRU_WALLET=$NIBIRU_WALLET

echo "Значения успешно присвоены:"
echo "NIBIRU_MONIKER=${NIBIRU_MONIKER}"
echo "NIBIRU_WALLET=${NIBIRU_WALLET}"
