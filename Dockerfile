############################################################
# Dockerfile
############################################################

# Set the base image
FROM docker:stable

############################################################
# Configuration
############################################################
ENV VERSION "1.1.14"
ENV VERSION_COMMIT "874754de"

############################################################
# Installation
############################################################

RUN apk add --no-cache bash curl > /dev/null &&\
    curl -L -o /tmp/s2i.tar.gz https://github.com/openshift/source-to-image/releases/download/v${VERSION}/source-to-image-v${VERSION}-${VERSION_COMMIT}-linux-amd64.tar.gz &&\
    tar -zxvf /tmp/s2i.tar.gz -C /usr/local/bin &&\
    chmod +x /usr/local/bin/sti &&\
    chmod +x /usr/local/bin/s2i &&\
	apk del --no-cache curl > /dev/null

############################################################
# Execution
############################################################
CMD ["s2i", "--help"]
