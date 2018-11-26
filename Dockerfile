# This image provides containers that can connect to a postGIS database instance.
FROM python:alpine
RUN pip install --upgrade pip
ENV CFLAGS="$CFLAGS -L/lib"
ENV PYTHONUNBUFFERED 0
RUN apk update && \
    apk upgrade && \
    apk add ca-certificates curl screen wget bash git && \
    update-ca-certificates && \
    apk add --update --no-cache --repository https://uk.alpinelinux.org/alpine/edge/main/ libcrypto1.1 && \
    apk add --update --no-cache --repository https://uk.alpinelinux.org/alpine/edge/testing/ \
        gdal \
        gdal-dev \
        geos \
        geos-dev \
        proj4-dev && \
    apk add --update --no-cache \
        binutils \
        gcc \
        libpq \
        linux-headers \
        mailcap \
        musl-dev \
        postgresql \
        postgresql-client \
        postgresql-dev \
        jpeg-dev \
        libffi-dev \
        zlib-dev
