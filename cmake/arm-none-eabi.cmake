# cmake/arm-none-eabi.cmake
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Use toolchain in PATH (recommended), or put full path here if needed
set(CMAKE_C_COMPILER arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# Important: don't try to link an executable for host when testing compiler
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Common flags (keep generic)
set(COMMON_FLAGS "-ffunction-sections -fdata-sections -Wall -Wextra -g3")
set(CMAKE_C_FLAGS "${COMMON_FLAGS}" CACHE INTERNAL "c flags")
set(CMAKE_CXX_FLAGS "${COMMON_FLAGS}" CACHE INTERNAL "cxx flags")
