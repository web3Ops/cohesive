import QtQuick

Rectangle {
    id: root
    property int speed: 0
    anchors.fill: parent
    color: "#2B2B2B"

    Column {
        width: root.width
        height: root.height
        topPadding: 56
        leftPadding: 20
        rightPadding: 20
        bottomPadding: 41
        spacing: 10
        Rectangle {
            id: idStakingSec
            width: parent.width - 40
            height: parent.height / 4
            color: root.color
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 10
                Rectangle {
                    width: (idStakingSec.width / 3) - 10
                    height: idStakingSec.height - 5
                    radius: 8
                    color: "#313335"
                    border.color: Qt.lighter(color)
                }
                Rectangle {
                    width: (idStakingSec.width / 3) - 10
                    height: idStakingSec.height - 5
                    radius: 8
                    color: "#313335"
                    border.color: Qt.lighter(color)
                }
                Rectangle {
                    width: (idStakingSec.width / 3) - 10
                    height: idStakingSec.height - 5
                    radius: 8
                    color: "#313335"
                    border.color: Qt.lighter(color)
                }
            }
        }

        Rectangle {
            width: parent.width - 60
            height: parent.height / 4
            radius: 8
            color: "#313335"
            border.color: Qt.lighter(color)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            width: parent.width - 50
            height: (parent.height / 3) - 5
            radius: 8
            color: "#313335"
            border.color: Qt.lighter(color)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
