cmake_minimum_required(VERSION 3.16)
project(solana_gui)

set(solana_gui_VERSION_MAJOR 0)
set(solana_gui_VERSION_MINOR 1)
set(solana_gui_VERSION_PATCH 0)
set(solana_gui_SOVERSION "0")
set(solana_gui_VERSION
        "${solana_gui_VERSION_MAJOR}.${solana_gui_VERSION_MINOR}.${solana_gui_VERSION_PATCH}")

set(CMAKE_CXX_STANDARD 17)

# include specific modules
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(CMAKE_PREFIX_PATH $ENV{QTDIR})
set(CMAKE_AUTOMOC  ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_subdirectory(src)

################################
# Notice
################################

message("\n\n  ** Build Summary **")
message("  Version:          ${solana_gui_VERSION}")
message("  Build Type:       ${CMAKE_BUILD_TYPE}")
message("  Prefix:           ${CMAKE_INSTALL_PREFIX}")
message("  Path BIN:         ${BIN_DESTINATION}")
message("  Path LIB:         ${LIB_DESTINATION}")
message("  Path INCLUDE:     ${INCLUDE_DESTINATION}")
message("  Build testing:    ${BUILD_TEST}")
message("  Build units:      ${BUILD_TESTING}")
message("  Architecture:     ${CMAKE_SYSTEM_PROCESSOR}")
message("  System:           ${CMAKE_SYSTEM_NAME}")
message("\n")
