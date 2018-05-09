
set( LIB_NAME kyoto )

add_library( ${LIB_NAME} STATIC
  kccachedb.cc
  kccompare.cc
  kccompress.cc
  kcdb.cc
  kcdbext.cc
  kcdirdb.cc
  kcfile.cc
  kchashdb.cc
  kclangc.cc
  kcmap.cc
  kcplantdb.cc
  kcpolydb.cc
  kcprotodb.cc
  kcregex.cc
  kcstashdb.cc
  kctextdb.cc
  kcthread.cc
  kcutil.cc
)

target_include_directories( ${LIB_NAME} PRIVATE 
    ${PROJECT_SOURCE_DIR}/src 
    #${PROJECT_SOURCE_DIR}/include
)

target_compile_options( ${LIB_NAME} PRIVATE ${ROMZ_CXX_FLAGS} )


