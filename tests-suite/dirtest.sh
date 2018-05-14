#!/bin/bash

echo -n "dirtest... "
rm -rf casket*
dirtest=./tests/dirtest/dirtest
dirmgr=./tests/dirmgr/dirmgr
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

