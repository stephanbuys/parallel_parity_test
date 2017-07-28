#!/bin/bash
source ./globals.sh

FILENAME="$@"
CMD='MACHINE={}; \
  echo "Machine {}"; \
  echo "Cmd: '$PARAMS'"; \
  IP=$(docker-machine ip $MACHINE); \
  curl --data @'$FILENAME' -H "Content-Type: application/json" -X POST $IP:'$PARITY_PORT''
  
parallel -v -j $PARALLEL_CONCURRENCY \
  "$CMD" ::: $NODES
  
  
