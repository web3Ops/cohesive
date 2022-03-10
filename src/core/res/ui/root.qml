import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    flags: Qt.Window | Qt.FramelessWindowHint
    width: Screen.width
    height: Screen.height
    visible: true
    title: qsTr("Solana GUI")
    property int preX
    property int preY
    Rectangle {
        width: parent.width
        height: parent.height
        Column {
            width: parent.width
            height: parent.height
            Rectangle {
                id: menuBar
                width: parent.width
                height: 25
                color: "#2d2d2d"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        root.preX = mouseX
                        root.preY = mouseY
                    }
                    onMouseXChanged: {
                        var dx = mouseX - root.preX
                        root.setX(root.x + dx)
                    }
                    onMouseYChanged: {
                        var dy = mouseY - root.preY
                        root.setY(root.y + dy)
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
                        Text {
                            text: qsTr("File")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                             text: qsTr("Edit")
                             color: "white"
                             anchors.verticalCenter: parent.verticalCenter

                        }
                        Text {
                            text: qsTr("View")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            text: qsTr("Navigate")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: qsTr("Build")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: qsTr("Run")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: qsTr("Tools")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: qsTr("Window")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            id: help
                            text: qsTr("Help")
                            color: "white"
                            anchors.verticalCenter: parent.verticalCenter
                            MouseArea {
                                anchors.fill: parent
                                acceptedButtons: Qt.LeftButton | Qt.RightButton
                                onClicked: {
                                    menuHelp.open()
                                }
                                Menu {
                                    id: menuHelp
                                    y: help.height
                                    background : Rectangle {
                                        implicitWidth : 200
                                        implicitHeight : 200
                                        color : menuBar.color
                                        border.color: "#353637"
                                     }
                                    MenuItem {
                                        id: cfu
                                        text: qsTr("Check for Updates")
                                        contentItem: Text {
                                            text: cfu.text
                                            font: cfu.font
                                            opacity: enabled ? 1.0 : 0.3
                                            color: cfu.down ? "#17a81a" : "white"
                                            elide: Text.ElideRight
                                            anchors.leftMargin: 10
                                        }
                                    }
                                    MenuItem {
                                        id: about
                                        text: qsTr("About")
                                        contentItem: Text {
                                            text: about.text
                                            font: about.font
                                            opacity: enabled ? 1.0 : 0.3
                                            color: about.down ? "#17a81a" : "white"
                                            elide: Text.ElideRight
                                        }
                                    }
                                }
                            }

                        }
                    }

                }
                Text {
                    id: cluster
                    text: qsTr("localhost - Solana GUI")
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
                                border.color: "#353637"
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
                                onClicked: root.close()
                             }
                        }

                    }

                }


            }

            Rectangle {
                width: parent.width
                height: 25
                color: "#2d2d2d"
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
            var dy = mouseY - root.preY
            var dNext = root.height - dy
            if(dNext >= 25) {
                root.setY(root.y + dy)
                root.setHeight(dNext)
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
            var dx = mouseX - root.preX
            var dNext = parent.width + dx
            if(dNext >= 160) {
                 root.setWidth(dNext)
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
            var dy = mouseY - root.preY
            var dNext = root.height + dy
            if(dNext >= 25) {
                root.setHeight(dNext)
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
                var dx = mouseX - root.preX
                var dNext = parent.width - dx
                if(dNext >= 160) {
                    root.setX(root.x + dx)
                    root.setWidth(dNext)
                }

           }
      }
   }

}