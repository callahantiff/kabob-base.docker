#!/bin/bash
##
# most downloads are handled in the Java code, however the irefweb downloads sometimes terminate
# prematurely so we use curl here to download the human irefweb file
#

cd kabob.git
chmod 755 ./scripts/download/*.sh
./scripts/download/download-irefweb.sh /kabob_data/irefweb_download.log /kabob_data/raw/irefweb
