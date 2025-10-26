# Embedded Avionics

> Implementation at the application layer for the avionics.

---

## Table of Contents
- [About](#about)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation / Build](#installation--build)
- [Usage](#usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)

---

## About

This repository contains all the code that is specific for both the STM32H747 and Raspberry Pi chip for the avionics at the application layer.  
The following README sections need to be updated when we will have the information to update them:
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation / Build](#installation--build)
- [Usage](#usage)
- [Configuration](#configuration)
- [Troubleshooting](#troubleshooting)

---
## Project Structure
project-root/  
│  
├── src/ # Source files  
├── include/ # Header files  
├── scripts/ # Utility scripts or build helpers  
├── config/ # Configuration or calibration files  
├── docs/ # Documentation and manuals  
├── tests/ # Unit or integration tests  
└── README.md  

---

## Requirements

List any hardware, software, or library dependencies needed to build or run the project.

Example:

- **Hardware:** STM32F4 Series, Raspberry Pi 4  
- **Compiler:** GCC 13+ or ARM-GCC toolchain  
- **Libraries:**  
  - HAL Drivers (for STM32)  
  - WiringPi (for Raspberry Pi)  
  - CMake ≥ 3.20  

---

## Installation / Build

List of steps required to install and build the project.

Example:

- Clone the project
- Download Visual Studio 2022 from this [Link](#www.duckduckgo.com)
- Open the sln file with Visual Studio
- Run the build

## Usage

List of steps required to run and/or debug the project.

Example:
- Open the project with Visual Studio 2022
- Press the `start` button

## Configuration

List of configuration files if any

Example:
- vcpkg.json
- .clang-tidy
- .clang-format

## Troubleshooting

QA kind of section with the most common problems and how to fix them

> The application build fails after the installation

Make sure that the vcpkg modules have been downloaded. Check the `use manifest` option in Visual Studio to see if the modules are downloaded automatically or not
