#! /bin/bash
#
# CentOS 7 with Python 3.6 on Docker
# =============================================================================
# Build docker image
# =============================================================================

# OPTIONAL Install SQL/GIS "spatialite" when non-empty string
GIS_SPATIALITE=""

REGISTRY="dockercentral.it.att.com:5100"
NAMESPACE="com.att.dev.argos"
IMAGE_NAME="centos7-python3"
TAG="3.6.6"

if [ -n "${GIS_SPATIALITE}" ]; then
	echo "Adding SQL/GIS spatialite support ..."
	IMAGE_NAME="${IMAGE_NAME}-sqlgis"
	DOCKERFILE=Dockerfile.sqlgis
else
	# Just build main project.
	DOCKERFILE=Dockerfile
fi


FULL_IMAGE_NAME="${REGISTRY}/${NAMESPACE}/${IMAGE_NAME}:${TAG}"

docker login -u m12292@argos.dev.att.com -p 3W2-CDP-naF-3aN -e m12292@att.com ${REGISTRY}

docker build -t $FULL_IMAGE_NAME ./ \
    --build-arg http_proxy=$http_proxy \
    --build-arg https_proxy=$https_proxy \
    -f ${DOCKERFILE}
