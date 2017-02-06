#!/bin/bash

if [ ! -e "$HOME/.bitcoin/bitcoin.conf" ]; then
    echo "Creating bitcoin.conf"

    touch $HOME/.bitcoin/bitcoin.conf

    read -d '' conf <<- EOF
# Run in daemon mode
daemon=1

# Long running Bitcoin Nodes on the Tor Network
# http://nodes.bitcoin.st/tor/
addnode=pqosrh6wfaucet32.onion
addnode=btc4xysqsf3mmab4.onion
addnode=gb5ypqt63du3wfhn.onion
addnode=3lxko7l4245bxhex.onion

# Verified Online Bitcoin nodes on the Tor Network from
# https://rossbennetts.com/2015/04/running-bitcoind-via-tor/
addnode=kjy2eqzk4zwi5zd3.onion
addnode=it2pj4f7657g3rhi.onion

# Verified Online Bitcoin nodes on the Tor Network from
# https://en.bitcoin.it/wiki/Fallback_Nodes#Tor_nodes
addnode=hhiv5pnxenvbf4am.onion
addnode=bpdlwholl7rnkrkw.onion
addnode=vso3r6cmjoomhhgg.onion
addnode=kjy2eqzk4zwi5zd3.onion

# Verified Online Bitcoin nodes on the Tor Network from
# https://sky-ip.org
addnode=h2vlpudzphzqxutd.onion
addnode=xyp7oeeoptq7jllb.onion

# Only connect to onion nodes
onlynet=onion

# Proxy outgoing connections through ToR
proxy=127.0.0.1:9050

# Listen for incoming (over ToR)
listen=1

# RPC user and password for bitcoin-cli
rpcuser=${RPCUSER:-bitcoinrpc}
rpcpassword=${RPCPASSWORD:-`dd if=/dev/urandom bs=33 count=1 2>/dev/null | base64`}

# Only keep the last 2200 blocks (still a full node)
prune=2200

# Max 2MB block size
blockmaxsize=2000000
EOF

    echo "$conf" > $HOME/.bitcoin/bitcoin.conf
fi

rm -f ~/.bitcoin/peers.dat
rm -f ~/.bitcoin/onion_private_key

supervisord
