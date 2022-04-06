file(GLOB_RECURSE FILE_MODULE_SRC "*.cpp" "*.h")

qt_add_library(file_module STATIC)

qt6_add_qml_module(file_module
        URI "module.file"
        VERSION 1.0
        SOURCES
        ${FILE_MODULE_SRC})

target_include_directories(file_module PRIVATE include)
target_link_libraries(file_module PRIVATE Qt6::Qml)

add_subdirectory(test)