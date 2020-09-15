#!/bin/sh

kubeless.exe function update echo --runtime nodejs10 \
                                --namespace local \
                                --handler index.echo \
                                --from-file index.js \