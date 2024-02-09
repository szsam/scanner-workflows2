#!/usr/bin/env bash

set -e

git clone https://github.com/eclipse-threadx/threadx.git
# Insert "add_subdirectory(threadx)" before "target_link_libraries(...azrtos::threadx)"
sed -i '/target_link_libraries(.*threadx/ i\add_subdirectory(threadx)' CMakeLists.txt
cmake -Bbuild -GNinja -DCMAKE_TOOLCHAIN_FILE=cmake/cortex_m4.cmake -DNXD_ENABLE_FILE_SERVERS=OFF .
cmake --build ./build
