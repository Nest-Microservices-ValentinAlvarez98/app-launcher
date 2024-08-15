#!/bin/bash

# Iniciar MongoDB como un conjunto de réplicas
mongod --replSet rs0 --bind_ip localhost,auth_database &

# Esperar a que MongoDB esté disponible
until mongosh --eval "print('waiting for MongoDB...')" &> /dev/null
do
  sleep 2
done

# Inicializar el conjunto de réplicas
echo "Initializing replica set..."
mongosh --eval "rs.initiate()"

# Mantener el contenedor en primer plano
wait
