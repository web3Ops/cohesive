file(GLOB_RECURSE TOOLS_MODULE_SRC "*.cpp" "*.h")

qt_add_library(tools_module STATIC)

qt6_add_qml_module(tools_module
        URI "module.tools"
        VERSION 1.0
        SOURCES
        ${TOOLS_MODULE_SRC})

target_include_directories(tools_module PRIVATE include)
target_link_libraries(tools_module PRIVATE Qt6::Qml)

add_subdirectory(test)