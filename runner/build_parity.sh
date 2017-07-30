#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd parity
docker build -t parity_builder .
mkdir -p out
docker run --rm --name parity_builder --volume $(pwd)/out:/out  parity_builder

docker build -f Dockerfile.run -t parity .


#FIXME: external mount

