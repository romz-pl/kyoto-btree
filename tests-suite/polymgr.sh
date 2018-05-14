#!/bin/bash


echo -n "polymgr... "
polymgr=./tests/polymgr/polymgr
log=polymgr.log
rm -rf casket*
${polymgr} create -otr "casket.kch#apow=1#fpow=2#bnum=3"    >> ${log} || exit 1
${polymgr} inform -st casket.kch                            >> ${log} || exit 1
${polymgr} set -add casket.kch duffy 1231                   >> ${log} || exit 1
${polymgr} set -add casket.kch micky 0101                   >> ${log} || exit 1
${polymgr} set casket.kch fal 1007                          >> ${log} || exit 1
${polymgr} set casket.kch mikio 0211                        >> ${log} || exit 1
${polymgr} set casket.kch natsuki 0810                      >> ${log} || exit 1
${polymgr} set casket.kch micky ""                          >> ${log} || exit 1
${polymgr} set -app casket.kch duffy kukuku                 >> ${log} || exit 1
${polymgr} remove casket.kch micky                          >> ${log} || exit 1
${polymgr} list -pv casket.kch > check.out                  >> ${log} || exit 1
${polymgr} copy casket.kch casket-para                      >> ${log} || exit 1
${polymgr} dump casket.kch check.out                        >> ${log} || exit 1
${polymgr} load -otr casket.kch check.out                   >> ${log} || exit 1
${polymgr} set casket.kch ryu 1                             >> ${log} || exit 1
${polymgr} set casket.kch ken 2                             >> ${log} || exit 1
${polymgr} remove casket.kch duffy                          >> ${log} || exit 1
${polymgr} set casket.kch ryu syo-ryu-ken                   >> ${log} || exit 1
${polymgr} set casket.kch ken tatsumaki-senpu-kyaku         >> ${log} || exit 1
${polymgr} set -inci casket.kch int 1234                    >> ${log} || exit 1
${polymgr} set -inci casket.kch int 5678                    >> ${log} || exit 1
${polymgr} set -incd casket.kch double 1234.5678            >> ${log} || exit 1
${polymgr} set -incd casket.kch double 8765.4321            >> ${log} || exit 1
${polymgr} get "casket.kch" mikio                           >> ${log} || exit 1
${polymgr} get "casket.kch" ryu                             >> ${log} || exit 1
#${polymgr} import casket.kch lab/numbers.tsv                >> ${log} || exit 1
${polymgr} list -pv -px "casket.kch#mode=r" > check.out     >> ${log} || exit 1
${polymgr} setbulk casket.kch aa aaa bb bbb cc ccc dd ddd   >> ${log} || exit 1
${polymgr} removebulk casket.kch aa bb zz                   >> ${log} || exit 1
${polymgr} getbulk casket.kch aa bb cc dd                   >> ${log} || exit 1
${polymgr} check -onr casket.kch                            >> ${log} || exit 1
${polymgr} inform -st casket.kch                            >> ${log} || exit 1
${polymgr} create -otr -otl -onr "casket.kct#apow=1#fpow=3#opts=slc#bnum=1" >> ${log} || exit 1
#${polymgr} import casket.kct < lab/numbers.tsv              >> ${log} || exit 1
${polymgr} set casket.kct mikio kyotocabinet                >> ${log} || exit 1
${polymgr} set -app casket.kct tako ikaunini                >> ${log} || exit 1
${polymgr} set -app casket.kct mikio kyototyrant            >> ${log} || exit 1
${polymgr} set -app casket.kct mikio kyotodystopia          >> ${log} || exit 1
${polymgr} get -px casket.kct mikio > check.out             >> ${log} || exit 1
${polymgr} list casket.kct > check.out                      >> ${log} || exit 1
${polymgr} check -onr casket.kct                            >> ${log} || exit 1
${polymgr} clear casket.kct                                 >> ${log} || exit 1
echo "OK"


