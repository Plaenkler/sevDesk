#!/bin/bash

OPENAPI_URL="https://api.sevdesk.de/openapi.yaml"
OPENAPI_FILE="openapi.yaml"

# Target directories
TYPES_DIR="./types"
CLIENT_DIR="./client"
SERVER_DIR="./server"

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'

abort() {
    echo -e "${RED}Error: $1${NC}"
    exit 1
}

# Check if the OpenAPI file exists
if [ -f "$OPENAPI_FILE" ]; then
    echo -e "${GREEN}$OPENAPI_FILE already exists. Skipping download.${NC}"
else
    # Download the OpenAPI definition
    echo "Downloading OpenAPI definition from $OPENAPI_URL ..."
    curl -o "$OPENAPI_FILE" "$OPENAPI_URL" || abort "Failed to download OpenAPI definition."
    echo -e "${GREEN}OpenAPI definition successfully downloaded to $OPENAPI_FILE${NC}"
fi

# Create target directories if they don't exist
echo "Creating target directories ..."
mkdir -p "$TYPES_DIR" "$CLIENT_DIR" "$SERVER_DIR" || abort "Failed to create target directories."

# Generate Go files for types
echo "Generating Go files for types ..."
oapi-codegen -generate types -o "$TYPES_DIR/types.go" -package types "$OPENAPI_FILE" || abort "Error generating types files."

echo -e "${GREEN}Types files successfully generated in $TYPES_DIR/types.go${NC}"

# Generate Go files for client
echo "Generating Go files for client ..."
oapi-codegen -generate client -o "$CLIENT_DIR/client.go" -package client "$OPENAPI_FILE" || abort "Error generating client files."

echo -e "${GREEN}Client files successfully generated in $CLIENT_DIR/client.go${NC}"

# Generate Go files for server
echo "Generating Go files for server ..."
oapi-codegen -generate server -o "$SERVER_DIR/server.go" -package server "$OPENAPI_FILE" || abort "Error generating server files."

echo -e "${GREEN}Server files successfully generated in $SERVER_DIR/server.go${NC}"

echo -e "${GREEN}All steps completed successfully.${NC}"
