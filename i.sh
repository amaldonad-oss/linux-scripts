#!/bin/bash

#Esto ha sido hecho por ChatGPT, y, no es que no entienda lo que ha hecho
#la IA, sino que no entiendo por qué haría así, con un script, una actualización
#o instalación de paquetes, por legítimo y coherente que fuera, es que incluso
#haciéndolo en masa, prefiero controlar esto a mano.

#variables con los paquetes a instalar (esto me choca, no sé por qué
#instalaría esto, nunca lo he usado (a excepción del git)).
PAQUETS="vim git curl"

#Actualización lista de paquetes
echo "Actualizando lista de paquetes. :v"
sudo apt update
#En una conversación que tuve con Miguel, un alumno de 1.ºSMX y buen amigo mío,
#me dijo que no sabía qué era el update y el upgrade. Pongo en tela de juicio
#de que no lo haya visto en clase (encima repitió). Es grave no saberse eso
#tan básico, ¿no?

#Actualización del sistema
echo "Actualizando sistema... (la base de datos de virus, ha sido actualizada)"
sudo apt upgrade -y

#Instalar paquetes (los que no comprendo, vaya)
echo "Instalando los siguientes paquetes: $PAQUETS"
sudo apt install -y $PAQUETS

echo "Ya ta :D"
