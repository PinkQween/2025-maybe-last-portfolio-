#!/bin/bash

MODULE_NAME="AdderWasm"
SOURCE="src/adder.c"
OUTPUT_JS="src/wasm/adder_wasm.js"

emcc "${SOURCE}" \
    -o "${OUTPUT_JS}" \
    -s EXPORT_ES6=1 \
    -s MODULARIZE=1 \
    -s "EXPORT_NAME=${MODULE_NAME}" \
    -s "ENVIRONMENT=web" \
    -s EXPORTED_FUNCTIONS="['_adder']" \
    -s EXPORTED_RUNTIME_METHODS="[]" 