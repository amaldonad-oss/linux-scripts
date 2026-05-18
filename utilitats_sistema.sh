#!/bin/bash

#Así se declara las funciones. Esta solo llama al nombre y lo pone por pantalla.
benvinguda() {
	local nombre="$1"
	echo "Hola $nombre, vamos a comprobar el sistema"
#El local sirve para que sea solo funcionales dentro de estos corchetes, dentro
# de la función (en Java no hacía falta declararlas per se, de daba por hecho
#que eran locales.
}

#Esto de aquí comprueba si el usuario existe o no en el sistema.
comprova_usuari() {
	local usuario="$1"
	if grep -q "^${usuario}:" /etc/passwd; then #Se hace así, no preguntaré demasiado.
		echo "El usuario '$usuario' sí existe en el sistema."
	else
		echo "El usuario '$usuario' no existe en el sistema."
	fi
}

#Esto muestra el espacio que hay en disco.
calculadora_espai() {
	echo "Espacio libre en la partición actual (/):"
	df -h / #especialmente esto es lo que lo muestra.
}


# Ahora, como en Java (o así lo hacía en Java), ponemos el "main".
read -p "Introduce tu nombre, por favor: " nombre_persona
benvinguda "$nombre_persona" #Y así se llama a la función. Esperos que hacerla más
#tarde no me cueste el aprobado... También, ponemos la variante para que furule

echo "" #para que sea más bonito

#La segunda función.
read -p "Introduce un nombre de usuario a comprobar: " nombre_usuario
comprova_usuari "$nombre_usuario"

echo ""

#Finalmente, la función automática.
calculadora_espai
