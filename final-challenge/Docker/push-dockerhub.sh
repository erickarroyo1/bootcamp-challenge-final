#!/bin/bash

echo -e '\n\nPush de la imágen a dockerhub\n\n'

docker login
docker tag ms-frontend:1.0 191006/ms-frontend:1.0
docker tag ms-products:1.0 191006/ms-products:1.0
docker tag ms-shopping-cart:1.0 191006/ms-shopping-cart:1.0
docker push 191006/ms-frontend:1.0
docker push 191006/ms-products:1.0
docker push 191006/ms-shopping-cart:1.0

echo -e '\n\n FIN EJECUCIÓN PUSH DOCKERHUB\n\n'
