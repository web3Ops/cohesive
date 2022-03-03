# Add the executable
add_executable(solana_gui)

find_package(Qt6 6.2 COMPONENTS Core Gui Quick Qml REQUIRED)

target_include_directories(solana_gui PRIVATE include)

#all .cpp
file(GLOB SOLANA_GUI_SRC "*.cpp")
message(STATUS ${SOLANA_GUI_SRC})

target_link_libraries(solana_gui PRIVATE Qt6::Core Qt6::Gui Qt6::Quick Qt6::Qml)
# feed . cpp in
target_sources(solana_gui PRIVATE ${SOLANA_GUI_SRC})

qt_add_qml_module(solana_gui
        URI src.core
        VERSION 1.0
        QML_FILES
        res/ui/main.qml
        res/ui/splash.qml
        RESOURCES
        res/img/sg-splash.png
        )
