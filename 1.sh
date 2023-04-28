#!/bin/bash
read -p "Введите значение переменной: " NIBIRU_MONIKER
if [[ -z "$NIBIRU_MONIKER" ]]; then
    echo "Вы не ввели значение!"
    exit 1
fi
echo "Вы ввели: $NIBIRU_MONIKER"
export NIBIRU_MONIKER

read -p "Введите значение переменной: " NIBIRU_WALLET
if [[ -z "$NIBIRU_WALLET" ]]; then
    echo "Вы не ввели значение!"
    exit 1
fi
echo "Вы ввели: $NIBIRU_WALLET"
export NIBIRU_WALLET
