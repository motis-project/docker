set(CMAKE_C_COMPILER /usr/bin/clang-9)
set(CMAKE_CXX_COMPILER /usr/bin/clang++-9)
set(CMAKE_CXX_COMPILER_LAUNCHER /usr/bin/ccache)
set(CMAKE_C_COMPILER_LAUNCHER /usr/bin/ccache)

set(CMAKE_C_FLAGS "-fsanitize=address,undefined -fno-omit-frame-pointer -fcolor-diagnostics" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-fsanitize=address,undefined -fno-omit-frame-pointer -fcolor-diagnostics -stdlib=libc++" CACHE STRING "" FORCE)

set(BOOST_ROOT /opt/boost_1_71_0-libc++)
