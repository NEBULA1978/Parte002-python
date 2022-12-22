#!/bin/bash

names=($(ls *.py))

echo "Selecciona un nombre:"
select name in "${names[@]}"; do
  if [ -n "$name" ]; then
    # Mostrar el nombre seleccionado
    echo "Has seleccionado el nombre $name"
    break
  else
    echo "Por favor selecciona un nombre válido."
  fi
done
