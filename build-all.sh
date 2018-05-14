#!/bin/bash

#
# Create 'build' directory
#
rm -rf build || exit 1
mkdir build || exit 1
cd build || exit 1

#
# Run cmake
#


cmake -D BUILD_GTEST=ON -D BUILD_GMOCK=OFF -D CMAKE_BUILD_TYPE=Debug  .. || exit 1
make -j5 || exit 1

#cmake -D BUILD_GTEST=ON -D BUILD_GMOCK=OFF -D CMAKE_BUILD_TYPE=Debug  .. -G Ninja || exit 1
#ninja


#
# Run test
#
# ctest --verbose
#ctest

echo -n "cachetest... "
cachetest=./tests/cachetest/cachetest
log=cachetest.log
rm -rf ${log}
${cachetest} order -etc -bnum 5000 10000                                     > ${log} || exit 1
${cachetest} order -th 4 -bnum 5000 10000                                   >> ${log} || exit 1
${cachetest} order -th 4 -rnd -etc -bnum 5000 -capcnt 10000 10000           >> ${log} || exit 1
${cachetest} order -th 4 -rnd -etc -bnum 5000 -capsiz 10000 10000           >> ${log} || exit 1
${cachetest} order -th 4 -rnd -etc -tran -tc -bnum 5000 -capcnt 10000 10000 >> ${log} || exit 1
${cachetest} wicked -bnum 5000 10000                                        >> ${log} || exit 1
${cachetest} wicked -th 4 -it 4 -tc -bnum 5000 -capcnt 10000 10000          >> ${log} || exit 1
${cachetest} tran -bnum 5000 10000                                          >> ${log} || exit 1
${cachetest} tran -th 2 -it 4 -tc -bnum 5000 10000                          >> ${log} || exit 1
echo "OK"


echo -n "dirmgr... "
dirmgr=./tests/dirmgr/dirmgr
log=dirmgr.log
rm -rf ${log}
${dirmgr} create -otr casket                    >> ${log} || exit 1
${dirmgr} inform -st casket                     >> ${log} || exit 1
${dirmgr} set -add casket duffy 1231            >> ${log} || exit 1
${dirmgr} set -add casket micky 0101            >> ${log} || exit 1
${dirmgr} set casket fal 1007                   >> ${log} || exit 1
${dirmgr} set casket mikio 0211                 >> ${log} || exit 1
${dirmgr} set casket natsuki 0810               >> ${log} || exit 1
${dirmgr} set casket micky ""                   >> ${log} || exit 1
${dirmgr} set -app casket duffy kukuku          >> ${log} || exit 1
${dirmgr} remove casket micky                   >> ${log} || exit 1
${dirmgr} list -pv casket > check.out           >> ${log} || exit 1
${dirmgr} set casket ryu 1                      >> ${log} || exit 1
${dirmgr} set casket ken 2                      >> ${log} || exit 1
${dirmgr} remove casket duffy                   >> ${log} || exit 1
${dirmgr} set casket ryu syo-ryu-ken            >> ${log} || exit 1
${dirmgr} set casket ken tatsumaki-senpu-kyaku  >> ${log} || exit 1
${dirmgr} set -inci casket int 1234             >> ${log} || exit 1
${dirmgr} set -inci casket int 5678             >> ${log} || exit 1
${dirmgr} set -incd casket double 1234.5678     >> ${log} || exit 1
${dirmgr} set -incd casket double 8765.4321     >> ${log} || exit 1
${dirmgr} get casket mikio                      >> ${log} || exit 1
${dirmgr} get casket ryu                        >> ${log} || exit 1
#${dirmgr} import casket lab/numbers.tsv         >> ${log} || exit 1
${dirmgr} list -pv -px casket > check.out       >> ${log} || exit 1
${dirmgr} copy casket casket-para               >> ${log} || exit 1
${dirmgr} dump casket check.out                 >> ${log} || exit 1
${dirmgr} load -otr casket check.out            >> ${log} || exit 1
${dirmgr} setbulk casket aa aaa bb bbb cc ccc dd ddd >> ${log} || exit 1
${dirmgr} removebulk casket aa bb zz            >> ${log} || exit 1
${dirmgr} getbulk casket aa bb cc dd            >> ${log} || exit 1
${dirmgr} check -onr casket                     >> ${log} || exit 1
${dirmgr} inform -st casket                     >> ${log} || exit 1
${dirmgr} create -otr -otl -onr -tc casket      >> ${log} || exit 1
#${dirmgr} import casket < lab/numbers.tsv       >> ${log} || exit 1
${dirmgr} set casket mikio kyotocabinet         >> ${log} || exit 1
${dirmgr} set -app casket tako ikaunini         >> ${log} || exit 1
${dirmgr} set -app casket mikio kyototyrant     >> ${log} || exit 1
${dirmgr} set -app casket mikio kyotodystopia   >> ${log} || exit 1
${dirmgr} get -px casket mikio > check.out      >> ${log} || exit 1
${dirmgr} list casket > check.out               >> ${log} || exit 1
${dirmgr} check -onr casket                     >> ${log} || exit 1
${dirmgr} clear casket                          >> ${log} || exit 1
echo "OK"


