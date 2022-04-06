file(GLOB_RECURSE VIEW_MODULE_SRC "*.cpp" "*.h")

qt_add_library(view_module STATIC)

qt6_add_qml_module(view_module
        URI "module.view"
        VERSION 1.0
        SOURCES
        ${VIEW_MODULE_SRC})

target_include_directories(view_module PRIVATE include)
target_link_libraries(view_module PRIVATE Qt6::Qml)

add_subdirectory(test)