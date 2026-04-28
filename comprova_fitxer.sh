#!/bin/bash

# Pedimos la ruta que tiene que introducir
read -p "Dime la ruta a verificar: " RUTA

# Esto valida que no esté vacío lo de ruta
if [ -z "$RUTA" ]; then #Claro, "z' de ZERO. Ni idea si es así, pero para mí será así ahora
	echo "No has puesto ruta, por tanto, no podemos comprobarlo."
	exit 1 #Esto es para que finalice el programa forzadamente.
fi

#1. Aquí comprueba si la ruta existe.
if [ -e "$RUTA" ]; then
	echo "La ruta existir, existe."

	#No cerramos todavía el if, nos viene bien para el ejercicio
	#2. Comprueba de que tipo es.
	if [ -f "$RUTA" ]; then #f de file, sobre si es un file o no.
		echo "Es un fichero."
	elif [ -d "$RUTA" ]; then #d de directory, klaro. :D
		echo "Es un directorio."
	else
		echo "No es ni un fichero ni un directorio, es otra cosa."
	fi

	#3. Esto ya comprueba los permisos de lectura, nada más.
	if [ -r "$RUTA" ]; then #Y, entiendo que -r es read, de lectura.
		echo "Además, tienes permisos de lectura. Que chulo. ^^"
	else
		echo "No tienes permisos de lectura sobre esto."
	fi

else
	echo "La ruta, existir lo que viene siendo existir, no existe."
fi
#Fin del script :D
