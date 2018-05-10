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


