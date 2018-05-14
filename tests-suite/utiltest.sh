#!/bin/bash


echo -n "utiltest... "
utiltest=./tests/utiltest/utiltest
utilmgr=./tests/utilmgr/utilmgr
log=utiltest.log
rm -rf casket*                                      >> ${log} || exit 1
${utiltest} mutex -th 4 -iv -1 10000                >> ${log} || exit 1
${utiltest} cond -th 4 -iv -1 10000                 >> ${log} || exit 1
${utiltest} para -th 4 10000                        >> ${log} || exit 1
${utiltest} para -th 4 -iv -1 10000                 >> ${log} || exit 1
${utiltest} file -th 4 casket 10000                 >> ${log} || exit 1
${utiltest} file -th 4 -rnd -msiz 1m casket 10000   >> ${log} || exit 1
${utiltest} lhmap -bnum 1000 10000                  >> ${log} || exit 1
${utiltest} lhmap -rnd -bnum 1000 10000             >> ${log} || exit 1
${utiltest} thmap -bnum 1000 10000                  >> ${log} || exit 1
${utiltest} thmap -rnd -bnum 1000 10000             >> ${log} || exit 1
${utiltest} talist 10000                            >> ${log} || exit 1
${utiltest} talist -rnd 10000                       >> ${log} || exit 1
${utiltest} misc 10000                              >> ${log} || exit 1
echo "OK"


