#!/bin/bash

echo -n "prototest... "
prototest=./tests/prototest/prototest
log=prototest.log
rm -rf casket*  >> ${log} || exit 1
${prototest} order -etc 10000                   >> ${log} || exit 1
${prototest} order -th 4 10000                  >> ${log} || exit 1
${prototest} order -th 4 -rnd -etc 10000        >> ${log} || exit 1
${prototest} order -th 4 -rnd -etc -tran 10000  >> ${log} || exit 1
${prototest} wicked 10000                       >> ${log} || exit 1
${prototest} wicked -th 4 -it 4 10000           >> ${log} || exit 1
${prototest} tran 10000                         >> ${log} || exit 1
${prototest} tran -th 2 -it 4 10000             >> ${log} || exit 1
rm -rf casket*                                  >> ${log} || exit 1
${prototest} order -tree -etc 10000             >> ${log} || exit 1
${prototest} order -tree -th 4 10000            >> ${log} || exit 1
${prototest} order -tree -th 4 -rnd -etc 10000  >> ${log} || exit 1
${prototest} order -tree -th 4 -rnd -etc -tran 10000  >> ${log} || exit 1
${prototest} wicked -tree 10000                 >> ${log} || exit 1
${prototest} wicked -tree -th 4 -it 4 10000     >> ${log} || exit 1
${prototest} tran -tree 10000                   >> ${log} || exit 1
${prototest} tran -tree -th 2 -it 4 10000   >> ${log} || exit 1
echo "OK"



