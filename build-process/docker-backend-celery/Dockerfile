FROM python:3.12-slim

ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=backend.settings

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git-core \
        build-essential \
        binutils \
        libproj-dev \
        gdal-bin \
        supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY ./requirements /home/SM-backend/requirements
RUN mkdir -p /home/SM-backend/media
WORKDIR /home/SM-backend


RUN pip install --upgrade pip
RUN pip install -r ./requirements/requirements.txt



EXPOSE 5555

RUN mkdir -p /var/logs/SM


COPY ./build-process/docker-backend-celery/scripts /home/docker/scripts

RUN sed -i 's/\r$//' /home/docker/scripts/boot.sh  && \
        chmod +x /home/docker/scripts/boot.sh

ENTRYPOINT /home/docker/scripts/boot.sh

COPY ./ /home/SM-backend


