file(GLOB_RECURSE HELP_MODULE_SRC "*.cpp" "*.h")
qt_add_library(help_module STATIC)
qt6_add_qml_module(help_module
        URI "module.help"
        VERSION 1.0
        SOURCES
        ${HELP_MODULE_SRC})
set(CMAKE_AUTOMOC ON)
target_include_directories(help_module PRIVATE include)
target_link_libraries(help_module PRIVATE Qt6::Qml)
