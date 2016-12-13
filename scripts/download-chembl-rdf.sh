#!/bin/bash
#
# ChEMBL is available in turtle RDF, so we will download it and use it directly.

cd kabob.git
chmod 755 ./scripts/download/*.sh
./scripts/download/download-chembl-rdf.sh /kabob_data/chembl_download.log /kabob_data/rdf/chembl
