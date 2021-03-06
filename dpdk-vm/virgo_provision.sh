#!/usr/bin/env bash

apt-get install -y gcc make libvirt-bin python python-pip libnuma-dev
mkdir -p /opt/nfv
cd /opt/nfv

# install DPDK
wget http://fast.dpdk.org/rel/dpdk-16.07.tar.xz
tar -xvf dpdk-16.07.tar.xz
export RTE_SDK=$(pwd)/dpdk-16.07
export RTE_TARGET=x86_64-native-linuxapp-gcc
cd $RTE_SDK
make config T=$RTE_TARGET
make install T=$RTE_TARGET DESTDIR=dpdk-install

# install DPDK 2nd version
cd /opt/nfv
wget http://fast.dpdk.org/rel/dpdk-17.11.3.tar.xz
tar -xvf dpdk-17.11.3.tar.xz
mv dpdk-stable-17.11.3 dpdk-17.11.3
export RTE_SDK=$(pwd)/dpdk-17.11.3
export RTE_TARGET=x86_64-native-linuxapp-gcc
cd $RTE_SDK
make config T=$RTE_TARGET
make install T=$RTE_TARGET DESTDIR=dpdk-install

# install T-Rex
mkdir -p /opt/nfv/trex
cd /opt/nfv/trex
wget --no-cache http://trex-tgn.cisco.com/trex/release/v2.45.tar.gz
tar zxvf v2.45.tar.gz

# install scapy
pip install scapy
