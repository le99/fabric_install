# Installation scripts for Hyperledger Fabric 1.4 and 2.0 on Linux
These scripts were tested in Ubuntu 18.04

## Installing Fabric 1.4
Run the script in `fabric1`
```bash
sudo ./install-fabric1.4.sh
```

The script will install:
* Docker
* Docker Compose 1.25.3
* Go 1.12.16
* Node.js 10, with NVM
* Python 2
* Fabric 1.4
* Fabric Samples in `/usr/local/hyperledger/`

A Vagrant box with fabric installed can be found at:
https://app.vagrantup.com/le99/boxes/fabric1.4.4

This script was based on:
* [The Fabric Documentation](https://hyperledger-fabric.readthedocs.io/en/release-1.4/prereqs.html)
* [David Habibi, How to install Hyperledger Fabric 1.2 on Ubuntu 16.04 LTS](https://medium.com/@eSizeDave/https-medium-com-esizedave-how-to-install-hyperledger-fabric-1-2-on-ubuntu-16-04-lts-ecdfa4dcec72)

## Installing Fabric 2.0
Run the script in `fabric1`
```bash
sudo ./install-fabric2.0.sh
```

The script will install:
* Docker
* Docker Compose 1.25.3
* Go 1.13.7
* Node.js 10, with NVM
* Python 2
* Fabric 2.0
* Fabric Samples in `/usr/local/hyperledger/`

A Vagrant box with fabric installed can be found at:
https://app.vagrantup.com/le99/boxes/fabric2.0.0

This script was based on:
* [The Fabric Documentation](https://hyperledger-fabric.readthedocs.io/en/latest/prereqs.html)
* [David Habibi, How to install Hyperledger Fabric 1.2 on Ubuntu 16.04 LTS](https://medium.com/@eSizeDave/https-medium-com-esizedave-how-to-install-hyperledger-fabric-1-2-on-ubuntu-16-04-lts-ecdfa4dcec72)
