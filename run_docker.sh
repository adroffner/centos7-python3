#! /bin/bash
#
# CentOS 7 with Python 3.6 on Docker 
# =============================================================================
# Run docker image  in a new container.
# This is NOT run in "detached" (-d) mode.
# =============================================================================

REGISTRY="dockercentral.it.att.com:5100"
NAMESPACE="com.att.dev.argos"
IMAGE_NAME="centos7-python3"
TAG="3.6.6"

FULL_IMAGE_NAME="${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}:${TAG}"

docker run -ti $FULL_IMAGE_NAME
