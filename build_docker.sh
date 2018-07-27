#! /bin/bash
#
# CentOS 7 with Python 3.5 on Docker
# =============================================================================
# Build docker image
# =============================================================================

REGISTRY="dockercentral.it.att.com:5100"
NAMESPACE="com.att.dev.argos"
IMAGE_NAME="centos7-python3"
TAG="with-TCL"

IMAGE_TAG="${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}:${TAG}"

docker login -u m12292@argos.dev.att.com -p 3W2-CDP-naF-3aN -e m12292@att.com ${REGISTRY}

docker build -t $IMAGE_TAG ./ \
    --build-arg http_proxy=$http_proxy \
    --build-arg https_proxy=$https_proxy
