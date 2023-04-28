#!/bin/bash

# Запрашиваем у пользователя значение для переменной
echo "Введите значение для переменной NIBIRU_MONIKER:"
read NIBIRU_MONIKER

# Присваиваем введенное значение переменной NIBIRU_MONIKER
export NIBIRU_MONIKER="$NIBIRU_MONIKER"

# Подтверждаем, что значение переменной успешно задано
echo "Значение переменной NIBIRU_MONIKER: $NIBIRU_MONIKER"

# Запрашиваем у пользователя значение для переменной
echo "Введите значение для переменной NIBIRU_WALLET:"
read NIBIRU_WALLET

# Присваиваем введенное значение переменной NIBIRU_WALLET
export NIBIRU_WALLET="$NIBIRU_WALLET"

# Подтверждаем, что значение переменной успешно задано
echo "Значение переменной NIBIRU_WALLET: $NIBIRU_WALLET"
