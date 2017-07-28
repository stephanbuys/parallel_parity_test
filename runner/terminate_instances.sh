#!/bin/bash
source ./globals.sh

echo "Please wait while instances are being spawned (par jobs: $PARALLEL_CONCURRENCY )"
parallel -v -j $PARALLEL_CONCURRENCY \
  docker-machine rm -y ::: $NODES
  

