#!/bin/bash
#

# This fixes some ampersands that need to be escaped in the pr.owl file
echo "Fixing invalid XML in pr.owl..."
sed -i "s/\&name/\&amp;name/g" /kabob_data/ontology/pr.owl
