#!/bin/sh

rm -rf build >/dev/null 2>&1
mkdir build
cd build
tar -zcf media.tgz -C ../media . && cp ../_rasip.sh rasip.sh && cat media.tgz >> rasip.sh && chmod u+x rasip.sh && rm -rf media.tgz
