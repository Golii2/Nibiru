#!/bin/bash
#1
sudo apt install curl -y
#2
sudo apt update && sudo apt upgrade -y
#3
sudo apt install make clang pkg-config libssl-dev build-essential git gcc chrony curl jq ncdu bsdmainutils htop net-tools lsof fail2ban wget -y
#4
ver="1.19.4" && \
wget "https://golang.org/dl/go$ver.linux-amd64.tar.gz" && \
sudo rm -rf /usr/local/go && \
sudo tar -C /usr/local -xzf "go$ver.linux-amd64.tar.gz" && \
rm "go$ver.linux-amd64.tar.gz" && \
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile && \
source $HOME/.bash_profile && \
go version
#5
cd $HOME
git clone https://github.com/NibiruChain/nibiru.git
cd nibiru
git checkout v0.19.2
make build
#6
sudo mv ./build/nibid /usr/local/bin/
cd $HOME
echo "Complite, create user"

#read -p "Введите значение переменной NIBIRU_MONIKER: " NIBIRU_MONIKER
#echo "Переменная NIBIRU_MONIKER равна: $NIBIRU_MONIKER"

echo "Введите значение переменной:"
read NIBIRU_MONIKER
echo "Вы ввели: $NIBIRU_MONIKER"
export NIBIRU_MONIKER="$NIBIRU_MONIKER"

#read -p "Введите значение переменной NIBIRU_WALLET: " NIBIRU_WALLET
#echo "Переменная NIBIRU_WALLET равна: $NIBIRU_WALLET"

echo "Введите значение переменной:"
read NIBIRU_WALLET
echo "Вы ввели: $NIBIRU_WALLET"
export NIBIRU_WALLET="$NIBIRU_WALLET"

NIBIRU_CHAIN="nibiru-itn-1"
#1
echo 'export NIBIRU_MONIKER='${NIBIRU_MONIKER} >> $HOME/.bash_profile
echo 'export NIBIRU_CHAIN='${NIBIRU_CHAIN} >> $HOME/.bash_profile
echo 'export NIBIRU_WALLET='${NIBIRU_WALLET} >> $HOME/.bash_profile
source $HOME/.bash_profile
#2
nibid init $NIBIRU_MONIKER --chain-id $NIBIRU_CHAIN
#3
nibid config chain-id $NIBIRU_CHAIN
#4
curl -s https://rpc.itn-1.nibiru.fi/genesis | jq -r .result.genesis > $HOME/.nibid/config/genesis.json
#5
NETWORK=nibiru-itn-1
sed -i 's|seeds =.*|seeds = "'$(curl -s https://networks.itn.nibiru.fi/$NETWORK/seeds)'"|g' $HOME/.nibid/config/config.toml
#6
sed -i.bak 's/minimum-gas-prices =.*/minimum-gas-prices = "0.025unibi"/g' $HOME/.nibid/config/app.toml
#7
sudo tee /etc/systemd/system/nibid.service > /dev/null <<EOF
[Unit]
Description=nibid
After=network-online.target
[Service]
User=$USER
ExecStart=$(which nibid) start
Restart=on-failure
RestartSec=10
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF
#8
sudo systemctl daemon-reload
sudo systemctl enable nibid
sudo systemctl restart nibid
#9
NETWORK=nibiru-itn-1
sed -i 's|enable =.*|enable = true|g' $HOME/.nibid/config/config.toml
sed -i 's|rpc_servers =.*|rpc_servers = "'$(curl -s https://networks.itn.nibiru.fi/$NETWORK/rpc_servers)'"|g' $HOME/.nibid/config/config.toml
sed -i 's|trust_height =.*|trust_height = "'$(curl -s https://networks.itn.nibiru.fi/$NETWORK/trust_height)'"|g' $HOME/.nibid/config/config.toml
sed -i 's|trust_hash =.*|trust_hash = "'$(curl -s https://networks.itn.nibiru.fi/$NETWORK/trust_hash)'"|g' $HOME/.nibid/config/config.toml
#10
sudo journalctl -u nibid -f -o cat
