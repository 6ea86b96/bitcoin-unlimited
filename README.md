# Bitcoin Unlimited Docker

A Bitcoin Unlimited daemon running through ToR

## Prerequisits

https://docs.docker.com/engine/installation/

## Getting Started

First make a bitcoin directory on your host machine

```bash
mkdir -p /some/path/.bitcoin
```

Then start bitcoin unlimited

```bash
docker run -d \
    --name bitcoin \
    --restart always \
    -v "/some/path/.bitcoin:/root/.bitcoin" \
    -p "8333:8333" \
    0e8bee02/bitcoin-unlimited
```

That's it!

On first run a bitcoin.conf will be generated. Currently defaults are pruning
the blockchain to the last 2200 blocks and allowing maximum block size of 2MB.

If you want to make changes to the config just edit the bitcoin.conf file on the
host machine and then restart the docker container.
