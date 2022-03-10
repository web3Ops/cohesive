import QtQuick

//! [splash-properties]
Window {
        id: splash
        visible: true
        title: "Solana GUI"
        modality: Qt.ApplicationModal
        flags: Qt.SplashScreen
        //! not final bg
        color: Qt.rgba( Math.random(), Math.random(), Math.random(), 1 )
        property int timeoutInterval: 5000
        signal timeout
        //! [splash-properties]
        //! [screen-properties]
        x: (Screen.width - splashImage.width) / 2
        y: (Screen.height - splashImage.height) / 2
        //! [screen-properties]
        width: splashImage.width
        height: splashImage.height

        Image {
            id: splashImage
            source: "../img/png/sg-splash.png"
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }
        //! [timer]
        Timer {
            interval: splash.timeoutInterval; running: true; repeat: false
            onTriggered: {
                splash.visible = false
                splash.timeout()
            }
        }
        //! [timer]
        Component.onCompleted: visible = true
}
