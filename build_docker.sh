#! /bin/bash
#
# CentOS 7 with Python 3.5 on Docker
# =============================================================================
# Build docker image
# =============================================================================

IMAGE_NAME="att-gcs/centos7-python3:3.5.2"

docker build -t $IMAGE_NAME ./ \
    --build-arg http_proxy=$http_proxy \
    --build-arg https_proxy=$https_proxy
