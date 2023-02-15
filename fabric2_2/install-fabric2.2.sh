#!/bin/bash -x


#Script based on:
# https://medium.com/@eSizeDave/https-medium-com-esizedave-how-to-install-hyperledger-fabric-1-2-on-ubuntu-16-04-lts-ecdfa4dcec72
# https://hyperledger-fabric.readthedocs.io/en/latest/prereqs.html

if [[ "$EUID" -ne 0 ]]; then
	echo "Must run with sudo"
	exit
fi

main(){

	if [[ $1 = "--version" ]]; then
		show_versions
		exit 0
	fi

	apt-get update

	install_docker
	install_node
	install_fabric_samples

	# install_go
	# apt-get install python build-essential -y
	echo "lougout and login"
}

usage () {
	echo "$PROGNAME: usage: $PROGNAME [--version]"
	return
}



install_docker(){
	# Docker
	# https://docs.docker.com/engine/install/ubuntu/

	apt-get install \
		ca-certificates \
    curl \
    gnupg \
    lsb-release -y

	mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

	echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

	apt-get update

	apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

	# https://docs.docker.com/install/linux/linux-postinstall/
	groupadd docker
	usermod -aG docker $SUDO_USER

	# newgrp docker
	sudo -u $SUDO_USER docker run hello-world

	docker --version
	docker compose version

	#https://stackoverflow.com/questions/36685980/why-is-docker-installed-but-not-docker-compose
	sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
	sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
	sudo chmod +x /usr/bin/docker-compose
}

install_go(){

	# https://golang.org/doc/install

	sudo -u $SUDO_USER curl https://dl.google.com/go/go1.13.7.linux-amd64.tar.gz -o go.tar.gz

	sudo -u $SUDO_USER sha256sum go.tar.gz
	sudo -u $SUDO_USER tar -xvf go.tar.gz
	mv go /usr/local
	rm ./go.tar.gz

	sudo -u $SUDO_USER tee -a ~/.profile <<- '_EOF_'

	# GO Configuration
	export GOPATH=$HOME/go
	export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

	_EOF_

	export GOPATH=$HOME/go
	export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

	go version
}

install_node(){
	# https://github.com/nvm-sh/nvm

	sudo -u $SUDO_USER sh -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash'

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

	source $NVM_DIR/nvm.sh;

	#Need to do manually
	echo "nvm install v14"
	echo "nvm use node v14"

	node --version
}

install_fabric_samples(){
	# https://hyperledger-fabric.readthedocs.io/en/release-2.2/test_network.html
	curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.2 1.4.9
	sudo -u $SUDO_USER mkdir -p /home/vagrant/hyperledger
	sudo -u $SUDO_USER mv ./fabric-samples /home/vagrant/hyperledger/

	sudo -u $SUDO_USER tee -a /home/vagrant/.profile <<- '_EOF_'

	# Fabric bins
	export PATH=/home/vagrant/hyperledger/fabric-samples/bin:$PATH

	_EOF_

	export PATH=/home/vagrant/hyperledger/fabric-samples/bin:$PATH
}

show_versions(){
	echo "-----------------------------"
	docker --version
	docker-compose --version
	node --version
	peer version
	orderer version
	fabric-ca-server version

	# go version
	# python --version

}

main "$@"
