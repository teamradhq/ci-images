#!/usr/bin/env bash

if [ -z "$1" ]
then
    echo "Please provide a tag name"
    echo "Usage: $0 <tag>"
    exit 1
fi

CONTEXT=$1
VERSIONS=(7.4 8.2 8.3 8.4)

for version in "${VERSIONS[@]}"; do
    tag="${CONTEXT}:$version"
    echo
    echo "Building ${tag}"
    echo
    sleep 1

    if ! docker build --build-arg "PHP_VERSION=${version}" \
        -t "${tag}" \
        -t "teamradhq/${tag}" \
        -f "${CONTEXT}/Dockerfile" \
        "${CONTEXT}"
    then
        echo "Docker build failed for ${CONTEXT}:${version}"
        exit 1
    fi
done
