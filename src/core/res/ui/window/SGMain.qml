import QtQuick
import QtQuick.Controls
import "../component"
import "../section"
import "../popup"

ApplicationWindow {
    id: root
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
            id: idDocArea
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
                        root.preX = mouseX;
                        root.preY = mouseY;
                    }
                    onMouseXChanged: {
                        var dx = mouseX - root.preX;
                        root.setX(root.x + dx);
                    }
                    onMouseYChanged: {
                        var dy = mouseY - root.preY;
                        root.setY(root.y + dy);
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
                    color: "#777777"
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
                        SGWinAction {
                            color: !hovered ? windowMenu.color : "#515151"
                            src: "../../img/svg/minimize_dark.svg"
                            onClicked: root.visibility = Window.Minimized
                        }
                        SGWinAction {
                            color: !hovered ? windowMenu.color : "#515151"
                            src: "../../img/svg/maximize_dark.svg"
                        }

                        SGWinAction {
                            id: winClose
                            color: !hovered ? windowMenu.color : "red"
                            src: "../../img/svg/closeActive_dark.svg"
                            onClicked: root.close()
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
                    width: (parent.width / 2) - 25
                    height: parent.height
                    anchors.right: parent.right
                    spacing: 5
                    SGTool {
                        onClicked: idDocArea.state === "explorer" ? idDocArea.state = "workspace" : idDocArea.state = "explorer"
                        source: "../../img/svg/switchView_dark.svg"
                    }
                    SGCombo {
                        width: 170
                        height: parent.height - 4
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    SGTool {
                        source: "../../img/svg/toolWindowFind_dark.svg"
                    }
                }
            }
            SGHr {
                color: "black"
            }
        }

        SGSideBar {
            anchors.right: parent.right
            anchors.top: topBar.bottom
        }

        SGSideBar {
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
            onPressed: root.preY = mouseY
            onMouseYChanged: {
                var dy = mouseY - root.preY;
                var dNext = root.height - dy;
                if (dNext >= 25) {
                    root.setY(root.y + dy);
                    root.setHeight(dNext);
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
            onPressed: root.preX = mouseX
            onMouseXChanged: {
                var dx = mouseX - root.preX;
                var dNext = parent.width + dx;
                if (dNext >= 160) {
                    root.setWidth(dNext);
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
            onPressed: root.preY = mouseY
            onMouseYChanged: {
                var dy = mouseY - root.preY;
                var dNext = root.height + dy;
                if (dNext >= 25) {
                    root.setHeight(dNext);
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
            onPressed: root.preX = mouseX
            onMouseXChanged: {
                var dx = mouseX - root.preX;
                var dNext = parent.width - dx;
                if (dNext >= 160) {
                    root.setX(root.x + dx);
                    root.setWidth(dNext);
                }
            }
        }
    }
}
