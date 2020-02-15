FROM debian:stretch-slim
MAINTAINER https://github.com/yangchengwork/docker-arm-none-eabi

RUN sed -ri 's/^# deb /deb /g' /etc/apt/sources.list && \
    apt update; \
    apt install -y curl ca-certificates make \
    bzip2

# Install gcc
ENV VERSION="9-2019-q4"
RUN URL="https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2" && \
    cd /opt &&\
    curl -L "$URL" > gcc.tbz &&\
    tar xvf gcc.tbz &&\
    rm gcc.tbz &&\
    ls

ENV PATH=/opt/gcc-arm-none-eabi-9-2019-q4-major/bin:$PATH

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
    
# Print out installed version
RUN echo "VERSION=$VERSION"

# Clean up cache
RUN rm -rf /var/cache/apk/*
