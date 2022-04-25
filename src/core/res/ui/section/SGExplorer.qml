import QtQuick
import QtQuick.Controls
import "../component"

Column {
    id: root
    property int speed: 0
    width: parent.width
    height: parent.height
    topPadding: 56
    rightPadding: 20
    leftPadding: 20
    bottomPadding: 41

    ScrollView {
        id: idScrollView
        width: root.width - 40
        height: root.height - 97
        topPadding: 5
        rightPadding: 27
        leftPadding: 5
        focus: true
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        background: Rectangle {
            color: "#2B2B2B"
        }
        Flickable {
            width: idScrollView.width
            height: idScrollView.height
            contentWidth: idContainer.width
            contentHeight: idContainer.height + 20
            Column {
                id: idContainer
                width: idScrollView.width - 27
                spacing: 10
                Item {
                    id: idStakingSec
                    width: parent.width
                    height: root.height / 4
                    Row {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 10
                        SGCard {
                            title: "Circulating Supply"
                            width: (idStakingSec.width / 3) - 10
                            height: idStakingSec.height - 5
                        }
                        SGCard {
                            title: "Active Stake"
                            width: (idStakingSec.width / 3) - 10
                            height: idStakingSec.height - 5
                        }
                        SGCard {
                            title: "Price "
                            width: (idStakingSec.width / 3) - 10
                            height: idStakingSec.height - 5
                        }
                    }
                }
                SGCard {
                    title: "Live Cluster Stats"
                    width: parent.width - 5
                    height: root.height / 4
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                SGCard {
                    title: "Live Transaction Stats"
                    width: parent.width - 3
                    height: (root.height / 3) + 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }
}
