#!/bin/bash
yes '' | sudo apt-get install python-software-properties
yes '' | sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

sudo apt-get install oracle-java8-installer
