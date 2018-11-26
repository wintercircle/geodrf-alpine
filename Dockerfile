# This image provides containers that can connect to a postGIS database instance.
FROM python:alpine
RUN pip install --upgrade pip
ENV CFLAGS="$CFLAGS -L/lib"
ENV PYTHONUNBUFFERED 0
RUN apk update && \
    apk upgrade
RUN apk add ca-certificates curl screen wget bash git
RUN update-ca-certificates
RUN apk add --virtual .crypto-deps --update --no-cache --repository https://uk.alpinelinux.org/alpine/edge/main/ libcrypto1.1
RUN apk add --virtual .gdal-deps --update --no-cache --repository https://uk.alpinelinux.org/alpine/edge/testing/ \
        gdal \
        geos
RUN apk add --virtual .gdal-dev-deps --update --no-cache --repository https://uk.alpinelinux.org/alpine/edge/testing/ \
        gdal-dev \
        geos-dev \
        proj4-dev
RUN apk add --virtual .compile-deps --update --no-cache \
        binutils \
        gcc \
        linux-headers \
        musl-dev
RUN apk add --virtual .psql-deps --update --no-cache \
        libpq \
        postgresql \
        postgresql-client \
        postgresql-dev && \
        pip install psycopg2-binary && \
        apk del .psql-deps
RUN apk add --virtual .image-deps --update --no-cache \
        jpeg-dev \
        libffi-dev \
        zlib-dev && \
    pip install pillow && apk del .image-deps
RUN apk --update --no-cache add --virtual .xml-deps libxml2-dev libxslt-dev && pip install lxml && apk del .xml-deps
RUN apk --update --no-cache add --virtual .uwsgi-deps pcre-dev && pip install uwsgi && apk del .uwsgi-deps
RUN apk --update --no-cache add --virtual .magic-deps libmagic mailcap file-dev curl-dev
