#!/bin/bash
#
# Download and flatten (resolve imports) ontologies used by KaBOB

cd kabob.git
chmod 755 ./scripts/download/*.sh
./scripts/download/download-ontologies.sh /kabob_data/ontology_download.log /kabob_data/ontology
