import QtQuick

Item {
    id: listItem
    property string iconSource: ""
    property string titleText: ""
    property bool isLast: false
    signal clicked()

    width: parent.width
    height: 54

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: linkMouseArea.containsMouse ? "#f7fafc" : "transparent"
        radius: 6

        Row {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 8
            spacing: 15

            Image {
                source: listItem.iconSource
                width: 22
                height: 22
                fillMode: Image.PreserveAspectFit
            }

            Text {
                text: listItem.titleText
                font.pixelSize: 16
                color: "#1a202c"
            }
        }

        // Bottom separation border
        Rectangle {
            width: parent.width
            height: 1
            color: "#edf2f7"
            anchors.bottom: parent.bottom
            visible: !listItem.isLast
        }

        MouseArea {
            id: linkMouseArea
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: listItem.clicked()
        }
    }
}
