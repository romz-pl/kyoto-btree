#!/bin/bash

echo -n "utilmgr... "
utilmgr=./tests/utilmgr/utilmgr
log=utilmgr.log
rm -rf casket*
${utilmgr} version                                >> ${log} || exit 1
${utilmgr} hex Makefile > check.in                          || exit 1
${utilmgr} hex -d check.in > check.out                      || exit 1
${utilmgr} enc Makefile > check.in                          || exit 1
${utilmgr} enc -d check.in > check.out                      || exit 1
${utilmgr} enc -hex Makefile > check.in                     || exit 1
${utilmgr} enc -hex -d check.in > check.out                 || exit 1
${utilmgr} enc -url Makefile > check.in                     || exit 1
${utilmgr} enc -url -d check.in > check.out                 || exit 1
${utilmgr} enc -quote Makefile > check.in                   || exit 1
${utilmgr} enc -quote -d check.in > check.out               || exit 1
${utilmgr} ciph -key "hoge" Makefile > check.in             || exit 1
${utilmgr} ciph -key "hoge" check.in > check.out            || exit 1
${utilmgr} comp -gz Makefile > check.in                     || exit 1
${utilmgr} comp -gz -d check.in > check.out                 || exit 1
${utilmgr} comp -lzo Makefile > check.in                    || exit 1
${utilmgr} comp -lzo -d check.in > check.out                || exit 1
${utilmgr} comp -lzma Makefile > check.in                   || exit 1
${utilmgr} comp -lzma -d check.in > check.out               || exit 1
${utilmgr} hash Makefile > check.in                         || exit 1
${utilmgr} hash -fnv Makefile > check.out                   || exit 1
${utilmgr} hash -path Makefile > check.out                  || exit 1
${utilmgr} regex mikio Makefile > check.out                 || exit 1
${utilmgr} regex -alt "hirarin" mikio Makefile > check.out  || exit 1
${utilmgr} conf                                   >> ${log} || exit 1
echo "OK"


