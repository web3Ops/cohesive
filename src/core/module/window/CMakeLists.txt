file(GLOB_RECURSE WINDOW_MODULE_SRC "*.cpp" "*.h")

qt_add_library(window_module STATIC)

qt6_add_qml_module(window_module
        URI "module.window"
        VERSION 1.0
        SOURCES
        ${WINDOW_MODULE_SRC})

target_include_directories(window_module PRIVATE include)
target_link_libraries(window_module PRIVATE Qt6::Qml)

add_subdirectory(test)