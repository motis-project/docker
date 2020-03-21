set(CMAKE_C_COMPILER /usr/bin/gcc-7)
set(CMAKE_CXX_COMPILER /usr/bin/g++-7)
set(CMAKE_CXX_COMPILER_LAUNCHER /usr/bin/ccache)
set(CMAKE_C_COMPILER_LAUNCHER /usr/bin/ccache)

set(CMAKE_C_FLAGS "-fdiagnostics-color=always" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-fdiagnostics-color=always" CACHE STRING "" FORCE)

set(BOOST_ROOT /opt/boost_1_71_0)
