#!/bin/bash

echo -n "foresttest... "
rm -rf casket* 
foresttest=./tests/foresttest/foresttest
forestmgr=./tests/forestmgr/forestmgr
log=foresttest.log 
${foresttest} order -set -psiz 100 -bnum 5000 -pccap 100k casket 5000                               >> ${log} || exit 1
${foresttest} order -get -pccap 100k casket 5000                                                    >> ${log} || exit 1
${foresttest} order -getw -pccap 100k casket 5000                                                   >> ${log} || exit 1
${foresttest} order -rem -pccap 100k casket 5000                                                    >> ${log} || exit 1
${foresttest} order -bnum 5000 -psiz 100 -pccap 100k casket 5000                                    >> ${log} || exit 1
${foresttest} order -etc -bnum 5000 -psiz 1000 -pccap 100k casket 5000                              >> ${log} || exit 1
${foresttest} order -th 4 -bnum 5000 -psiz 1000 -pccap 100k casket 5000                             >> ${log} || exit 1
${foresttest} order -th 4 -pccap 100k -rnd -etc -bnum 5000 -psiz 1000 -pccap 100k -rcd casket 5000  >> ${log} || exit 1
${forestmgr} check -onr casket                         		                                        >> ${log} || exit 1
${foresttest} order -th 4 -rnd -etc -tran -bnum 500 -psiz 1000 -pccap 100k casket 500               >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} order -th 4 -rnd -etc -oat -bnum 500 -psiz 1000 -pccap 100k casket 500                >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} order -th 4 -rnd -etc -tc -bnum 5000 -psiz 1000 casket 5000                           >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} queue -bnum 5000 -psiz 500 casket 5000                                                >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} queue -rnd -bnum 5000 -psiz 500 casket 5000                                           >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} queue -th 4 -it 4 -bnum 5000 -psiz 500 casket 5000                                    >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} queue -th 4 -it 4 -rnd -bnum 5000 -psiz 500 casket 5000                               >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} wicked -bnum 5000 -psiz 1000 -pccap 100k casket 5000                                  >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} wicked -th 4 -it 4 -bnum 5000 -pccap 100k -rcd casket 5000                            >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} wicked -th 4 -it 4 -oat -bnum 500 -pccap 100k casket 500                              >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} wicked -th 4 -it 4 -tc -bnum 500 casket 500                                           >> ${log} || exit 1
${forestmgr} check -onr casket                                                                      >> ${log} || exit 1
${foresttest} tran casket 5000                                                                      >> ${log} || exit 1
${foresttest} tran -th 2 -it 4 -pccap 100k casket 5000                                              >> ${log} || exit 1
${foresttest} tran -th 2 -it 4 -tc -bnum 5000 -rcd casket 5000                                      >> ${log} || exit 1
echo "OK"

