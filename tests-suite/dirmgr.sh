#!/bin/bash

echo -n "dirmgr... "
dirmgr=./tests/dirmgr/dirmgr
log=dirmgr.log
rm -rf ${log}
${dirmgr} create -otr casket                            >> ${log} || exit 1
${dirmgr} inform -st casket                             >> ${log} || exit 1
${dirmgr} set -add casket duffy 1231                    >> ${log} || exit 1
${dirmgr} set -add casket micky 0101                    >> ${log} || exit 1
${dirmgr} set casket fal 1007                           >> ${log} || exit 1
${dirmgr} set casket mikio 0211                         >> ${log} || exit 1
${dirmgr} set casket natsuki 0810                       >> ${log} || exit 1
${dirmgr} set casket micky ""                           >> ${log} || exit 1
${dirmgr} set -app casket duffy kukuku                  >> ${log} || exit 1
${dirmgr} remove casket micky                           >> ${log} || exit 1
${dirmgr} list -pv casket > check.out                   >> ${log} || exit 1
${dirmgr} set casket ryu 1                              >> ${log} || exit 1
${dirmgr} set casket ken 2                              >> ${log} || exit 1
${dirmgr} remove casket duffy                           >> ${log} || exit 1
${dirmgr} set casket ryu syo-ryu-ken                    >> ${log} || exit 1
${dirmgr} set casket ken tatsumaki-senpu-kyaku          >> ${log} || exit 1
${dirmgr} set -inci casket int 1234                     >> ${log} || exit 1
${dirmgr} set -inci casket int 5678                     >> ${log} || exit 1
${dirmgr} set -incd casket double 1234.5678             >> ${log} || exit 1
${dirmgr} set -incd casket double 8765.4321             >> ${log} || exit 1
${dirmgr} get casket mikio                              >> ${log} || exit 1
${dirmgr} get casket ryu                                >> ${log} || exit 1
#${dirmgr} import casket lab/numbers.tsv                >> ${log} || exit 1
${dirmgr} list -pv -px casket > check.out               >> ${log} || exit 1
${dirmgr} copy casket casket-para                       >> ${log} || exit 1
${dirmgr} dump casket check.out                         >> ${log} || exit 1
${dirmgr} load -otr casket check.out                    >> ${log} || exit 1
${dirmgr} setbulk casket aa aaa bb bbb cc ccc dd ddd    >> ${log} || exit 1
${dirmgr} removebulk casket aa bb zz                    >> ${log} || exit 1
${dirmgr} getbulk casket aa bb cc dd                    >> ${log} || exit 1
${dirmgr} check -onr casket                             >> ${log} || exit 1
${dirmgr} inform -st casket                             >> ${log} || exit 1
${dirmgr} create -otr -otl -onr -tc casket              >> ${log} || exit 1
#${dirmgr} import casket < lab/numbers.tsv              >> ${log} || exit 1
${dirmgr} set casket mikio kyotocabinet                 >> ${log} || exit 1
${dirmgr} set -app casket tako ikaunini                 >> ${log} || exit 1
${dirmgr} set -app casket mikio kyototyrant             >> ${log} || exit 1
${dirmgr} set -app casket mikio kyotodystopia           >> ${log} || exit 1
${dirmgr} get -px casket mikio > check.out              >> ${log} || exit 1
${dirmgr} list casket > check.out                       >> ${log} || exit 1
${dirmgr} check -onr casket                             >> ${log} || exit 1
${dirmgr} clear casket                                  >> ${log} || exit 1
echo "OK"