echo -n "dirtest... "
rm -rf casket* 
dirtest=./tests/dirtest/dirtest
log=dirtest.log
rm -rf ${log}                        
${dirtest} order -set casket 500                  >> ${log} || exit 1
${dirtest} order -get casket 500                  >> ${log} || exit 1
${dirtest} order -getw casket 500                 >> ${log} || exit 1
${dirtest} order -rem casket 500                  >> ${log} || exit 1
${dirtest} order casket 500                       >> ${log} || exit 1
${dirtest} order -etc casket 500                  >> ${log} || exit 1
${dirtest} order -th 4 casket 500                 >> ${log} || exit 1
${dirtest} order -th 4 -rnd -etc casket 500       >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} order -th 4 -rnd -etc -tran casket 500 >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} order -th 4 -rnd -etc -oat casket 500  >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} order -th 4 -rnd -etc -tc casket 500   >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} queue casket 500                       >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} queue -rnd casket 500                  >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} queue -th 4 -it 4 casket 500           >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} queue -th 4 -it 4 -rnd casket 500      >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} wicked casket 500                      >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} wicked -th 4 -it 4 casket 500          >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} wicked -th 4 -it 4 -oat casket 500     >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} wicked -th 4 -it 4 -tc casket 500      >> ${log} || exit 1
${dirmgr}  check -onr casket                      >> ${log} || exit 1
${dirtest} tran casket 500                        >> ${log} || exit 1
${dirtest} tran -th 2 -it 4 casket 500            >> ${log} || exit 1
${dirtest} tran -th 2 -it 4 -tc casket 500        >> ${log} || exit 1
echo "OK"


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

echo -n "foresttest... "
rm -rf casket* 
foresttest=./tests/foresttest/foresttest
log=foresttest.log 
${foresttest} order -set -psiz 100 -bnum 5000 -pccap 100k casket 5000       >> ${log} || exit 1
${foresttest} order -get -pccap 100k casket 5000                            >> ${log} || exit 1
${foresttest} order -getw -pccap 100k casket 5000                           >> ${log} || exit 1
${foresttest} order -rem -pccap 100k casket 5000                            >> ${log} || exit 1
${foresttest} order -bnum 5000 -psiz 100 -pccap 100k casket 5000            >> ${log} || exit 1
${foresttest} order -etc -bnum 5000 -psiz 1000 -pccap 100k casket 5000      >> ${log} || exit 1
${foresttest} order -th 4 -bnum 5000 -psiz 1000 -pccap 100k casket 5000     >> ${log} || exit 1
${foresttest} order -th 4 -pccap 100k -rnd -etc -bnum 5000 -psiz 1000 -pccap 100k -rcd casket 5000 >> ${log} || exit 1
${forestmgr} check -onr casket                         		                >> ${log} || exit 1
${foresttest} order -th 4 -rnd -etc -tran -bnum 500 -psiz 1000 -pccap 100k casket 500 >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} order -th 4 -rnd -etc -oat -bnum 500 -psiz 1000 -pccap 100k casket 500 >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} order -th 4 -rnd -etc -tc -bnum 5000 -psiz 1000 casket 5000   >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} queue -bnum 5000 -psiz 500 casket 5000                        >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} queue -rnd -bnum 5000 -psiz 500 casket 5000                   >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} queue -th 4 -it 4 -bnum 5000 -psiz 500 casket 5000            >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} queue -th 4 -it 4 -rnd -bnum 5000 -psiz 500 casket 5000       >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} wicked -bnum 5000 -psiz 1000 -pccap 100k casket 5000          >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} wicked -th 4 -it 4 -bnum 5000 -pccap 100k -rcd casket 5000    >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} wicked -th 4 -it 4 -oat -bnum 500 -pccap 100k casket 500      >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} wicked -th 4 -it 4 -tc -bnum 500 casket 500                   >> ${log} || exit 1
${forestmgr} check -onr casket                                              >> ${log} || exit 1
${foresttest} tran casket 5000                                              >> ${log} || exit 1
${foresttest} tran -th 2 -it 4 -pccap 100k casket 5000                      >> ${log} || exit 1
${foresttest} tran -th 2 -it 4 -tc -bnum 5000 -rcd casket 5000              >> ${log} || exit 1
echo "OK"

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

