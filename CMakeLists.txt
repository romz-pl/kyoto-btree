cmake_minimum_required (VERSION 3.0)
project( kyoto-btree )

#find_package( Boost REQUIRED )

#SET( ROMZ_CXX_FLAGS -Wall -Wpedantic -Wextra -O2 -std=c++11 )
#SET( ROMZ_CXX_FLAGS -Wall -Wpedantic -Wextra -pthread -g -O0 -fprofile-arcs -ftest-coverage -std=c++11 )
SET( ROMZ_CXX_FLAGS -pthread -g -O0 -fprofile-arcs -ftest-coverage -std=c++11 )

#SET( ROMZ_C_FLAGS -Wall -Wpedantic -Wextra -pthread -g -O0 -fprofile-arcs -ftest-coverage )

SET( ROMZ_C_FLAGS -pthread -g -O0 -fprofile-arcs -ftest-coverage )

#include(CTest)
#enable_testing(true)
add_subdirectory(3rdparty/googletest)


add_subdirectory(src)

add_subdirectory(tests/cachetest)
add_subdirectory(tests/dirmgr)
add_subdirectory(tests/dirtest)
add_subdirectory(tests/forestmgr)
add_subdirectory(tests/foresttest)
add_subdirectory(tests/grasstest)
add_subdirectory(tests/hashmgr)
add_subdirectory(tests/hashtest)
add_subdirectory(tests/langctest)
add_subdirectory(tests/polymgr)
add_subdirectory(tests/polytest)
add_subdirectory(tests/prototest)
add_subdirectory(tests/stashtest)
add_subdirectory(tests/treemgr)
add_subdirectory(tests/treetest)
add_subdirectory(tests/utilmgr)
add_subdirectory(tests/utiltest)

