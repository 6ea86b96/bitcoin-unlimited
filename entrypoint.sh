#!/bin/bash

if [ ! -e "$HOME/.bitcoin/bitcoin.conf" ]; then
    echo "Creating bitcoin.conf"

    touch $HOME/.bitcoin/bitcoin.conf

    printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n" \
        "daemon=1" \
        "addnode=yu7sezmixhmyljn4.onion" \
        "addnode=4iuf2zac6aq3ndrb.onion" \
        "addnode=ccfxptj3yi2ysa7w.onion" \
        "onlynet=tor" \
        "proxy=127.0.0.1:9050" \
        "listen=1" \
        "rpcuser=${RPCUSER:-bitcoinrpc}" \
        "rpcpassword=${RPCPASSWORD:-`dd if=/dev/urandom bs=33 count=1 2>/dev/null | base64`}" \
        >> $HOME/.bitcoin/bitcoin.conf
fi

rm -f ~/.bitcoin/peers.dat

supervisord
