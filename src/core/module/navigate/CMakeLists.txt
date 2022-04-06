file(GLOB_RECURSE NAVIGATE_MODULE_SRC "*.cpp" "*.h")

qt_add_library(navigate_module STATIC)

qt6_add_qml_module(navigate_module
        URI "module.navigate"
        VERSION 1.0
        SOURCES
        ${NAVIGATE_MODULE_SRC})

target_include_directories(navigate_module PRIVATE include)
target_link_libraries(navigate_module PRIVATE Qt6::Qml)

add_subdirectory(test)