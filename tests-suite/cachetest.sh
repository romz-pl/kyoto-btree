#!/bin/bash

echo -n "cachetest... "
cachetest=./tests/cachetest/cachetest
log=cachetest.log
rm -rf ${log}
${cachetest} order -etc -bnum 5000 10000                                    >> ${log} || exit 1
${cachetest} order -th 4 -bnum 5000 10000                                   >> ${log} || exit 1
${cachetest} order -th 4 -rnd -etc -bnum 5000 -capcnt 10000 10000           >> ${log} || exit 1
${cachetest} order -th 4 -rnd -etc -bnum 5000 -capsiz 10000 10000           >> ${log} || exit 1
${cachetest} order -th 4 -rnd -etc -tran -tc -bnum 5000 -capcnt 10000 10000 >> ${log} || exit 1
${cachetest} wicked -bnum 5000 10000                                        >> ${log} || exit 1
${cachetest} wicked -th 4 -it 4 -tc -bnum 5000 -capcnt 10000 10000          >> ${log} || exit 1
${cachetest} tran -bnum 5000 10000                                          >> ${log} || exit 1
${cachetest} tran -th 2 -it 4 -tc -bnum 5000 10000                          >> ${log} || exit 1
echo "OK"

