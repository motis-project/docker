set(CMAKE_C_COMPILER /usr/bin/clang-9)
set(CMAKE_CXX_COMPILER /usr/bin/clang++-9)
set(CMAKE_CXX_COMPILER_LAUNCHER /usr/bin/ccache)
set(CMAKE_C_COMPILER_LAUNCHER /usr/bin/ccache)

set(CMAKE_C_FLAGS "-fcolor-diagnostics" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-fcolor-diagnostics  -stdlib=libc++" CACHE STRING "" FORCE)
set(CMAKE_CXX_LINKER_FLAGS "-static -stdlib=libc++ -lc++abi -pthread" CACHE STRING "" FORCE)
set(CMAKE_CXX_EXE_LINKER_FLAGS "-static -stdlib=libc++ -lc++abi -pthread" CACHE STRING "" FORCE)

set(BOOST_ROOT /opt/boost_1_72_0-libc++)
