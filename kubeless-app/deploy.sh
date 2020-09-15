#!/bin/sh

# kubeless.exe \
kubeless \ 
function deploy echo --runtime nodejs10 \
                                --cpu 0.5 \
                                --memory 500Mi \
                                --timeout 5 \
                                --namespace local \
                                --handler index.echo \
                                --from-file index.js