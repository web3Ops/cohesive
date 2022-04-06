file(GLOB_RECURSE EDIT_MODULE_SRC "*.cpp" "*.h")

qt_add_library(edit_module STATIC)

qt6_add_qml_module(edit_module
        URI "module.edit"
        VERSION 1.0
        SOURCES
        ${EDIT_MODULE_SRC})

target_include_directories(edit_module PRIVATE include)
target_link_libraries(edit_module PRIVATE Qt6::Qml)

add_subdirectory(test)