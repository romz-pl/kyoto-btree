#!/bin/bash

echo -n "grasstest... "
grasstest=./tests/grasstest/grasstest
log=grasstest.log
rm -rf casket*
${grasstest} order -etc -bnum 5000 10000                                    >> ${log} || exit 1
${grasstest} order -th 4 -bnum 5000 10000                                   >> ${log} || exit 1
${grasstest} order -th 4 -rnd -etc -bnum 5000 10000                         >> ${log} || exit 1
${grasstest} order -th 4 -rnd -etc -bnum 5000 10000                         >> ${log} || exit 1
${grasstest} order -th 4 -rnd -etc -tran -tc -bnum 5000 -pccap 10k -rcd 500 >> ${log} || exit 1
${grasstest} wicked -bnum 5000 10000                                        >> ${log} || exit 1
${grasstest} wicked -th 4 -it 4 -tc -bnum 5000 -pccap 10k -rcd 1000         >> ${log} || exit 1
${grasstest} tran -bnum 500 10000                                           >> ${log} || exit 1
${grasstest} tran -th 2 -it 4 -tc -bnum 5000 -pccap 10k -rcd 5000           >> ${log} || exit 1
echo "OK"


