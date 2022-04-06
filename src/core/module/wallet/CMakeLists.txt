file(GLOB_RECURSE WALLET_MODULE_SRC "*.cpp" "*.h")

qt_add_library(wallet_module STATIC)

qt6_add_qml_module(wallet_module
        URI "module.wallet"
        VERSION 1.0
        SOURCES
        ${WALLET_MODULE_SRC})

target_include_directories(wallet_module PRIVATE include)
target_link_libraries(wallet_module PRIVATE Qt6::Qml)

add_subdirectory(test)