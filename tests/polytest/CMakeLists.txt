set( TEST_NAME polytest )

add_executable( ${TEST_NAME}
    kcpolytest.cc
)

target_compile_options( ${TEST_NAME} PRIVATE ${ROMZ_CXX_FLAGS} )

target_include_directories( ${TEST_NAME} PRIVATE 
    ${PROJECT_SOURCE_DIR}/src
    ${PROJECT_SOURCE_DIR}/tests
)

target_link_libraries( ${TEST_NAME} 
    -fprofile-arcs 
    gtest 
    gtest_main 
    kyoto
    -lpthread 
    -ldl
)

# add_test( NAME ${TEST_NAME} COMMAND ${TEST_NAME} )