echo -n "hashtest... "
hashtest=./tests/hashtest/hashtest
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


echo -n "langctest... "
langctest=./tests/langctest/langctest
log=langctest.log 
rm -rf casket* 
${langctest} order "casket.kch#bnum=5000#msiz=50000" 10000                      >> ${log} || exit 1
${langctest} order -etc "casket.kch#bnum=5000#msiz=50000#dfunit=2" 10000        >> ${log} || exit 1
${langctest} order -rnd -etc "casket.kch#bnum=5000#msiz=50000#dfunit=2" 10000   >> ${log} || exit 1
${langctest} order -rnd -etc -oat -tran "casket.kch#bnum=5000#msiz=50000#dfunit=2#zcomp=arcz" 10000 >> ${log} || exit 1
${langctest} index "casket.kct#bnum=5000#msiz=50000" 10000                      >> ${log} || exit 1
${langctest} index -etc "casket.kct#bnum=5000#msiz=50000#dfunit=2" 10000        >> ${log} || exit 1
${langctest} index -rnd -etc "casket.kct#bnum=5000#msiz=50000#dfunit=2" 10000   >> ${log} || exit 1
${langctest} index -rnd -etc -oat "casket.kct#bnum=5000#msiz=50000#dfunit=2#zcomp=arcz" 10000 >> ${log} || exit 1
${langctest} map 10000                                                          >> ${log} || exit 1
${langctest} map -etc -bnum 1000 10000                                          >> ${log} || exit 1
${langctest} map -etc -rnd -bnum 1000 10000                                     >> ${log} || exit 1
${langctest} list 10000                                                         >> ${log} || exit 1
${langctest} list -etc 10000                                                    >> ${log} || exit 1
${langctest} list -etc -rnd 10000                                               >> ${log} || exit 1
echo "OK"

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


