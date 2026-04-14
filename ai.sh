#!/bin/bash

# Este script tiene como objeto actualizar el sistema e instalar cosas.
# Asimismo, pasa cosas por parámetros, lo cual a ciencia cierta no sé cómo hace, y por ello
#ChatGPT ha tenido a bien ayudarme

#Esto por lo que se ve, comprueba que se haya pasado algún parámetro (o si se ha usado).
if [ $# -eq 0 ]; then #La almuadilla es el número de parámetros que se han pasado al script.
#De modo que si el pasas el vim, el git y tal, pues van sumando. Y si no se usan, el programa
#se queja y te dije cómo funciona
    echo "Chiquillo, se usa así: './ai.sh [paquete 1 (verbigracia, vim)] [paquete 2]...', sin corchetes ni comillas"
    exit 1 #Esto es la forma que  termina el script. Si pones exit es que se acaba sin perjuicio
# de lo que pase ahí, y el 1 es que se acaba con un error, de que no se ha pasado parámetro, claro.
fi #Esto es el cierre del if. En Java se abre y se cierra con "{}', y aquí, pues no, con if e fi

#Actualización de repositiorios 

#vamos, esto es la película de siempre de hace 2 actividades que todavía
#arrastramos. Si ya me parecía poco servible los anteriores scripts, este es el que menos entiendo,
#pasas un parámetro sin motivo alguno cuando no haría falta :v. Comprenderé que solo es para
#aprender a usarlo y que esto no es nada útil en la realidad.

echo "Actualizando repositorios..."
sudo apt update

#Actualiza el sistema
echo "Actualizando sistema..."
sudo apt upgrade -y

#Instalar paquetes
echo "Instalar paquetes: $@"
sudo apt install -y "$@" #Claro, esto lo escribe todo (el comentario de abajo lo explica)
echo "Final del script"
#Vale, los parámetros que se pasan son del palo $1, $2, $3, no son  variables,
#van por orden de inserción. Pero cuando usas el $@, significa que, todos los parámetros pasados, 
#se usan. Esta información me resulta bastante conciliadora con para el ejercicio, aunqie todavía pongo
#en tela de juicio su funcionalidad.
