#!/bin/sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-arching-kaos-docs.sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-icecast.sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-ipfs.sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-liquidsoap.sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-liquidsoap.sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-opentracker.sh
sed -i.bak -e 's/{$ARCHING_KAOS_BASE_DIR}/\/home\/kaotisk\/projects\/arching-kaos/' scripts/docker-ssb-create.sh
