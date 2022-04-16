import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ComboBox {
    id: root
    model: ["Mainnet Beta", "Testnet", "Devnet", "Custom RPC URL"]

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        color: "#3C3F41"
        border.color: "#515151"
        border.width: root.visualFocus ? 2 : 1
        radius: 2
    }

    contentItem: Text {
        leftPadding: 0
        rightPadding: root.indicator.width + root.spacing
        text: root.displayText
        font: root.font
        color: "#BBB"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    // qmllint disable deferred-property-id
    indicator: Canvas {
        id: canvas
        x: root.width - width - root.rightPadding
        y: root.topPadding + (root.availableHeight - height) / 2
        width: 12
        height: 8
        contextType: "2d"

        Connections {

            target: root
            function onPressedChanged() {
                canvas.requestPaint(); // qmllint disable deferred-property-id
            }
        }

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = "#BBB";
            context.fill();
        }
    }

    delegate: SGItemDelegate {
        text: modelData
        width: parent.width
        required property int index
        required property string modelData
    }

    popup: Popup {
        y: root.height - 1
        width: root.width
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: root.popup.visible ? root.delegateModel : null
            currentIndex: root.highlightedIndex
            ScrollIndicator.vertical: ScrollIndicator {
            }
        }

        background: Rectangle {
            color: "#3C3F41"
            border.color: Qt.lighter(color)
            radius: 2
        }
    }
}
