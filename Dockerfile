FROM marcielmj/alpine

MAINTAINER marcielmj <https://github.com/marcielmj>

ENV JAVA_VERSION=8
ENV JAVA_UPDATE=131
ENV JAVA_BUILD=11

ENV JDK_DOWNLOAD_URL="http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz"
ENV JAVA_FILENAME="java-${JAVA_VERSION}-oracle.tar.gz"

ENV JAVA_HOME="/opt/java-${JAVA_VERSION}-oracle"
ENV PATH="${PATH}:/${JAVA_HOME}/bin:.:"

RUN wget --header "Cookie: oraclelicense=accept-securebackup-cookie" -q -O "/tmp/${JAVA_FILENAME}" "${JDK_DOWNLOAD_URL}" && \
    tar -xzf "/tmp/${JAVA_FILENAME}" -C "/tmp" && \
    mv "/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "${JAVA_HOME}" && \
    rm -rf ${JAVA_HOME}/*src.zip /tmp/*
