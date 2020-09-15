#!/bin/sh

# kubeless.exe function deploy echo --runtime nodejs10 \
#                                 --cpu 0.5 \
#                                 --memory 500Mi \
#                                 --timeout 5 \
#                                 --namespace local \
#                                 --handler index.echo \
#                                 --from-file index.js

kubectl apply -f function.yaml