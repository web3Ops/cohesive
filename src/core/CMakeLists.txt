add_subdirectory(module)
add_subdirectory(test)

if (SG_BUILD_QML_PROJECT)
    add_subdirectory(res)
endif ()

# Add the executable
qt_add_executable(solana_gui)

target_include_directories(solana_gui PRIVATE include)

#all .cpp
file(GLOB SOLANA_GUI_SRC "*.cpp")

# feed .cpp in
target_sources(solana_gui PRIVATE ${SOLANA_GUI_SRC})

target_link_libraries(solana_gui PRIVATE Qt6::Core Qt6::Gui Qt6::Quick Qt6::Qml help_moduleplugin)

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
        res/ui/window/SGMain.qml
        res/ui/window/SGSplash.qml
        res/ui/component/SGMenuLabel.qml
        res/ui/component/SGMenuBG.qml
        res/ui/component/SGMenu.qml
        res/ui/component/SGMenuItem.qml
        res/ui/component/SGHr.qml
        res/ui/component/SGCard.qml
        res/ui/component/SGMenuBarItem.qml
        res/ui/component/SGCombo.qml
        res/ui/component/SGItemDelegate.qml
        res/ui/component/SGTool.qml
        res/ui/component/SGSideBar.qml
        res/ui/component/SGWinAction.qml
        res/ui/component/SGLabel.qml
        res/ui/section/SGExplorer.qml
        res/ui/section/SGWorkspace.qml
        res/ui/section/SGDocArea.qml
        res/ui/popup/SGClusterPopup.qml
        res/js/solx.js
        ${SG_SOLX_FILE}

        RESOURCES
        res/img/png/sg-splash.png
        res/img/svg/closeActive_dark.svg
        res/img/svg/minimize_dark.svg
        res/img/svg/maximize_dark.svg
        res/img/svg/switchView_dark.svg
        res/img/svg/toolWindowFind_dark.svg
        )
