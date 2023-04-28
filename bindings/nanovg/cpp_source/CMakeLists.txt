project(nanovg)

add_library(nanovg nanovg.cpp nanovg_bgfx.cpp)

target_compile_definitions(nanovg PUBLIC NOT_GENERATION)
target_compile_definitions(nanovg PUBLIC BX_CONFIG_DEBUG)

target_compile_options(nanovg PRIVATE -fpie)

target_link_directories(
  nanovg PUBLIC ../../../3rdparty/bgfx/.build/linux64_gcc/bin/libbgfxDebug.a
  ../../../3rdparty/bgfx/.build/linux64_gcc/bin/libbxDebug.a
  ../../../3rdparty/bgfx/.build/linux64_gcc/bin/libbimgDebug.a)

target_include_directories(nanovg PUBLIC ../../../3rdparty/bgfx/include
                                         ../../../3rdparty/bx/include
                                         ../../../3rdparty/bgfx/3rdparty
                                         )