echo -n "polytest... "
polytest=./tests/polytest/polytest
log=polytest.log 
rm -rf casket* 
${polytest} order -set "casket.kct#bnum=5000#msiz=50000" 10000 
${polytest} order -get "casket.kct#msiz=50000" 10000 
${polytest} order -getw "casket.kct#msiz=5000" 10000 
${polytest} order -rem "casket.kct#msiz=50000" 10000 
${polytest} order "casket.kct#bnum=5000#msiz=50000" 10000 
${polytest} order -etc "casket.kct#bnum=5000#msiz=50000#dfunit=4" 10000 
${polytest} order -th 4 "casket.kct#bnum=5000#msiz=50000#dfunit=4" 10000 
${polytest} order -th 4 -rnd -etc "casket.kct#bnum=5000#msiz=0#dfunit=1" 1000 
${polymgr} check -onr casket.kct 
${polytest} order -th 4 -rnd -etc -tran "casket.kct#bnum=5000#msiz=0#dfunit=2" 1000 
${polymgr} check -onr casket.kct 
${polytest} order -th 4 -rnd -etc -oat "casket.kct#bnum=5000#msiz=0#dfunit=3" 1000 
${polymgr} check -onr casket.kct 
${polytest} order -th 4 -rnd -etc "casket.kct#apow=2#fpow=3#opts=slc#bnum=5000#msiz=0#dfunit=4" 1000 
${polymgr} check -onr casket.kct 
${polytest} queue "casket.kct#bnum=5000#msiz=0" 10000 
${polymgr} check -onr casket.kct 
${polytest} queue -rnd "casket.kct#bnum=5000#msiz=0" 10000 
${polymgr} check -onr casket.kct 
${polytest} queue -th 4 -it 4 "casket.kct#bnum=5000#msiz=0" 10000 
${polymgr} check -onr casket.kct 
${polytest} queue -th 4 -it 4 -rnd "casket.kct#bnum=5000#msiz=0" 10000 
${polymgr} check -onr casket.kct 
${polytest} wicked "casket.kct#bnum=5000#msiz=0" 1000 
${polymgr} check -onr casket.kct 
${polytest} wicked -th 4 -it 4 "casket.kct#bnum=5000#msiz=0#dfunit=1" 1000 
${polymgr} check -onr casket.kct 
${polytest} wicked -th 4 -it 4 -oat "casket.kct#bnum=5000#msiz=0#dfunit=1" 1000 
${polymgr} check -onr casket.kct 
${polytest} wicked -th 4 -it 4 "casket.kct#apow=2#fpow=3#opts=slc#bnum=10000#msiz=0#dfunit=1" 10000 
${polymgr} check -onr casket.kct 
${polytest} tran casket.kct 10000 
${polytest} tran -th 2 -it 4 casket.kct 10000 
${polytest} tran -th 2 -it 4 "casket.kct#apow=2#fpow=3#opts=slc#bnum=10000#msiz=0#dfunit=1" 1000 
${polytest} mapred -dbnum 2 -clim 10k casket.kct 10000 
${polytest} mapred -tmp . -dbnum 2 -clim 10k -xnl -xnc casket.kct 10000 
${polytest} mapred -tmp . -dbnum 2 -clim 10k -xpm -xpr -xpf -xnc casket.kct 10000 
${polytest} mapred -rnd -dbnum 2 -clim 10k casket.kct 10000 
${polytest} index -set "casket.kct#idxclim=32k" 10000 
${polytest} index -get "casket.kct" 10000 
${polytest} index -rem "casket.kct" 10000 
${polytest} index -etc "casket.kct#idxclim=32k" 10000 
${polytest} index -th 4 -rnd -set "casket.kct#idxclim=32k#idxdbnum=4" 10000 
${polytest} index -th 4 -rnd -get "casket.kct" 10000 
${polytest} index -th 4 -rnd -rem "casket.kct" 10000 
${polytest} index -th 4 -rnd -etc "casket.kct#idxclim=32k#idxdbnum=4" 10000 
rm -rf casket* 
${polytest} order -rnd "casket.kcx" 10000 
${polytest} order -th 4 -rnd "casket.kcx" 10000 
${polytest} wicked "casket.kcx" 10000 
${polytest} wicked -th 4 "casket.kcx" 10000 
${polymgr} list -pv "casket.kcx" > check.out 
${polymgr} list -max 1000 -pv "casket.kcx" > check.out 
${polytest} mapred "casket.kcx" 10000 
${polytest} mapred -xpm -xpr -xpf "casket.kcx" 10000 
rm -rf casket* 
${polytest} order -rnd "casket.kch#opts=s#bnum=256" 1000 
${polytest} order -rnd "casket.kct#opts=l#psiz=256" 1000 
${polytest} order -rnd "casket.kcd#opts=c#bnum=256" 500 
${polytest} order -rnd "casket.kcf#opts=c#psiz=256" 500 
${polytest} order -rnd "casket.kcx" 500 
${polymgr} merge -add "casket#type=kct" casket.kch casket.kct casket.kcd casket.kcf casket.kcx 
rm -rf casket* 
${polytest} misc "casket#type=-" 
${polytest} misc "casket#type=+" 
${polytest} misc "casket#type=:" 
${polytest} misc "casket#type=*#zcomp=def" 
${polytest} misc "casket#type=%#zcomp=gz" 
rm -rf casket* 
${polytest} misc "casket#type=kch#log=-#logkinds=debug#mtrg=-#zcomp=lzocrc" 
rm -rf casket* 
${polytest} misc "casket#type=kct#log=-#logkinds=debug#mtrg=-#zcomp=lzmacrc" 
rm -rf casket* 
${polytest} misc "casket#type=kcd#zcomp=arc#zkey=mikio" 
rm -rf casket* 
${polytest} misc "casket#type=kcf#zcomp=arc#zkey=mikio" 
echo "OK"


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


