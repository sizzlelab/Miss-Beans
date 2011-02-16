import Qt 4.7

Image {
    id: photo
    source:  'media/user_icon.png'
    fillMode: Image.PreserveAspectFit
    width: 80
    height: 80
    property string name;

    anchors.bottom: parent.bottom;
    anchors.horizontalCenter: parent.horizontalCenter

    Text {
        text: parent.name
        font.pointSize: 4
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
