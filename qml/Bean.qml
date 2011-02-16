import Qt 4.7

import "./system.js" as System

Image {
    width: 30
    height: 30
    property string name: '';
    source: './media/beans/bean_red.png'
    property int currentColor: 0
    property string to
    property int idNumber
    property int dx : 0
    property int dy : 0
    MouseArea {
        anchors.fill: parent
        drag.target: parent
        drag.axis: "XandYAxis"
        drag.minimumX: parent.dx
        drag.maximumX: parent.dx + System.width
        drag.minimumY: parent.dy
        drag.maximumY: parent.dy + System.height
        onReleased: {
            xmpp.sendMessage( to, 'move::' + parent.idNumber + '::' +  (parent.pos.x - parent.dx) + '::' +  (parent.pos.y - parent.dy) )
        }
        onClicked : {
            var colors = ['./media/beans/bean_red.png', './media/beans/bean_green.png', './media/beans/bean_yellow.png', './media/beans/bean_blue.png'];
            parent.currentColor++;
            parent.currentColor = parent.currentColor % colors.length;
            parent.source = colors[ parent.currentColor ];
            xmpp.sendMessage( to, 'color::' + parent.idNumber + '::'  + parent.currentColor );
        }
     }
}
