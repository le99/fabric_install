# Installation scripts for Hyperledger Fabric 1.4, 2.0 and 2.2 on Linux
These scripts were tested in Ubuntu 18.04

## Vagrant 

## Installing Fabric 2.2
Run the script in `fabric2_2`
```bash
sudo ./install-fabric2.0.sh
```
The script will install:
* Docker 20.10.17
* Docker Compose v2.6.0
* Node.js 14, with NVM
* Fabric 2.2
* Fabric Samples in `/home/vagrant/hyperledger/fabric-samples`

A Vagrant box with fabric installed can be found at:
https://app.vagrantup.com/le999/boxes/fabric2.2.0

This script was based on:
* [The Fabric Documentation](https://hyperledger-fabric.readthedocs.io/en/release-2.2/prereqs.html)
* [Fabric samples](https://github.com/hyperledger/fabric-samples.git)

## Installing Fabric 2.0
Run the script in `fabric2`
```bash
sudo ./install-fabric2.2.sh
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
