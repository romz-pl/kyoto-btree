#!/bin/bash

echo -n "treetest... "
treetest=./tests/treetest/treetest
treemgr=./tests/treemgr/treemgr
log=treetest.log
rm -rf casket*                                                                                                          >> ${log} || exit 1
${treetest} order -set -psiz 100 -bnum 5000 -msiz 50000 -pccap 100k casket 10000                                        >> ${log} || exit 1
${treetest} order -get -msiz 50000 -pccap 100k casket 10000                                                             >> ${log} || exit 1
${treetest} order -getw -msiz 5000 -pccap 100k casket 10000                                                             >> ${log} || exit 1
${treetest} order -rem -msiz 50000 -pccap 100k casket 10000                                                             >> ${log} || exit 1
${treetest} order -bnum 5000 -psiz 100 -msiz 50000 -pccap 100k casket 10000                                             >> ${log} || exit 1
${treetest} order -etc -bnum 5000 -psiz 1000 -msiz 50000 -dfunit 4 -pccap 100k casket 10000                             >> ${log} || exit 1
${treetest} order -th 4 -bnum 5000 -psiz 1000 -msiz 50000 -dfunit 4 -pccap 100k casket 10000                            >> ${log} || exit 1
${treetest} order -th 4 -pccap 100k -rnd -etc -bnum 5000 -psiz 1000 -msiz 50000 -dfunit 4 -pccap 100k -rcd casket 10000 >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} order -th 4 -rnd -etc -tran -bnum 5000 -psiz 1000 -msiz 50000 -dfunit 4 -pccap 100k casket 1000             >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} order -th 4 -rnd -etc -oat -bnum 5000 -psiz 1000 -msiz 50000 -dfunit 4 -pccap 100k casket 1000              >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} order -th 4 -rnd -etc -apow 2 -fpow 3 -ts -tl -tc -bnum 5000 -psiz 1000 -msiz 50000 -dfunit 4 casket 10000  >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} queue -bnum 5000 -psiz 500 -msiz 50000 casket 10000                                                         >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} queue -rnd -bnum 5000 -psiz 500 -msiz 50000 casket 10000                                                    >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} queue -th 4 -it 4 -bnum 5000 -psiz 500 -msiz 50000 casket 10000                                             >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} queue -th 4 -it 4 -rnd -bnum 5000 -psiz 500 -msiz 50000 casket 10000                                        >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} wicked -bnum 5000 -psiz 1000 -msiz 50000 -pccap 100k casket 10000                                           >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} wicked -th 4 -it 4 -bnum 5000 -msiz 50000 -dfunit 4 -pccap 100k -rcd casket 10000                           >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} wicked -th 4 -it 4 -oat -bnum 5000 -msiz 50000 -dfunit 4 -pccap 100k casket 1000                            >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} wicked -th 4 -it 4 -apow 2 -fpow 3 -ts -tl -tc -bnum 10000 -msiz 50000 -dfunit 4 casket 1000                >> ${log} || exit 1
${treemgr} check -onr casket                                                                                            >> ${log} || exit 1
${treetest} tran casket 10000                                                                                           >> ${log} || exit 1
${treetest} tran -th 2 -it 4 -pccap 100k casket 10000                                                                   >> ${log} || exit 1
${treetest} tran -th 2 -it 4 -apow 2 -fpow 3 -ts -tl -tc -bnum 10000 -msiz 50000 -dfunit 4 -rcd casket 10000            >> ${log} || exit 1
echo "OK"


