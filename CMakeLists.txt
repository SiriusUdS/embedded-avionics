cmake_minimum_required(VERSION 3.22)

#
# This file is generated only once,
# and is not re-generated if converter is called multiple times.
#
# User is free to modify the file as much as necessary
#

# Setup compiler settings
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)


# Define the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Debug")
endif()

# Set the project name
set(CMAKE_PROJECT_NAME Avionique)

# Enable compile command to ease indexing with e.g. clangd
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)

# Core project settings
project(${CMAKE_PROJECT_NAME})
message("Build type: " ${CMAKE_BUILD_TYPE})

# Add the HAL library submodule
add_subdirectory(stm32f412-hal)

# Enable CMake support for ASM and C languages
enable_language(C ASM)

# Create an executable object type
add_executable(${CMAKE_PROJECT_NAME})

# Link directories setup
target_link_directories(${CMAKE_PROJECT_NAME} PRIVATE

)

# Add sources to executable
target_sources(${CMAKE_PROJECT_NAME} PRIVATE

${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/main.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/adc.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/gpio.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/i2c.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_hal_msp.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/stm32f4xx_it.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/syscalls.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/sysmem.c
${CMAKE_CURRENT_SOURCE_DIR}/Core/Src/system_stm32f4xx.c
)

# Add include paths
target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    # Add user defined include paths

    ${CMAKE_CURRENT_SOURCE_DIR}/Core/Inc
)

# Add project symbols (macros)
target_compile_definitions(Avionique PRIVATE USE_HAL_DRIVER STM32F411xE)

# Remove wrong libob.a library dependency when using cpp files
list(REMOVE_ITEM CMAKE_C_IMPLICIT_LINK_LIBRARIES ob)

# Add linked libraries
target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
    F4_COMMON
    
    # Add user defined libraries
)

# Renommer l'exécutable en .elf
set_target_properties(Avionique PROPERTIES OUTPUT_NAME "${PROJECT_NAME}.elf")

# Générer les fichiers .hex et .bin après le build
add_custom_command(TARGET Avionique POST_BUILD
    COMMAND arm-none-eabi-objcopy -O ihex $<TARGET_FILE:Avionique> ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.hex
    COMMAND arm-none-eabi-objcopy -O binary $<TARGET_FILE:Avionique> ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.bin
    COMMENT "Generating .hex and .bin files"
)

# Afficher la taille du firmware
add_custom_command(TARGET Avionique POST_BUILD
    COMMAND arm-none-eabi-size $<TARGET_FILE:Avionique>
    COMMENT "Firmware size:"
)