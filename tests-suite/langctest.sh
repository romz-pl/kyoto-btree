#!/bin/bash

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


