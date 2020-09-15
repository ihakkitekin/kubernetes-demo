#!/bin/sh

# kubeless.exe \
kubeless \ 
function update echo --runtime nodejs10 \
                                --namespace local \
                                --handler index.echo \
                                --from-file index.js \