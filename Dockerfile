# Zulu is a certified build of OpenJDK that is redistributable (unlike
# Oracle Java): https://www.azul.com/products/zulu
# This Zulu distribution is based on ubuntu:latest
FROM azul/zulu-openjdk:8u92

RUN apt-get update && apt-get install -y \
    curl \
    maven \
    git \
    unzip \
    wget \
    inotify-tools

RUN git clone https://github.com/bill-baumgartner/owltools.git ./owltools.git && \
	mvn clean install -DskipTests -f ./owltools.git/OWLTools-Parent/pom.xml

RUN git clone --branch dev.ice_revision http://github.com/bill-baumgartner/datasource ./datasource.git && \
    mvn clean install -f ./datasource.git/pom.xml

RUN git clone --branch overhaul https://github.com/bill-baumgartner/kabob ./kabob.git && \
    mvn clean install -f ./kabob.git/pom.xml && \
    mvn clean package -f ./kabob.git/scripts/download/pom-flatten-ontology.xml    

COPY scripts/setup.sh scripts/download-ontologies.sh scripts/other-downloads.sh scripts/ice-rdf-gen.sh scripts/fix-pr-invalid-xml.sh /

RUN chmod 755 ./*.sh







