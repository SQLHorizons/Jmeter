FROM alpine:latest

ARG VERSION=5.4.1
ENV TZ "Europe/London"
ENV JMETER_HOME /opt/apache-jmeter-${VERSION}
ENV JMETER_BIN ${JMETER_HOME}/bin
ENV JMETER_DOWNLOAD_URL https://downloads.apache.org/jmeter/binaries/apache-jmeter-${VERSION}.tgz

RUN apk update \
    && apk upgrade \
    && apk add ca-certificates \
    && update-ca-certificates \
    && apk add --update openjdk8-jre tzdata curl unzip bash \
    && apk add --no-cache nss \
    && rm -rfv /var/cache/apk/* \
    && mkdir -pv /tmp/dependencies \
    && curl -L --silent ${JMETER_DOWNLOAD_URL} > /tmp/dependencies/apache-jmeter-${VERSION}.tgz \
    && mkdir -pv /opt \
    && tar -xzf /tmp/dependencies/apache-jmeter-${VERSION}.tgz -C /opt \
    && rm -rfv /tmp/dependencies

##  TODO: plugins (later)
##  && unzip -oq "/tmp/dependencies/JMeterPlugins-*.zip" -d $JMETER_HOME

##  Set global PATH such that 'jmeter' command is found
ENV PATH $PATH:$JMETER_BIN

##  Entrypoint has same signature as 'jmeter' command
COPY scripts/entrypoint.sh /

WORKDIR  ${JMETER_HOME}

ENTRYPOINT ["/entrypoint.sh"]
