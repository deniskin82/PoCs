FROM python:3.10.10-alpine3.17

LABEL maintainer="deniskin82"

RUN apk add --no-cache \
    ansible \
    bash \
    curl \
    jq \
    openssh-client \
    rsync \
    shellcheck \
    doas \
    gcompat \
    tar \
    unzip \
    && rm -rf /var/cache/apk/*

COPY *.sh /tmp/

RUN /tmp/hashitools_install.sh packer && \
    /tmp/hashitools_install.sh consul && \
    /tmp/hashitools_install.sh nomad && \
    /tmp/hashitools_install.sh terraform && \
    rm -frv /tmp/*

WORKDIR /usr/local/bin
CMD ["/bin/bash"]
