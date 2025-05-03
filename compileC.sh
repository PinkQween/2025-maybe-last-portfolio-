#!/bin/bash

# Configuration
MODULE_NAME="MyModule"
SOURCE_DIR="src"
OUTPUT_DIR="src/wasm"
OUTPUT_JS="${OUTPUT_DIR}/module.js"
EXPORTED_FUNCTIONS=("adder" "cat")  # Export both adder and cat functions

# Create output directory if it doesn't exist
mkdir -p "${OUTPUT_DIR}"

# Find all .c files in the source directory recursively
SOURCES=$(find "${SOURCE_DIR}" -name '*.c')

# Convert array of functions to emcc format
EXPORTED_FUNC_STR=$(printf "'_%s'," "${EXPORTED_FUNCTIONS[@]}")
EXPORTED_FUNC_STR="[${EXPORTED_FUNC_STR%,}]"

# Compile using Emscripten
emcc ${SOURCES} \
    -o "${OUTPUT_JS}" \
    -s EXPORT_ES6=1 \
    -s MODULARIZE=1 \
    -s "EXPORT_NAME=${MODULE_NAME}" \
    -s "ENVIRONMENT=web" \
    -s "EXPORTED_FUNCTIONS=${EXPORTED_FUNC_STR}" \
    -s EXPORTED_RUNTIME_METHODS="[]"
