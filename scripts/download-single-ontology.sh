#!/bin/bash
#
# Download and flatten (resolve imports) ontologies used by KaBOB

ONT_DIR=/kabob_data/ontology
cd kabob.git
chmod 755 ./scripts/download/*.sh

.//scripts/download/process-single-ontology.sh "$ONT_DIR" mvn $1
