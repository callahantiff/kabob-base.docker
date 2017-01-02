#!/bin/bash

# most downloads are handled in the Java code, however the irefweb downloads sometimes terminate
# prematurely so we use curl here to download the human irefweb file
mkdir -p /kabob_data/raw/irefweb

DATE=$(date +%m/%d/%Y)

# wget the irefweb file using an automated retry-on-failure flag
cd /kabob_data/raw/irefweb && { wget -c -t 0 --timeout 60 --waitretry 10 http://irefindex.org/download/irefindex/data/archive/release_14.0/psi_mitab/MITAB2.6/9606.mitab.07042015.txt.zip ; unzip -o 9606.mitab.07042015.txt.zip ; touch 9606.mitab.04072015.txt.ready ; touch -mt 1504070000 9606.mitab.04072015.txt ; echo "DOWNLOAD_DATE=$DATE" > 9606.mitab.04072015.txt.ready ; echo "FILE_SIZE_IN_BYTES=793647006" >> 9606.mitab.04072015.txt.ready ; echo "DOWNLOAD_URL=http://irefindex.org/download/irefindex/data/archive/release_14.0/psi_mitab/MITAB2.6/9606.mitab.07042015.txt.zip" >> 9606.mitab.04072015.txt.ready ; echo "DOWNLOADED_FILE=/kabob_data/raw/irefweb/9606.mitab.04072015.txt" >> 9606.mitab.04072015.txt.ready ;  echo "FILE_LAST_MOD_DATE=04/07/2015" >> 9606.mitab.04072015.txt.ready ; cd - ; }
