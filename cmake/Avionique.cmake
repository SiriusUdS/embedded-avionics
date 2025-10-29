# cmake/Avionique.cmake
# Toolchain file for STM32F4

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ARM)

# Prevent CMake from testing the compiler
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# CPU flags for STM32F4 Cortex-M4
set(CPU_FLAGS "-mcpu=cortex-m4 -mthumb -mfpu=fpv4-sp-d16 -mfloat-abi=hard")

# Linker script path
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/STM32F411XX_FLASH.ld")

# Common flags
set(COMMON_FLAGS "${CPU_FLAGS} -fdata-sections -ffunction-sections -Wall")

# Compiler flags (use _INIT to avoid duplication)
set(CMAKE_C_FLAGS_INIT "${COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${COMMON_FLAGS}")
set(CMAKE_ASM_FLAGS_INIT "${CPU_FLAGS} -x assembler-with-cpp")

# Force flags for all configurations
set(CMAKE_C_FLAGS "${COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS "${COMMON_FLAGS}")
set(CMAKE_ASM_FLAGS "${CPU_FLAGS} -x assembler-with-cpp")

# Linker flags (use _INIT to avoid duplication)
set(CMAKE_EXE_LINKER_FLAGS_INIT "-T${LINKER_SCRIPT} -Wl,--gc-sections -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--print-memory-usage")

# Debug flags
set(CMAKE_C_FLAGS_DEBUG "-g -Og")
set(CMAKE_CXX_FLAGS_DEBUG "-g -Og")

# Release flags
set(CMAKE_C_FLAGS_RELEASE "-O2 -DNDEBUG")
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -DNDEBUG")

# Compiler executables (if not in PATH)
# set(CMAKE_C_COMPILER arm-none-eabi-gcc)
# set(CMAKE_CXX_COMPILER arm-none-eabi-g++)
# set(CMAKE_ASM_COMPILER arm-none-eabi-gcc)

# Post-build commands utilities
find_program(CMAKE_OBJCOPY arm-none-eabi-objcopy)
find_program(CMAKE_SIZE arm-none-eabi-size)
find_program(CMAKE_OBJDUMP arm-none-eabi-objdump)