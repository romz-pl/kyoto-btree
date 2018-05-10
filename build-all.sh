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

echo -n "cachetest..."
tt=./tests/cachetest/cachetest
log=cachetest.log
rm -rf ${log}
${tt} order -etc -bnum 5000 10000                                     > ${log} || exit 1
${tt} order -th 4 -bnum 5000 10000                                   >> ${log} || exit 1
${tt} order -th 4 -rnd -etc -bnum 5000 -capcnt 10000 10000           >> ${log} || exit 1
${tt} order -th 4 -rnd -etc -bnum 5000 -capsiz 10000 10000           >> ${log} || exit 1
${tt} order -th 4 -rnd -etc -tran -tc -bnum 5000 -capcnt 10000 10000 >> ${log} || exit 1
${tt} wicked -bnum 5000 10000                                        >> ${log} || exit 1
${tt} wicked -th 4 -it 4 -tc -bnum 5000 -capcnt 10000 10000          >> ${log} || exit 1
${tt} tran -bnum 5000 10000                                          >> ${log} || exit 1
${tt} tran -th 2 -it 4 -tc -bnum 5000 10000                          >> ${log} || exit 1
echo "OK"


echo -n "dirmgr..."
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


echo -n "dirtest..."
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


echo -n "forestmgr..."
rm -rf casket* 
forestmgr=./tests/forestmgr/forestmgr
log=dirtest.log 
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




