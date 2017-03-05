#!/bin/bash

sudo sed -ie "s/\/var\/www\/html/\/home\/$USER\/www/g" /etc/apache2/sites-available/000-default.conf
sudo sed -ie "s/Directory \/var\/www\//Directory \/home\/$USER\/www\//g" /etc/apache2/apache2.conf

