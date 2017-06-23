#!/bin/bash
#
# Download and flatten (resolve imports) ontologies used by KaBOB

ONT_DIR=/kabob_data/ontology
cd kabob.git
chmod 755 ./scripts/download/*.sh
if [ -d "$ONT_DIR" ]; then
    # clean the ontology directory if it exists
    rm -rf "$ONT_DIR"
fi
mkdir -p "$ONT_DIR"

./scripts/download/process-ontologies.sh "$ONT_DIR" mvn
