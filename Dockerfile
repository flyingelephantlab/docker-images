FROM python:3.11-slim-buster

ENV PYTHONUNBUFFERED 1

RUN apt-get update -y && \
    apt-get install -y binutils && \
    # Cartographic projection library
    apt-get install -y libproj-dev && \
    # Geospatial data abstraction library
    apt-get install -y gdal-bin python-gdal && \
    # Dependencies for building Python packages
    apt-get install -y build-essential && \
    # Psycopg2 dependencies
    apt-get install -y libpq-dev && \
    # Translations dependencies
    apt-get install -y gettext && \
    # Install git
    apt-get install -y git && \
    # Install curl for health check
    apt-get install -y curl && \
    # Cleaning up unused files
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*
