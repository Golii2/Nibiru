#!/bin/bash

# Запрашиваем у пользователя значение для переменной
echo "Введите значение для переменной NIBIRU_MONIKER:"
read NIBIRU_MONIKER

# Присваиваем введенное значение переменной VARNAME
export NIBIRU_MONIKER="$NIBIRU_MONIKER"

# Подтверждаем, что значение переменной успешно задано
echo "Значение переменной VARNAME: $NIBIRU_MONIKER"

# Запрашиваем у пользователя значение для переменной
echo "Введите значение для переменной NIBIRU_WALLET:"
read NIBIRU_WALLET

# Присваиваем введенное значение переменной VARNAME
export NIBIRU_WALLET="$NIBIRU_WALLET"

# Подтверждаем, что значение переменной успешно задано
echo "Значение переменной VARNAME: $NIBIRU_WALLET"
