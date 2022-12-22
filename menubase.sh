#!/bin/bash

while :; do
    #Menu
    clear
    echo -e "\e[1;32m"
    echo " MENU SCRIPT V.1 "
    echo ""
    echo "1. Mostrar directorio"
    echo "2. Mostrar calendario"
    echo "3. Mostrar dato"
    echo "5. Ingresa el nombre del archivo para ver su codigo:"
    echo "6. Ingresa el nombre del archivo para ejecutar su codigo:"
    echo "7. Ingresa el numero del archivo para ver su nombre y ejecutar el nombre:"
    echo "8. Ingresa el numero del archivo para ver su nombre y ver el código:"
    echo "4. Salir"
    echo ""
    #Escoger menu
    echo -n "Escoger opcion: "
    read opcion
    #Seleccion de menu
    case $opcion in
    1)
        echo "Mostrando directorio"
        ls | more
        read foo
        ;;
    2)
        echo "Mostrando calendario"
        cal
        read foo
        ;;
    3)
        echo "Mostrando fecha de hoy"
        date
        read foo
        ;;
    5)
        echo "Ingresa el nombre del archivo para ver su codigo: "
        read nombre_archivo

        for file in $nombre_archivo; do
        echo "Contenido del archivo $file:"
        cat $file
        done

        
        read foo
        ;;
    6)
        echo "Ingresa el nombre del archivo para ejecutar su codigo: "
        read nombre_archivo

        for file in $nombre_archivo; do
        echo "Contenido del archivo $file:"
        python3 $file
        done

        
        read foo
        ;;
    7)  
        # echo "Ingresa el numero del archivo para ver su nombre y ejecutar el nombre"
        names=($(ls *.py))

        echo "Selecciona un número para ver su nommre:"
        echo "Con control d + enter para salir de la opcion 7 y volver al menu"
        select name in "${names[@]}"; do
        if [ -n "$name" ]; then
            # Mostrar el nombre seleccionado
            echo "Has seleccionado el nombre $name"
            python3 $name
        else
            echo "Por favor selecciona un nombre válido."
        fi
        done

# En este script, utilizamos el comando ls para obtener una lista de nombres de archivos con extensión .py y asignamos el resultado a la variable names utilizando la sintaxis names=(valor1 valor2 valor3 ...). Luego, utilizamos el comando select para mostrar un menú con cada nombre de la lista y permitir al usuario seleccionar uno de ellos.


        
        read foo
        ;;
    8)  
        # echo "Ingresa el numero del archivo para ver su nombre y ejecutar el nombre"
        names=($(ls *.py))

        echo "Ingresa el numero del archivo para ver su nombre y ver el código:"
        echo "Con control d + enter para salir de la opcion 8 y volver al menu"
        select name in "${names[@]}"; do
        if [ -n "$name" ]; then
            # Mostrar el nombre seleccionado
            echo "Has seleccionado el nombre $name"
            cat $name
        else
            echo "Por favor selecciona un nombre válido."
        fi
        done
        
        read foo
        ;;
    4) exit 0 ;;
    #Alerta
    *)
        echo "Opcion invalida..."
        sleep 1
        ;;
    esac
done
