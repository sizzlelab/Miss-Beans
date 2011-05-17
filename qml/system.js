var beanCount = 0;

var canvasCount = 0;
var canvas = {};

var height = 640;
var width = 360;

var initialPositions = [
// shape
[63, 79], [100, 70], [129, 95], [148, 124], [178, 145], [214, 155], [240, 186], [232, 222], [198, 245], [154, 253], [104, 244], [63, 222], [36, 183], [28, 144], [36, 105],
// bottom
[0, 493], [26, 493], [86, 493], [114, 493], [142, 493], [171, 493], [203, 493], [237, 493], [283, 493], [72, 468], [100, 468], [127, 468], [85, 441]
];

 function addBean(who, i){
     beanCount++;
     var bean = Qt.createComponent("Bean.qml");
     bean = bean.createObject(beanCanvas);
     bean.x = width * canvas[who].index + initialPositions[i][0];
     bean.dx = width * canvas[who].index;
     bean.y = initialPositions[i][1];
     bean.idNumber = i;
     bean.to = who;
     canvas[who][i] = bean;
     return bean;
 }

 function init(who, name1) {
     // check if canvas exists already
     if( canvas[who] ) {
         // move to first screen
         beanCanvas.x = canvas[who].index * width;
         return;
     }
     // add beans
     canvas[ who ] = new Array();
     canvas[ who ].index = canvasCount;
     for(var i = 0; i < 28; i++) {
        addBean(who, i);
     }
     // add icon
     var person = Qt.createComponent("Person.qml");
     person = person.createObject(beanCanvas);
     // nasty, but allows defining things in .qml
     person.parent = beanCanvas;
     person.anchors.horizontalCenterOffset = canvasCount * width;
     person.name = name1;
     // move canvas to correct position
     beanCanvas.x = canvasCount * width;
     canvasCount++;
     // for mockup use
     return person;
 }


 // ASI SPESIFIC CODE
 function getFriends(username, password) {

 }

 function handleIncoming (from, msg)  {
     from = from.split('/')[0];
     var msg = msg.split('::');
     // check canvas exists
     if( !canvas[from] ) {
        init(from, 'Unknown');
     }
     // move
     if( msg[0] == 'move' ) {
         var id = msg[1];
         canvas[from][id].x = width * canvas[from].index + msg[2];
         canvas[from][id].y = msg[3];
     }
     if( msg[0] == 'color' ) {
         var id = msg[1];
         canvas[from][id].currentColor = msg[2];
         // TODO: ugly ugly make me unsee this
         var colors = ['./media/beans/bean_red.png', './media/beans/bean_green.png', './media/beans/bean_yellow.png', './media/beans/bean_blue.png'];
         canvas[from][id].source = colors[ msg[2] ];
     }
 }
