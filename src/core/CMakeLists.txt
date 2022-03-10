# add deps
find_package(Qt6 6.2 COMPONENTS Core Gui Quick Qml REQUIRED)

# Add the executable
qt_add_executable(solana_gui)

target_include_directories(solana_gui PRIVATE include)

#all .cpp
file(GLOB_RECURSE SOLANA_GUI_SRC "*.cpp")
message(STATUS ${SOLANA_GUI_SRC})

# feed .cpp in
target_sources(solana_gui PRIVATE ${SOLANA_GUI_SRC})

target_link_libraries(solana_gui PRIVATE Qt6::Core Qt6::Gui Qt6::Quick Qt6::Qml)

#[[file(GLOB_RECURSE SOLANA_GUI_RES_IMG "*.png" "*.svg")
set(SOLANA_GUI_RES "")
foreach(res ${SOLANA_GUI_RES_IMG})
    get_filename_component(extension ${res} EXT)
    string(REPLACE "." "" dirName ${extension})
    get_filename_component(fullName ${res} NAME)
    set(SOLANA_GUI_RES ${SOLANA_GUI_RES} " " res/img/${dirName}/${fullName})
endforeach()
message(STATUS ${SOLANA_GUI_RES})]]

qt_add_qml_module(solana_gui
        URI src.core
        VERSION 1.0
        QML_FILES
        res/ui/root.qml
        res/ui/splash.qml
        RESOURCES
        res/img/png/sg-splash.png
        res/img/svg/winclose.svg
        res/img/svg/winminimize.svg
        res/img/svg/winresize.svg
        )
