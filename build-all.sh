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

tt=./tests/cachetest/cachetest
log=cachetest.log
${tt} order -etc -bnum 5000 10000                                     > ${log} || exit 1
${tt} order -th 4 -bnum 5000 10000                                   >> ${log} || exit 1
${tt} order -th 4 -rnd -etc -bnum 5000 -capcnt 10000 10000           >> ${log} || exit 1
${tt} order -th 4 -rnd -etc -bnum 5000 -capsiz 10000 10000           >> ${log} || exit 1
${tt} order -th 4 -rnd -etc -tran -tc -bnum 5000 -capcnt 10000 10000 >> ${log} || exit 1
${tt} wicked -bnum 5000 10000                                        >> ${log} || exit 1
${tt} wicked -th 4 -it 4 -tc -bnum 5000 -capcnt 10000 10000          >> ${log} || exit 1
${tt} tran -bnum 5000 10000                                          >> ${log} || exit 1
${tt} tran -th 2 -it 4 -tc -bnum 5000 10000                          >> ${log} || exit 1





