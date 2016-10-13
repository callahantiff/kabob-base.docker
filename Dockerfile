# Zulu is a certified build of OpenJDK that is redistributable (unlike
# Oracle Java): https://www.azul.com/products/zulu
# This Zulu distribution is based on ubuntu:latest
FROM azul/zulu-openjdk:8u92

RUN apt-get update && apt-get install -y \
    curl \
    maven \
    git

RUN git clone -b fix.timestamp http://github.com/bill-baumgartner/datasource ./datasource.git && \
    mvn clean install -f ./datasource.git/pom.xml

COPY step1_download-ontologies.sh /

RUN git clone -b docker.base https://github.com/bill-baumgartner/kabob ./kabob.git && \
    mvn clean install -f ./kabob.git/pom.xml && \
    mvn clean package -f ./kabob.git/scripts/download/pom-flatten-ontology.xml && \
    chmod 755 ./step1_download-ontologies.sh    







