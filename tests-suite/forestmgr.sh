#!/bin/bash

echo -n "forestmgr... "
rm -rf casket*
forestmgr=./tests/forestmgr/forestmgr
log=forestmgr.log
rm -rf ${log}
${forestmgr} create -otr -bnum 3 casket             >> ${log} || exit 1
${forestmgr} inform -st casket                      >> ${log} || exit 1
${forestmgr} set -add casket duffy 1231             >> ${log} || exit 1
${forestmgr} set -add casket micky 0101             >> ${log} || exit 1
${forestmgr} set casket fal 1007                    >> ${log} || exit 1
${forestmgr} set casket mikio 0211                  >> ${log} || exit 1
${forestmgr} set casket natsuki 0810                >> ${log} || exit 1
${forestmgr} set casket micky ""                    >> ${log} || exit 1
${forestmgr} set -app casket duffy kukuku           >> ${log} || exit 1
${forestmgr} remove casket micky                    >> ${log} || exit 1
${forestmgr} list -pv casket > check.out            >> ${log} || exit 1
${forestmgr} set casket ryu 1                       >> ${log} || exit 1
${forestmgr} set casket ken 2                       >> ${log} || exit 1
${forestmgr} remove casket duffy                    >> ${log} || exit 1
${forestmgr} set casket ryu syo-ryu-ken             >> ${log} || exit 1
${forestmgr} set casket ken tatsumaki-senpu-kyaku   >> ${log} || exit 1
${forestmgr} set -inci casket int 1234              >> ${log} || exit 1
${forestmgr} set -inci casket int 5678              >> ${log} || exit 1
${forestmgr} set -incd casket double 1234.5678      >> ${log} || exit 1
${forestmgr} set -incd casket double 8765.4321      >> ${log} || exit 1
${forestmgr} get casket mikio                       >> ${log} || exit 1
${forestmgr} get casket ryu                         >> ${log} || exit 1
#${forestmgr} import casket lab/numbers.tsv          >> ${log} || exit 1
${forestmgr} list -des -pv -px casket > check.out   >> ${log} || exit 1
${forestmgr} copy casket casket-para                >> ${log} || exit 1
${forestmgr} dump casket check.out                  >> ${log} || exit 1
${forestmgr} load -otr casket check.out             >> ${log} || exit 1
${forestmgr} setbulk casket aa aaa bb bbb cc ccc dd ddd >> ${log} || exit 1
${forestmgr} removebulk casket aa bb zz             >> ${log} || exit 1
${forestmgr} getbulk casket aa bb cc dd             >> ${log} || exit 1
${forestmgr} check -onr casket                      >> ${log} || exit 1
${forestmgr} inform -st casket                      >> ${log} || exit 1
${forestmgr} create -otr -otl -onr -tc -bnum 1 casket >> ${log} || exit 1
#${forestmgr} import casket < lab/numbers.tsv        >> ${log} || exit 1
${forestmgr} set casket mikio kyotocabinet          >> ${log} || exit 1
${forestmgr} set -app casket tako ikaunini          >> ${log} || exit 1
${forestmgr} set -app casket mikio kyototyrant      >> ${log} || exit 1
${forestmgr} set -app casket mikio kyotodystopia    >> ${log} || exit 1
${forestmgr} get -px casket mikio > check.out       >> ${log} || exit 1
${forestmgr} list casket > check.out                >> ${log} || exit 1
${forestmgr} check -onr casket                      >> ${log} || exit 1
${forestmgr} clear casket                           >> ${log} || exit 1
echo "OK"


