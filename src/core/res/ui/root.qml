import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "component"
import "window"
import "section"
import "popup"
import module.help

QtObject {
    id: root

    property var mainWindow: ApplicationWindow {
        flags: Qt.Window | Qt.FramelessWindowHint
        width: Screen.width
        height: Screen.height
        title: qsTr("Solana GUI")
        property int preX
        property int preY

        Rectangle {
            width: parent.width
            height: parent.height

            SGDocArea {
                anchors.fill: parent
            }

            Column {
                id: topBar
                width: parent.width
                height: 56
                anchors.top: parent.top

                Rectangle {
                    id: menuBar
                    width: parent.width
                    height: 27
                    color: "#3C3F41"
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            root.mainWindow.preX = mouseX;
                            root.mainWindow.preY = mouseY;
                        }
                        onMouseXChanged: {
                            var dx = mouseX - root.mainWindow.preX;
                            root.mainWindow.setX(root.mainWindow.x + dx);
                        }
                        onMouseYChanged: {
                            var dy = mouseY - root.mainWindow.preY;
                            root.mainWindow.setY(root.mainWindow.y + dy);
                        }
                    }
                    Rectangle {
                        id: appMenu
                        width: parent.width / 2
                        height: parent.height
                        anchors.left: parent.left
                        color: parent.color
                        Row {
                            anchors.fill: parent
                            SGMenuBarItem {
                                text: qsTr("File")
                            }
                            SGMenuBarItem {
                                text: qsTr("Edit")
                            }
                            SGMenuBarItem {
                                text: qsTr("View")
                            }
                            SGMenuBarItem {
                                text: qsTr("Navigate")
                            }
                            SGMenuBarItem {
                                text: qsTr("Build")
                            }
                            SGMenuBarItem {
                                text: qsTr("Run")
                            }
                            SGMenuBarItem {
                                text: qsTr("Tools")
                            }
                            SGMenuBarItem {
                                text: qsTr("Wallet")
                                SGMenuItem {
                                    id: idConfigWallet
                                    text: qsTr("Configure")
                                }
                                SGMenuItem {
                                    id: idCreateWallet
                                    text: qsTr("Create")
                                }
                                SGMenuItem {
                                    id: idViewWallet
                                    text: qsTr("View")
                                }
                                SGMenuItem {
                                    id: idRestoreWallet
                                    text: qsTr("Restore")
                                }
                                SGMenuItem {
                                    id: idVerifyWallet
                                    text: qsTr("Verify")
                                }
                            }
                            SGMenuBarItem {
                                text: qsTr("Window")
                            }
                            SGMenuBarItem {
                                text: qsTr("Help")
                                SGMenuItem {
                                    text: qsTr("Documentation")
                                }
                                SGMenuItem {
                                    id: idCFU
                                    text: qsTr("Check for Updates")
                                }
                                SGMenuItem {
                                    id: idAbout
                                    text: qsTr("About")
                                }
                            }
                        }
                    }

                    Text {
                        id: cluster
                        text: qsTr("Connected: localhost - Solana GUI")
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Rectangle {
                        id: windowMenu
                        width: 120
                        height: parent.height
                        anchors.right: parent.right
                        color: parent.color
                        Row {
                            anchors.fill: parent
                            Rectangle {
                                id: winminimize
                                width: 40
                                height: parent.height
                                color: !winminimizearea.hovered ? windowMenu.color : "#737373"
                                Image {
                                    source: "../img/svg/winminimize.svg"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                MouseArea {
                                    id: winminimizearea
                                    width: parent.width
                                    height: parent.height
                                    hoverEnabled: true
                                    property bool hovered: false
                                    onEntered: hovered = true
                                    onExited: hovered = false
                                    onClicked: root.mainWindow.visibility = Window.Minimized
                                }
                            }
                            Rectangle {
                                id: winresize
                                width: 40
                                height: parent.height
                                color: !winresizearea.hovered ? windowMenu.color : "#737373"
                                Image {
                                    source: "../img/svg/winresize.svg"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                MouseArea {
                                    id: winresizearea
                                    width: parent.width
                                    height: parent.height
                                    hoverEnabled: true
                                    property bool hovered: false
                                    onEntered: hovered = true
                                    onExited: hovered = false
                                }
                            }
                            Rectangle {
                                id: winclose
                                width: 40
                                height: parent.height
                                color: !winclosearea.hovered ? windowMenu.color : "red"
                                Image {
                                    source: "../img/svg/winclose.svg"
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                MouseArea {
                                    id: winclosearea
                                    width: parent.width
                                    height: parent.height
                                    hoverEnabled: true
                                    property bool hovered: false
                                    onEntered: hovered = true
                                    onExited: hovered = false
                                    onClicked: root.mainWindow.close()
                                }
                            }
                        }
                    }
                }
                SGHr {
                }
                Rectangle {
                    width: parent.width
                    height: 27
                    color: "#3C3F41"
                    Row {
                        anchors.fill: parent
                        SGCombo {
                            width: 120
                            height: parent.height - 4
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
                SGHr {
                    color: "black"
                }
            }

            Rectangle {
                width: 20
                height: parent.height - 56
                color: "#3C3F41"
                anchors.right: parent.right
                anchors.top: topBar.bottom
            }

            Rectangle {
                width: 20
                height: parent.height - 56
                color: "#3C3F41"
                anchors.left: parent.left
                anchors.top: topBar.bottom
            }

            Rectangle {
                width: parent.width
                height: 41
                color: "#3C3F41"
                anchors.bottom: parent.bottom
                Column {
                    width: parent.width
                    height: parent.height
                    Rectangle {
                        id: idBToolBar
                        width: parent.width
                        height: 20
                        color: "#3C3F41"
                        property variant bToolArray: ["TODO", "Debug", "Messages", "Terminal"]
                        Row {
                            width: parent.width
                            height: parent.height
                            spacing: 5
                            Repeater {
                                model: 5
                                delegate: Rectangle {
                                    width: idToolLabel.width
                                    height: parent.height
                                    required property int index
                                    color: "white"
                                    Row {
                                        Text {
                                            id: idToolLabel
                                            text: qsTr("xyz")
                                            color: "black"
                                            anchors.verticalCenter: parent.verticalCenter
                                        }
                                    }
                                }
                            }
                        }
                    }
                    SGHr {
                    }
                    Rectangle {
                        width: parent.width
                        height: 20
                        color: "#3C3F41"
                    }
                }
            }

            MouseArea {
                height: 5
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                cursorShape: Qt.SizeVerCursor
                onPressed: root.mainWindow.preY = mouseY
                onMouseYChanged: {
                    var dy = mouseY - root.mainWindow.preY;
                    var dNext = root.mainWindow.height - dy;
                    if (dNext >= 25) {
                        root.mainWindow.setY(root.mainWindow.y + dy);
                        root.mainWindow.setHeight(dNext);
                    }
                }
            }

            MouseArea {
                width: 5
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                cursorShape: Qt.SizeHorCursor
                onPressed: root.mainWindow.preX = mouseX
                onMouseXChanged: {
                    var dx = mouseX - root.mainWindow.preX;
                    var dNext = parent.width + dx;
                    if (dNext >= 160) {
                        root.mainWindow.setWidth(dNext);
                    }
                }
            }

            MouseArea {
                height: 5
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                cursorShape: Qt.SizeVerCursor
                onPressed: root.mainWindow.preY = mouseY
                onMouseYChanged: {
                    var dy = mouseY - root.mainWindow.preY;
                    var dNext = root.mainWindow.height + dy;
                    if (dNext >= 25) {
                        root.mainWindow.setHeight(dNext);
                    }
                }
            }

            MouseArea {
                width: 5
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                cursorShape: Qt.SizeHorCursor
                onPressed: root.mainWindow.preX = mouseX
                onMouseXChanged: {
                    var dx = mouseX - root.mainWindow.preX;
                    var dNext = parent.width - dx;
                    if (dNext >= 160) {
                        root.mainWindow.setX(root.mainWindow.x + dx);
                        root.mainWindow.setWidth(dNext);
                    }
                }
            }
        }
    }

    property var splashWindow: Splash {
        onTimeout: root.mainWindow.visible = true
    }
}
