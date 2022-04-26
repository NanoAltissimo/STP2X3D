cmake_minimum_required(VERSION 3.12.2)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake/Modules/")

project(STP2X3D)

find_package(OpenCascade REQUIRED)

add_subdirectory(STP2X3D)
