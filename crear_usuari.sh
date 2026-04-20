#!/bin/bash

clear

echo "Se va a proceder, su administrador/ejecutor, a crear un usuario."

#Muy buena parte del script nace de ChatGPT, pero por ello, se va a pormenorizar con detalle.
#Aquí pide el nombre de usuario
while true; do #Así se pone el bucle, no tiene más. Y el do y done es el {} de java,
#ya está, no es neurocirugía.
    read -p "Introduce el nombre de usuario: " USERNAME #Este de aquí, read,
#es un nuevo amiguito (a que lo meto en el Tomodachi Life: Una vida de ensueño), el cual
#permite introducir valores. Es como el input de Python. El -p es para que permita
#mostar un mensaje (como el System.out.print de Java).
    if [ -z "$USERNAME" ]; then #Importante, los corchetes son los paréntesis
#del lenguaje de guiones. El -z comprueba que no esté vacía la cadena.
#then indica qué hacer si se cumple la condición.
         echo "Error: El nombre de usuario, de ningún modo, ha de estar vacío." #En este caso, hace un error en forma de echo.
    else
	 break #El break de toda la vida
    fi
done #Finaliza el bucle
#Si Abraham viera esto, le daría un parraque (probablemente menos que con mis correos),
#porque siempre se quejaba de que los bucles no pueden ser true sin motivo algono.
#Con todo, no logro determinar qué poner para que no sea true, pero mientras funcione...

#Pide el nombre completo (GECOS)
#El GECOS es el campo de información adicional de un usuario (el relleno, vaya).
while true; do
    read -p "Introduce el nombre completo del usuario, por favor: " NOMBRECOM
    if [ -z "$NOMBRECOM" ]; then
        echo "Error: El nombre completo no puede estar vacío. :v"
    else
        break
    fi
done

#Pedir el grupo
#Esto ya es todo el rato lo mismo, dominao ;)
while true; do
    read -p "Introduce el nombre del grupo: " GRUPO
    if [ -z "$GRUPO" ]; then
        echo "Error: El grupo, de verdad, no puede estar vacío..."
    else
        break
    fi
done

#Comprueba si el grupo existe y, si no, lo crea.
if ! getent group "$GRUPO" > /dev/null; then # Esto, es la forma interna que tiene de comprobar que el grupo existe o no. No hay que darle más vueltas.
    echo "El grupo no existe. En consecuencia, se creará uno nuevo..."
    sudo groupadd "$GRUPO"
fi

# Esto crea el usuario con los parámetros que le hemos pasado
sudo useradd -m -c "$NOMBRECOM" -g "$GRUPO" "$USERNAME" #El -m, desde M4 de SMX que lo sé, es el nombre de usuario,
# el -g, de grupo, y el -c (gracias ChatYiPiTí), para añadir relleno (como el nombre completo).

#Esto comprueba que se haya creado bien y no la haya liado programando esto
if [ $? -eq 0 ]; then #Traducción al castellano:
#El resultado del último comando ($?), es igual a 0 (es decir, si ha salido bien,
#el $? dará un valor buleano de 0, en caso contrario, dará un 1).
    echo "El usuario $USERNAME se ha creado correctamente dentro del grupo $GROUP."
    #Si es 0 el valor, ergo ha salido bien, entra aquí
else
    echo "Algo ha pasao, que se ha roto algo y no se ha creado el usuario."
    #Si ha salido mal y, por tanto, el valor no es 0, sino 1 u otro, pues entra aquí.
fi
