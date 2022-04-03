file(GLOB_RECURSE BUILD_MODULE_SRC "*.cpp" "*.h")
qt_add_library(build_module STATIC)
qt6_add_qml_module(build_module
        URI "module.build"
        VERSION 1.0
        SOURCES
        ${BUILD_MODULE_SRC})
set(CMAKE_AUTOMOC ON)
target_include_directories(build_module PRIVATE include)
target_link_libraries(build_module PRIVATE Qt6::Qml)
