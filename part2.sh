#!/bin/bash

nibid keys add $NIBIRU_WALLET --recover
NIBIRU_ADDR=$(nibid keys show $NIBIRU_WALLET -a)
echo 'export NIBIRU_ADDR='${NIBIRU_ADDR} >> $HOME/.bash_profile
source $HOME/.bash_profile

nibid query bank balances $NIBIRU_ADDR
sleep 5

nibid tx staking create-validator \
--amount 10000000unibi \
--commission-max-change-rate "0.1" \
--commission-max-rate "0.20" \
--commission-rate "0.1" \
--min-self-delegation "1" \
--pubkey=$(nibid tendermint show-validator) \
--moniker $NIBIRU_MONIKER \
--chain-id nibiru-itn-1 \
--from $NIBIRU_WALLET \
--fees 5000unibi

NIBIRU_VALOPER=$(nibid keys show $NIBIRU_ADDR --bech val -a)

echo 'export NIBIRU_VALOPER='${NIBIRU_VALOPER} >> $HOME/.bash_profile
source $HOME/.bash_profile
nibid query staking validator $NIBIRU_VALOPER
