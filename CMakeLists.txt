cmake_minimum_required (VERSION 3.0)
project( kyoto-btree )

#find_package( Boost REQUIRED )

#SET( ROMZ_CXX_FLAGS -Wall -Wpedantic -Wextra -O2 -std=c++11 )
#SET( ROMZ_CXX_FLAGS -Wall -Wpedantic -Wextra -pthread -g -O0 -fprofile-arcs -ftest-coverage -std=c++11 )
SET( ROMZ_CXX_FLAGS -pthread -g -O0 -fprofile-arcs -ftest-coverage -std=c++11 )

#SET( ROMZ_C_FLAGS -Wall -Wpedantic -Wextra -pthread -g -O0 -fprofile-arcs -ftest-coverage )


include(CTest)
enable_testing(true)
add_subdirectory(3rdparty/googletest)


add_subdirectory(src)

#add_subdirectory(tests/unita)
#add_subdirectory(tests/unitb)
#add_subdirectory(tests/db)

