#!/bin/bash

echo -n "polytest... "
polytest=./tests/polytest/polytest
polymgr=./tests/polymgr/polymgr
log=polytest.log
rm -rf casket*                                                                                          >> ${log} || exit 1
${polytest} order -set "casket.kct#bnum=5000#msiz=50000" 10000                                          >> ${log} || exit 1
${polytest} order -get "casket.kct#msiz=50000" 10000                                                    >> ${log} || exit 1
${polytest} order -getw "casket.kct#msiz=5000" 10000                                                    >> ${log} || exit 1
${polytest} order -rem "casket.kct#msiz=50000" 10000                                                    >> ${log} || exit 1
${polytest} order "casket.kct#bnum=5000#msiz=50000" 10000                                               >> ${log} || exit 1
${polytest} order -etc "casket.kct#bnum=5000#msiz=50000#dfunit=4" 10000                                 >> ${log} || exit 1
${polytest} order -th 4 "casket.kct#bnum=5000#msiz=50000#dfunit=4" 10000                                >> ${log} || exit 1
${polytest} order -th 4 -rnd -etc "casket.kct#bnum=5000#msiz=0#dfunit=1" 1000                           >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} order -th 4 -rnd -etc -tran "casket.kct#bnum=5000#msiz=0#dfunit=2" 1000                     >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} order -th 4 -rnd -etc -oat "casket.kct#bnum=5000#msiz=0#dfunit=3" 1000                      >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} order -th 4 -rnd -etc "casket.kct#apow=2#fpow=3#opts=slc#bnum=5000#msiz=0#dfunit=4" 1000    >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} queue "casket.kct#bnum=5000#msiz=0" 10000                                                   >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} queue -rnd "casket.kct#bnum=5000#msiz=0" 10000                                              >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} queue -th 4 -it 4 "casket.kct#bnum=5000#msiz=0" 10000                                       >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} queue -th 4 -it 4 -rnd "casket.kct#bnum=5000#msiz=0" 10000                                  >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
${polytest} wicked "casket.kct#bnum=5000#msiz=0" 1000                                                   >> ${log} || exit 1
${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
#${polytest} wicked -th 4 -it 4 "casket.kct#bnum=5000#msiz=0#dfunit=1" 1000                              >> ${log} || exit 1
#${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
#${polytest} wicked -th 4 -it 4 -oat "casket.kct#bnum=5000#msiz=0#dfunit=1" 1000                         >> ${log} || exit 1
#${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
#${polytest} wicked -th 4 -it 4 "casket.kct#apow=2#fpow=3#opts=slc#bnum=10000#msiz=0#dfunit=1" 10000     >> ${log} || exit 1
#${polymgr} check -onr casket.kct                                                                        >> ${log} || exit 1
#${polytest} tran casket.kct 10000                                                                       >> ${log} || exit 1
#${polytest} tran -th 2 -it 4 casket.kct 10000                                                           >> ${log} || exit 1
#${polytest} tran -th 2 -it 4 "casket.kct#apow=2#fpow=3#opts=slc#bnum=10000#msiz=0#dfunit=1" 1000        >> ${log} || exit 1
#${polytest} mapred -dbnum 2 -clim 10k casket.kct 10000                                                  >> ${log} || exit 1
#${polytest} mapred -tmp . -dbnum 2 -clim 10k -xnl -xnc casket.kct 10000                                 >> ${log} || exit 1
#${polytest} mapred -tmp . -dbnum 2 -clim 10k -xpm -xpr -xpf -xnc casket.kct 10000                       >> ${log} || exit 1
#${polytest} mapred -rnd -dbnum 2 -clim 10k casket.kct 10000                                             >> ${log} || exit 1
#${polytest} index -set "casket.kct#idxclim=32k" 10000                                                   >> ${log} || exit 1
#${polytest} index -get "casket.kct" 10000                                                               >> ${log} || exit 1
#${polytest} index -rem "casket.kct" 10000                                                               >> ${log} || exit 1
#${polytest} index -etc "casket.kct#idxclim=32k" 10000                                                   >> ${log} || exit 1
#${polytest} index -th 4 -rnd -set "casket.kct#idxclim=32k#idxdbnum=4" 10000                             >> ${log} || exit 1
#${polytest} index -th 4 -rnd -get "casket.kct" 10000                                                    >> ${log} || exit 1
#${polytest} index -th 4 -rnd -rem "casket.kct" 10000                                                    >> ${log} || exit 1
#${polytest} index -th 4 -rnd -etc "casket.kct#idxclim=32k#idxdbnum=4" 10000                             >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} order -rnd "casket.kcx" 10000                                                               >> ${log} || exit 1
#${polytest} order -th 4 -rnd "casket.kcx" 10000                                                         >> ${log} || exit 1
#${polytest} wicked "casket.kcx" 10000                                                                   >> ${log} || exit 1
#${polytest} wicked -th 4 "casket.kcx" 10000                                                             >> ${log} || exit 1
#${polymgr} list -pv "casket.kcx" > check.out                                                            >> ${log} || exit 1
#${polymgr} list -max 1000 -pv "casket.kcx" > check.out                                                  >> ${log} || exit 1
#${polytest} mapred "casket.kcx" 10000                                                                   >> ${log} || exit 1
#${polytest} mapred -xpm -xpr -xpf "casket.kcx" 10000                                                    >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} order -rnd "casket.kch#opts=s#bnum=256" 1000                                                >> ${log} || exit 1
#${polytest} order -rnd "casket.kct#opts=l#psiz=256" 1000                                                >> ${log} || exit 1
#${polytest} order -rnd "casket.kcd#opts=c#bnum=256" 500                                                 >> ${log} || exit 1
#${polytest} order -rnd "casket.kcf#opts=c#psiz=256" 500                                                 >> ${log} || exit 1
#${polytest} order -rnd "casket.kcx" 500                                                                 >> ${log} || exit 1
#${polymgr} merge -add "casket#type=kct" casket.kch casket.kct casket.kcd casket.kcf casket.kcx          >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} misc "casket#type=-"                                                                        >> ${log} || exit 1
#${polytest} misc "casket#type=+"                                                                        >> ${log} || exit 1
#${polytest} misc "casket#type=:"                                                                        >> ${log} || exit 1
#${polytest} misc "casket#type=*#zcomp=def"                                                              >> ${log} || exit 1
#${polytest} misc "casket#type=%#zcomp=gz"                                                               >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} misc "casket#type=kch#log=-#logkinds=debug#mtrg=-#zcomp=lzocrc"                             >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} misc "casket#type=kct#log=-#logkinds=debug#mtrg=-#zcomp=lzmacrc"                            >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} misc "casket#type=kcd#zcomp=arc#zkey=mikio"                                                 >> ${log} || exit 1
#rm -rf casket*                                                                                          >> ${log} || exit 1
#${polytest} misc "casket#type=kcf#zcomp=arc#zkey=mikio"                                                 >> ${log} || exit 1
echo "OK"

