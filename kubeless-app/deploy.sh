#!/bin/bash

kubeless.exe function deploy echo --runtime nodejs10 \
                                --handler index.echo \
                                --from-file index.js