#!/bin/bash

ruta=""

until [ -e "$ruta" ]; do #La 'e" es de Exist. Así que sigue hasta que la ruta exista.
	read -p "Introduce la ruta de un fichero: " ruta # La p es para poner texto
	if [ ! -e "$ruta" ]; then # Si no existe, hace esta condición.
		echo "La ruta no es válida, pon otra."
	elif [ "$num" = "sortir" ]; then
		exit 0
	fi
done

echo "La ruta '$ruta' es válida"


#Esto es para que se escoja un número del 1 al 5
num="6"
#Para añadir doble condición se hace así
while [[ ! "$num" =~ ^[0-9]+$ ]] || [ "$num" -lt 1 ] || [ "$num" -gt 5 ]; do #Re resto es lógica pura.
	read -p "Introduce un número del 1 al 5: " num
	if [ "$num" -lt 1 ] || [ "$num" -gt 5 ] && [[ "$num" =~ ^[0-9]+$ ]]; then
		echo "El número no está dentro del rango pormenorizado, o bien no es un número."
	fi
done

#Esto es lo que pide el punto 3, no tiene más misterio que un while normal.
while [ "$num" -gt 0 ]; do
	echo "Procesando el elemento en '$num' segundos..."
	num=$((num - 1)) #Así se resta
done
