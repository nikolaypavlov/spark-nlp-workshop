# vi: ft=Dockerfile

FROM jupyter/pyspark-notebook

LABEL maintainer "Nikolay Pavlov <me@nikolaypavlov.com>"

USER root

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && apt-get install -y --no-install-recommends libxml2 libxml2-dev curl build-essential

# Copy application
WORKDIR /app
ENV PRODIGY_HOME="/app"

# Install requirements
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Install Prodigy
RUN apt-get update && apt-get install -y --no-install-recommends libopenblas-dev jq

# Install spaCy models
RUN python -m spacy download en_core_web_sm

RUN mkdir data
WORKDIR data

# Cleanup
RUN rm -rf /var/lib/apt/lists/* /tmp/*

USER jovyan
