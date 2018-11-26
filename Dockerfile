# This image provides containers that can connect to a postGIS database instance.
FROM python:alpine
ENV CFLAGS="$CFLAGS -L/lib"
ENV PYTHONUNBUFFERED 0
RUN apk update && \
    apk upgrade && \
    apk add --update-cache --repository https://uk.alpinelinux.org/alpine/edge/testing/ \
     bash \
     binutils \
     gcc \
     gdal \
     gdal-dev \
     geos \
     geos-dev \
     git \
     jpeg-dev \
     libffi-dev \
     libpq \
     linux-headers \
     mailcap \
     musl-dev \
     proj4-dev \
     postgresql \
     postgresql-client \
     postgresql-dev \
     zlib-dev && \
    rm -rf /var/cache/apk/*
RUN pip install --upgrade pip
