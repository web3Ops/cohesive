import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "component"
import "window"

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

            Column {
                id: docArea
                width: parent.width
                height: parent.height

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "black"
                }
            }

            Column {
                id: topBar
                width: parent.width
                height: 52
                anchors.top: parent.top

                Rectangle {
                    id: menuBar
                    width: parent.width
                    height: 25
                    color: "#2d2d2d"
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            root.mainWindow.preX = mouseX
                            root.mainWindow.preY = mouseY
                        }
                        onMouseXChanged: {
                            var dx = mouseX - root.mainWindow.preX
                            root.mainWindow.setX(root.mainWindow.x + dx)
                        }
                        onMouseYChanged: {
                            var dy = mouseY - root.mainWindow.preY
                            root.mainWindow.setY(root.mainWindow.y + dy)
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
                            spacing: 13
                            SGMenuLabel {
                                id: idLabelFile
                                text: qsTr("File")
                                onClicked: {
                                    idMenuFile.open()
                                }
                                SGMenu {
                                    id: idMenuFile
                                }
                            }
                            SGMenuLabel {
                                id: idLabelEdit
                                text: qsTr("Edit")
                                onClicked: {
                                    idMenuEdit.open()
                                }
                                SGMenu {
                                    id: idMenuEdit
                                }
                            }
                            SGMenuLabel {
                                id: idLabelView
                                text: qsTr("View")
                                onClicked: {
                                    idMenuView.open()
                                }
                                SGMenu {
                                    id: idMenuView
                                }
                            }
                            SGMenuLabel {
                                id: idLabelNavigate
                                text: qsTr("Navigate")
                                onClicked: {
                                    idMenuNavigate.open()
                                }
                                SGMenu {
                                    id: idMenuNavigate
                                }
                            }
                            SGMenuLabel {
                                id: idLabelBuild
                                text: qsTr("Build")
                                onClicked: {
                                    idMenuBuild.open()
                                }
                                SGMenu {
                                    id: idMenuBuild
                                }
                            }
                            SGMenuLabel {
                                id: idLabelRun
                                text: qsTr("Run")
                                onClicked: {
                                    idMenuRun.open()
                                }
                                SGMenu {
                                    id: idMenuRun
                                }
                            }
                            SGMenuLabel {
                                id: idLabelTools
                                text: qsTr("Tools")
                                onClicked: {
                                    idMenuTools.open()
                                }
                                SGMenu {
                                    id: idMenuTools
                                }
                            }
                            SGMenuLabel {
                                id: idLabelWallet
                                text: qsTr("Wallet")
                                onClicked: {
                                    idMenuWallet.open()
                                }
                                SGMenu {
                                    id: idMenuWallet
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
                            }
                            SGMenuLabel {
                                id: idLabelWindow
                                text: qsTr("Window")
                                onClicked: {
                                    idMenuWindow.open()
                                }

                                SGMenu {
                                    id: idMenuWindow
                                }
                            }
                            SGMenuLabel {
                                id: idLabelHelp
                                text: qsTr("Help")
                                onClicked: {
                                    idMenuHelp.open()
                                }
                                SGMenu {
                                    id: idMenuHelp
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
                    }

                    Text {
                        id: cluster
                        text: qsTr("Cluster: localhost - Solana GUI")
                        color: "white"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            anchors.fill: parent
                            acceptedButtons: Qt.LeftButton | Qt.RightButton
                            onClicked: {
                                clusterPopup.open()
                            }
                            Popup {
                                id: clusterPopup
                                anchors.centerIn: Overlay.overlay
                                width: 500
                                height: 150
                                modal: true
                                focus: true
                                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                                background: Rectangle {
                                    implicitWidth: 200
                                    implicitHeight: 200
                                    color: menuBar.color
                                    border.width: 2
                                    border.color: Qt.lighter(color)
                                }
                                padding: 10
                                ColumnLayout {
                                    spacing: 2
                                    Text {
                                        text: qsTr("Choose network")
                                        color: "white"
                                    }
                                }
                            }
                        }
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
                SGHr {}
                Rectangle {
                    width: parent.width
                    height: 25
                    color: "#2d2d2d"
                }
                SGHr {
                    color: "black"
                }
            }

            Rectangle {
                width: 20
                height: parent.height - 52
                color: "#2d2d2d"
                anchors.right: parent.right
                anchors.top: topBar.bottom
            }

            Rectangle {
                width: 20
                height: parent.height - 52
                color: "#2d2d2d"
                anchors.left: parent.left
                anchors.top: topBar.bottom
            }

            Rectangle {
                width: parent.width
                height: 41
                color: "#2d2d2d"
                anchors.bottom: parent.bottom
                Column {
                    width: parent.width
                    height: parent.height
                    Rectangle {
                        width: parent.width
                        height: 20
                        color: "#2d2d2d"
                    }
                    SGHr {}
                    Rectangle {
                        width: parent.width
                        height: 20
                        color: "#2d2d2d"
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
                    var dy = mouseY - root.mainWindow.preY
                    var dNext = root.mainWindow.height - dy
                    if (dNext >= 25) {
                        root.mainWindow.setY(root.mainWindow.y + dy)
                        root.mainWindow.setHeight(dNext)
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
                    var dx = mouseX - root.mainWindow.preX
                    var dNext = parent.width + dx
                    if (dNext >= 160) {
                        root.mainWindow.setWidth(dNext)
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
                    var dy = mouseY - root.mainWindow.preY
                    var dNext = root.mainWindow.height + dy
                    if (dNext >= 25) {
                        root.mainWindow.setHeight(dNext)
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
                    var dx = mouseX - root.mainWindow.preX
                    var dNext = parent.width - dx
                    if (dNext >= 160) {
                        root.mainWindow.setX(root.mainWindow.x + dx)
                        root.mainWindow.setWidth(dNext)
                    }
                }
            }
        }
    }

    property var splashWindow: Splash {
        onTimeout: root.mainWindow.visible = true
    }
}
