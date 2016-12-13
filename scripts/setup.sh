#!/bin/bash
#

mkdir -p /kabob_data/logs

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$SCRIPT_DIR/download-ontologies.sh
$SCRIPT_DIR/download-irefweb.sh
$SCRIPT_DIR/download-chembl-rdf.sh
$SCRIPT_DIR/fix-pr-invalid-xml.sh
