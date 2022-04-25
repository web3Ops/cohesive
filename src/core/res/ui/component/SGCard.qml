import QtQuick

Rectangle {
    width: 200
    height: 150
    color: "#313335"
    border.color: Qt.lighter(color)
    radius: 8
    property alias title: idTitle.text
    Column {
        anchors.fill: parent
        SGLabel {
                id: idTitle
                padding: 10
            }

    }


}
