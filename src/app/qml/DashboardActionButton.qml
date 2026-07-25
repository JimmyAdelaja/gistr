import QtQuick
import QtQuick.Effects

Item {
    id: actionBtn
    property string buttonText: ""
    signal clicked()

    width: parent.width
    height: 52

    MultiEffect {
        source: btnBg
        anchors.fill: btnBg
        shadowEnabled: true
        shadowColor: actionMouse.containsMouse ? "#2500cbd5" : "#1000cbd5"
        shadowBlur: 0.4
        shadowVerticalOffset: actionMouse.containsMouse ? 4 : 2
    }

    Rectangle {
        id: btnBg
        anchors.fill: parent
        radius: 8
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop { position: 0.0; color: actionMouse.containsMouse ? "#00ecf6" : "#00e1ec" }
            GradientStop { position: 1.0; color: actionMouse.containsMouse ? "#00beca" : "#00b2be" }
        }

        Text {
            text: actionBtn.buttonText
            font.pixelSize: 16
            font.bold: true
            color: "#ffffff"
            anchors.centerIn: parent
        }

        MouseArea {
            id: actionMouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: actionBtn.clicked()
        }
    }
}