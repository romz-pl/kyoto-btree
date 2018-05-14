#!/bin/bash

echo -n "stashtest... "
stashtest=./tests/stashtest/stashtest
log=stashtest.log 
rm -rf casket*  >> ${log} || exit 1
${stashtest} order -etc -bnum 5000 10000                    >> ${log} || exit 1
${stashtest} order -th 4 -bnum 5000 10000                   >> ${log} || exit 1
${stashtest} order -th 4 -rnd -etc -bnum 5000 10000         >> ${log} || exit 1
${stashtest} order -th 4 -rnd -etc -bnum 5000 10000         >> ${log} || exit 1
${stashtest} order -th 4 -rnd -etc -tran -bnum 5000 10000   >> ${log} || exit 1
${stashtest} wicked -bnum 5000 10000                        >> ${log} || exit 1
${stashtest} wicked -th 4 -it 4 -bnum 5000 10000            >> ${log} || exit 1
${stashtest} tran -bnum 5000 10000                          >> ${log} || exit 1
${stashtest} tran -th 2 -it 4 -bnum 5000 10000              >> ${log} || exit 1
echo "OK"


