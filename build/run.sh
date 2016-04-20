#!/bin/bash

set -euf -o pipefail

mkdir -p "/go/bin/out"

make test && make install

for component in {ecu,engine,ha,healthcheck,ncc,watchdog}; do
  install "/go/bin/seesaw_${component}" "/go/bin/out"
  goupx "/go/bin/out/${component}"
done
