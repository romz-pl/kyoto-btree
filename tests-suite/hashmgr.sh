#!/bin/bash

echo -n "hashmgr... "
hashmgr=./tests/hashmgr/hashmgr
log=hashmgr.log
rm -rf casket*
${hashmgr} create -otr -apow 1 -fpow 2 -bnum 3 casket   >> ${log} || exit 1
${hashmgr} inform -st casket                            >> ${log} || exit 1
${hashmgr} set -add casket duffy 1231                   >> ${log} || exit 1
${hashmgr} set -add casket micky 0101                   >> ${log} || exit 1
${hashmgr} set casket fal 1007                          >> ${log} || exit 1
${hashmgr} set casket mikio 0211                        >> ${log} || exit 1
${hashmgr} set casket natsuki 0810                      >> ${log} || exit 1
${hashmgr} set casket micky ""                          >> ${log} || exit 1
${hashmgr} set -app casket duffy kukuku                 >> ${log} || exit 1
${hashmgr} remove casket micky                          >> ${log} || exit 1
${hashmgr} list -pv casket > check.out                  >> ${log} || exit 1
${hashmgr} set casket ryu 1                             >> ${log} || exit 1
${hashmgr} set casket ken 2                             >> ${log} || exit 1
${hashmgr} remove casket duffy                          >> ${log} || exit 1
${hashmgr} set casket ryu syo-ryu-ken                   >> ${log} || exit 1
${hashmgr} set casket ken tatsumaki-senpu-kyaku         >> ${log} || exit 1
${hashmgr} set -inci casket int 1234                    >> ${log} || exit 1
${hashmgr} set -inci casket int 5678                    >> ${log} || exit 1
${hashmgr} set -incd casket double 1234.5678            >> ${log} || exit 1
${hashmgr} set -incd casket double 8765.4321            >> ${log} || exit 1
${hashmgr} get casket mikio                             >> ${log} || exit 1
${hashmgr} get casket ryu                               >> ${log} || exit 1
#${hashmgr} import casket lab/numbers.tsv                >> ${log} || exit 1
${hashmgr} list -pv -px casket > check.out              >> ${log} || exit 1
${hashmgr} copy casket casket-para                      >> ${log} || exit 1
${hashmgr} dump casket check.out                        >> ${log} || exit 1
${hashmgr} load -otr casket check.out                   >> ${log} || exit 1
${hashmgr} defrag -onl casket                           >> ${log} || exit 1
${hashmgr} setbulk casket aa aaa bb bbb cc ccc dd ddd   >> ${log} || exit 1
${hashmgr} removebulk casket aa bb zz                   >> ${log} || exit 1
${hashmgr} getbulk casket aa bb cc dd                   >> ${log} || exit 1
${hashmgr} check -onr casket                            >> ${log} || exit 1
${hashmgr} inform -st casket                            >> ${log} || exit 1
${hashmgr} create -otr -otl -onr -apow 1 -fpow 3 -ts -tl -tc -bnum 1 casket >> ${log} || exit 1
#${hashmgr} import casket < lab/numbers.tsv              >> ${log} || exit 1
${hashmgr} set casket mikio kyotocabinet                >> ${log} || exit 1
${hashmgr} set -app casket tako ikaunini                >> ${log} || exit 1
${hashmgr} set -app casket mikio kyototyrant            >> ${log} || exit 1
${hashmgr} set -app casket mikio kyotodystopia          >> ${log} || exit 1
${hashmgr} get -px casket mikio > check.out             >> ${log} || exit 1
${hashmgr} list casket > check.out                      >> ${log} || exit 1
${hashmgr} check -onr casket                            >> ${log} || exit 1
${hashmgr} clear casket                                 >> ${log} || exit 1
echo "OK"


