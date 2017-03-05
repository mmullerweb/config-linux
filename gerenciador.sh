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
	cd scripts
        ./lamp.sh | tee >(zenity --progress --auto-close --pulsate)
	zenity --info --text="LAMP FULL instalado!!!"
        cd ..
	./gerenciador.sh
fi;


if [ "$choice" == "KEYBOARD ABNT2" ]; then
        cd scripts
        ./keyboard-abnt2.sh | tee >(zenity --progress --auto-close --pulsate)
	zenity --info --text="KEYBOARD ABNT2 configurado!!!"
        cd ..
        ./gerenciador.sh
fi;

if [ "$choice" == "IMPRESSORA SAMSUNG" ]; then
        cd scripts
        ./printer-samsung.sh | tee >(zenity --progress --auto-close --pulsate)
        zenity --info --text="IMPRESSORA SAMSUNG configurada!!!"
        cd ..
        ./gerenciador.sh
fi;
