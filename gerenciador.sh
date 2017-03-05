#!/bin/bash

yes '' | sudo apt-get install zenity


choice=$(zenity --list \
--title="Selecione instalacao" \
--text "Selecione uma opcao para instalar..." \
--radiolist \
--column "X" \
--column "Install :)" \
FALSE "LAMP FULL" \
FALSE "KEYBOARD ABNT2" \
FALSE "IMPRESSORA SAMSUNG")


if [ "$choice" == "LAMP FULL" ]; then
	./lamp.sh | tee >(zenity --progress --auto-close --pulsate)
#	echo $?
	if [ "$?" == "0" ]; then
		zenity --info --text="LAMP FULL instalado!!!"
		./gerenciador.sh
	fi;
fi;


if [ "$choice" == "KEYBOARD ABNT2" ]; then
        ./keyboard-abnt2.sh | tee >(zenity --progress --auto-close --pulsate)
#       echo $?
        if [ "$?" == "0" ]; then
		zenity --info --text="KEYBOARD ABNT2 configurado!!!"
                ./gerenciador.sh
        fi;
fi;

if [ "$choice" == "IMPRESSORA SAMSUNG" ]; then
        ./printer-samsung.sh | tee >(zenity --progress --auto-close --pulsate)
#       echo $?
        if [ "$?" == "0" ]; then
                zenity --info --text="IMPRESSORA SAMSUNG configurada!!!"
                ./gerenciador.sh
        fi;
fi;
