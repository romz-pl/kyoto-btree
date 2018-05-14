#!/bin/bash

#
# Create 'build' directory
#
rm -rf build || exit 1
mkdir build || exit 1
cd build || exit 1

#
# Run cmake
#


cmake -D BUILD_GTEST=ON -D BUILD_GMOCK=OFF -D CMAKE_BUILD_TYPE=Debug  .. || exit 1
make -j5 || exit 1

#cmake -D BUILD_GTEST=ON -D BUILD_GMOCK=OFF -D CMAKE_BUILD_TYPE=Debug  .. -G Ninja || exit 1
#ninja


#
# Run test
#
# ctest --verbose
#ctest

#../tests-suite/cachetest.sh  || exit 1
#../tests-suite/dirmgr.sh     || exit 1
#../tests-suite/dirtest.sh    || exit 1
#../tests-suite/forestmgr.sh  || exit 1
#../tests-suite/foresttest.sh || exit 1
#../tests-suite/grasstest.sh  || exit 1
#../tests-suite/hashmgr.sh    || exit 1
#../tests-suite/hashtest.sh   || exit 1
#../tests-suite/langctest.sh  || exit 1
#../tests-suite/polymgr.sh    || exit 1
../tests-suite/polytest.sh   || exit 1
#../tests-suite/prototest.sh  || exit 1
../tests-suite/stashtest.sh  || exit 1
../tests-suite/treemgr.sh    || exit 1
../tests-suite/treetest.sh   || exit 1
../tests-suite/utilmgr.sh    || exit 1
../tests-suite/utiltest.sh   || exit 1












