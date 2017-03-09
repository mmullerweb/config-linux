#!/bin/bash


#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# Script para instalar php+mysql+apache+phpmyadmin para 
# desenvolvedores....
#
#
# Martin <mmuller.web@gmail.com>
# escovadordebit.blogspot.com!
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


####### Instalando apache 2
yes '' | sudo apt-get install apache2
###### Instalando MYSQL
yes '' | sudo apt-get install mysql-server
##### Adicionando Repositorio PHP5 e instalando pacotes necessrios
yes '' | sudo add-apt-repository ppa:ondrej/php
yes '' | sudo apt-get install software-properties-common
yes '' | sudo apt-get update
yes '' | sudo apt-get install php5.6
yes '' | sudo apt-get install php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-xml
#### Instalando PHPMYADMIN
#sudo apt-get install libapache2-mod-php5
sudo apt-get install phpmyadmin
#### Mais um BUG idiota do PHPMYADMIN
sudo mv /usr/share/php/php-gettext/ /usr/share/php/php-gettext.old/
sudo mv /usr/share/php/php-php-gettext/ /usr/share/php/php-gettext/
#### Criando link do phpmyadmin dentro do apache BUG ridiculo
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/sites-enabled/phpmyadmin.conf
#### Adicionando rewrite module para cakephp funcionar :)
sudo a2enmod rewrite
#### Apontando para www dentro da pasta home mais facil para as pessoas manipularem arquivos..... :)
./lamp/lamp-sites.sh
mkdir "/home/$USER/www"
#### Restart da bagaca do apache
sudo /etc/init.d/apache2 restart

