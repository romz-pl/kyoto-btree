#!/bin/bash

echo -n "hashtest... "
hashtest=./tests/hashtest/hashtest
hashmgr=./tests/hashmgr/hashmgr
log=hashtest.log
${hashtest} order -set -bnum 5000 -msiz 50000 casket 10000                  >> ${log} || exit 1
${hashtest} order -get -msiz 50000 casket 10000                             >> ${log} || exit 1
${hashtest} order -getw -msiz 5000 casket 10000                             >> ${log} || exit 1
${hashtest} order -rem -msiz 50000 casket 10000                             >> ${log} || exit 1
${hashtest} order -bnum 5000 -msiz 50000 casket 10000                       >> ${log} || exit 1
${hashtest} order -etc -bnum 5000 -msiz 50000 -dfunit 4 casket 10000        >> ${log} || exit 1
${hashtest} order -th 4 -bnum 5000 -msiz 50000 -dfunit 4 casket 10000       >> ${log} || exit 1
${hashtest} order -th 4 -rnd -etc -bnum 5000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} order -th 4 -rnd -etc -tran -bnum 5000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} order -th 4 -rnd -etc -oat -bnum 5000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} order -th 4 -rnd -etc -apow 2 -fpow 3 -ts -tl -tc -bnum 5000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} queue -bnum 5000 -msiz 50000 casket 10000                       >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} queue -rnd -bnum 5000 -msiz 50000 casket 10000                  >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} queue -th 4 -it 4 -bnum 5000 -msiz 50000 casket 10000           >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} queue -th 4 -it 4 -rnd -bnum 5000 -msiz 50000 casket 10000      >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} wicked -bnum 5000 -msiz 50000 casket 10000                      >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} wicked -th 4 -it 4 -bnum 5000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} wicked -th 4 -it 4 -oat -bnum 5000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} wicked -th 4 -it 4 -apow 2 -fpow 3 -ts -tl -tc -bnum 10000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
${hashmgr} check -onr casket                                                >> ${log} || exit 1
${hashtest} tran casket 10000                                               >> ${log} || exit 1
${hashtest} tran -th 2 -it 4 casket 10000                                   >> ${log} || exit 1
${hashtest} tran -th 2 -it 4 -apow 2 -fpow 3 -ts -tl -tc -bnum 10000 -msiz 50000 -dfunit 4 casket 10000 >> ${log} || exit 1
echo "OK"


