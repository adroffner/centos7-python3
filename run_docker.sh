#! /bin/bash
#
# CentOS 7 with Python 3.5 on Docker 
# =============================================================================
# Run docker image  in a new container.
# This is NOT run in "detached" (-d) mode.
# =============================================================================

REGISTRY="zlp11313.vci.att.com:5100"
NAMESPACE="com.att.dev.argos"
IMAGE_NAME="centos7-python3"
TAG="3.5.2"

IMAGE_TAG="${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}:${TAG}"

docker run -ti $IMAGE_TAG
