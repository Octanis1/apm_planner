import QtQuick 2.0

Rectangle {
    id: root
    property alias label: text.text
    property bool active: false

    signal toggled
    height: 40
    width: height * 2.5
    radius: height * 0.25
    color: "lightgray"
    border.width: 1
    border.color: "#11000000"

    MouseArea {
        anchors.fill: parent
        onClicked: { active = !active; root.toggled() }
    }

    Item{
        width: parent.width * 0.75
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        //anchors.right: active ? undefined : parent.right
        //anchors.left: active ? parent.left : undefined
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: active ? 0 : (parent.width * 0.25)
        anchors.rightMargin: active ? (parent.width * 0.25) : 0
        Rectangle {
            anchors.fill: parent
            radius: root.height * 0.25
            color: active ? "green" : "red"
            Text { id: text; anchors.centerIn: parent; font.pixelSize: 14; }
        }
    }

}
