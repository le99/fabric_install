#!/bin/bash -x

rsync --verbose -a -z --delete --exclude=node_modules ./ /home/vagrant/workspace/
