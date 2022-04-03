file(GLOB_RECURSE RUN_MODULE_SRC "*.cpp" "*.h")
qt_add_library(run_module STATIC)
qt6_add_qml_module(run_module
        URI "module.run"
        VERSION 1.0
        SOURCES
        ${RUN_MODULE_SRC})
set(CMAKE_AUTOMOC ON)
target_include_directories(run_module PRIVATE include)
target_link_libraries(run_module PRIVATE Qt6::Qml)