echo -n "stashtest... "
stashtest=./tests/stashtest/stashtest
log=stashtest.log 
rm -rf casket*  >> ${log} || exit 1
${stashtest} order -etc -bnum 5000 10000                    >> ${log} || exit 1
${stashtest} order -th 4 -bnum 5000 10000                   >> ${log} || exit 1
${stashtest} order -th 4 -rnd -etc -bnum 5000 10000         >> ${log} || exit 1
${stashtest} order -th 4 -rnd -etc -bnum 5000 10000         >> ${log} || exit 1
${stashtest} order -th 4 -rnd -etc -tran -bnum 5000 10000   >> ${log} || exit 1
${stashtest} wicked -bnum 5000 10000                        >> ${log} || exit 1
${stashtest} wicked -th 4 -it 4 -bnum 5000 10000            >> ${log} || exit 1
${stashtest} tran -bnum 5000 10000                          >> ${log} || exit 1
${stashtest} tran -th 2 -it 4 -bnum 5000 10000              >> ${log} || exit 1
echo "OK"

echo -n "treemgr... "
treemgr=./tests/treemgr/treemgr
log=treemgr.log 
rm -rf casket*  >> ${log} || exit 1
${treemgr} create -otr -apow 1 -fpow 2 -bnum 3 casket  >> ${log} || exit 1
${treemgr} inform -st casket  >> ${log} || exit 1
${treemgr} set -add casket duffy 1231  >> ${log} || exit 1
${treemgr} set -add casket micky 0101  >> ${log} || exit 1
${treemgr} set casket fal 1007  >> ${log} || exit 1
${treemgr} set casket mikio 0211  >> ${log} || exit 1
${treemgr} set casket natsuki 0810  >> ${log} || exit 1
${treemgr} set casket micky ""  >> ${log} || exit 1
${treemgr} set -app casket duffy kukuku  >> ${log} || exit 1
${treemgr} remove casket micky  >> ${log} || exit 1
${treemgr} list -pv casket > check.out  >> ${log} || exit 1
${treemgr} set casket ryu 1  >> ${log} || exit 1
${treemgr} set casket ken 2  >> ${log} || exit 1
${treemgr} remove casket duffy  >> ${log} || exit 1
${treemgr} set casket ryu syo-ryu-ken  >> ${log} || exit 1
${treemgr} set casket ken tatsumaki-senpu-kyaku  >> ${log} || exit 1
${treemgr} set -inci casket int 1234  >> ${log} || exit 1
${treemgr} set -inci casket int 5678  >> ${log} || exit 1
${treemgr} set -incd casket double 1234.5678  >> ${log} || exit 1
${treemgr} set -incd casket double 8765.4321  >> ${log} || exit 1
${treemgr} get casket mikio  >> ${log} || exit 1
${treemgr} get casket ryu  >> ${log} || exit 1
${treemgr} import casket lab/numbers.tsv  >> ${log} || exit 1
${treemgr} list -des -pv -px casket > check.out  >> ${log} || exit 1
${treemgr} copy casket casket-para  >> ${log} || exit 1
${treemgr} dump casket check.out  >> ${log} || exit 1
${treemgr} load -otr casket check.out  >> ${log} || exit 1
${treemgr} defrag -onl casket  >> ${log} || exit 1
${treemgr} setbulk casket aa aaa bb bbb cc ccc dd ddd  >> ${log} || exit 1
${treemgr} removebulk casket aa bb zz  >> ${log} || exit 1
${treemgr} getbulk casket aa bb cc dd  >> ${log} || exit 1
${treemgr} check -onr casket  >> ${log} || exit 1
${treemgr} inform -st casket  >> ${log} || exit 1
${treemgr} create -otr -otl -onr -apow 1 -fpow 3 -ts -tl -tc -bnum 1 casket  >> ${log} || exit 1
${treemgr} import casket < lab/numbers.tsv  >> ${log} || exit 1
${treemgr} set casket mikio kyotocabinet  >> ${log} || exit 1
${treemgr} set -app casket tako ikaunini  >> ${log} || exit 1
${treemgr} set -app casket mikio kyototyrant  >> ${log} || exit 1
${treemgr} set -app casket mikio kyotodystopia  >> ${log} || exit 1
${treemgr} get -px casket mikio > check.out  >> ${log} || exit 1
${treemgr} list casket > check.out  >> ${log} || exit 1
${treemgr} check -onr casket  >> ${log} || exit 1
${treemgr} clear casket  >> ${log} || exit 1
echo "OK"





