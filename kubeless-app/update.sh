#!/bin/bash

kubeless.exe function update echo --runtime nodejs10 \
                                --handler index.echo \
                                --from-file index.js