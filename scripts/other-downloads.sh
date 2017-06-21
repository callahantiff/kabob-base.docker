#!/bin/bash

# most downloads are handled in the Java code, however the irefweb downloads sometimes terminate
# prematurely so we use curl here to download the human irefweb file
mkdir -p /kabob_data/raw/irefweb

DATE=$(date +%m/%d/%Y)

# wget the irefweb file using an automated retry-on-failure flag
cd /kabob_data/raw/irefweb && { wget -c -t 0 --timeout 60 --waitretry 10 http://irefindex.org/download/irefindex/data/archive/release_14.0/psi_mitab/MITAB2.6/9606.mitab.07042015.txt.zip ; unzip -o 9606.mitab.07042015.txt.zip ; touch -mt 1504070000 9606.mitab.04072015.txt ; cd - ; }
/kabob.git/scripts/download/create-metadata-file.sh /kabob_data/raw/irefweb/9606.mitab.04072015.txt  http://irefindex.org/download/irefindex/data/archive/release_14.0/psi_mitab/MITAB2.6/9606.mitab.07042015.txt.zip

# wget Reactome in BioPax format
mkdir -p /kabob_data/raw/reactome
cd /kabob_data/raw/reactome && { wget -c -t 0 --timeout 60 --waitretry 10 http://www.reactome.org/download/current/biopax.zip ; unzip -o biopax.zip ; cd - ; }
/kabob.git/scripts/download/create-metadata-file.sh /kabob_data/raw/reactome/Homo_sapiens.owl  http://www.reactome.org/download/current/biopax.zip