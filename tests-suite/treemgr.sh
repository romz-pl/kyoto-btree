#!/bin/bash

echo -n "treemgr... "
treemgr=./tests/treemgr/treemgr
log=treemgr.log
rm -rf casket*                                              >> ${log} || exit 1
${treemgr} create -otr -apow 1 -fpow 2 -bnum 3 casket       >> ${log} || exit 1
${treemgr} inform -st casket                                >> ${log} || exit 1
${treemgr} set -add casket duffy 1231                       >> ${log} || exit 1
${treemgr} set -add casket micky 0101                       >> ${log} || exit 1
${treemgr} set casket fal 1007                              >> ${log} || exit 1
${treemgr} set casket mikio 0211                            >> ${log} || exit 1
${treemgr} set casket natsuki 0810                          >> ${log} || exit 1
${treemgr} set casket micky ""                              >> ${log} || exit 1
${treemgr} set -app casket duffy kukuku                     >> ${log} || exit 1
${treemgr} remove casket micky                              >> ${log} || exit 1
${treemgr} list -pv casket > check.out                      >> ${log} || exit 1
${treemgr} set casket ryu 1                                 >> ${log} || exit 1
${treemgr} set casket ken 2                                 >> ${log} || exit 1
${treemgr} remove casket duffy                              >> ${log} || exit 1
${treemgr} set casket ryu syo-ryu-ken                       >> ${log} || exit 1
${treemgr} set casket ken tatsumaki-senpu-kyaku             >> ${log} || exit 1
${treemgr} set -inci casket int 1234                        >> ${log} || exit 1
${treemgr} set -inci casket int 5678                        >> ${log} || exit 1
${treemgr} set -incd casket double 1234.5678                >> ${log} || exit 1
${treemgr} set -incd casket double 8765.4321                >> ${log} || exit 1
${treemgr} get casket mikio                                 >> ${log} || exit 1
${treemgr} get casket ryu                                   >> ${log} || exit 1
#${treemgr} import casket lab/numbers.tsv                   >> ${log} || exit 1
${treemgr} list -des -pv -px casket > check.out             >> ${log} || exit 1
${treemgr} copy casket casket-para                          >> ${log} || exit 1
${treemgr} dump casket check.out                            >> ${log} || exit 1
${treemgr} load -otr casket check.out                       >> ${log} || exit 1
${treemgr} defrag -onl casket                               >> ${log} || exit 1
${treemgr} setbulk casket aa aaa bb bbb cc ccc dd ddd       >> ${log} || exit 1
${treemgr} removebulk casket aa bb zz                       >> ${log} || exit 1
${treemgr} getbulk casket aa bb cc dd                       >> ${log} || exit 1
${treemgr} check -onr casket                                >> ${log} || exit 1
${treemgr} inform -st casket                                >> ${log} || exit 1
${treemgr} create -otr -otl -onr -apow 1 -fpow 3 -ts -tl -tc -bnum 1 casket  >> ${log} || exit 1
#${treemgr} import casket < lab/numbers.tsv                 >> ${log} || exit 1
${treemgr} set casket mikio kyotocabinet                    >> ${log} || exit 1
${treemgr} set -app casket tako ikaunini                    >> ${log} || exit 1
${treemgr} set -app casket mikio kyototyrant                >> ${log} || exit 1
${treemgr} set -app casket mikio kyotodystopia              >> ${log} || exit 1
${treemgr} get -px casket mikio > check.out                 >> ${log} || exit 1
${treemgr} list casket > check.out                          >> ${log} || exit 1
${treemgr} check -onr casket                                >> ${log} || exit 1
${treemgr} clear casket                                     >> ${log} || exit 1
echo "OK"


