import Qt 4.7
import XMPP 1.0
import "./system.js" as System

Rectangle {
    id: main
    width: 360
    height: 640

    Flipable {

        id: flipable
        property int angle: 0
        property bool flipped: false
        height: parent.height
        width: parent.width

        transform: Rotation {
            id: rotation
            origin.x: flipable.width/2; origin.y: flipable.height/2
            axis.x: 0; axis.y: -1; axis.z: 0     // rotate around y-axis
            angle: flipable.angle
        }

        front: Rectangle {

            height: parent.height
            width: parent.width

            Image {
                anchors.centerIn: parent
                source: './media/bg_login.png'
            }

            Rectangle {
                id: username_frame

                anchors.left: parent.left
                anchors.leftMargin: 75
                anchors.top: parent.top
                anchors.topMargin: 150

                height: username.height + 5
                width: username.width + 10

                border.width: 1
                border.color: username.focus ? 'blue' : 'gray'

                TextInput {
                    id: username

                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    text: "hiit.tester2"
                }
            }

            Rectangle {

                id: password_frame

                anchors.left: username_frame.left
                anchors.top: username_frame.bottom
                anchors.topMargin: 10

                height: password.height + 5
                width: password.width + 10

                border.width: 1
                border.color: password.focus ? 'blue' : 'gray'

                TextInput {

                    id: password

                    anchors.left: parent.left
                    anchors.leftMargin: 5

                    text: "kissa123"
                    echoMode: "Password"
                }
            }
            Image {
                id: login
                anchors.left: password_frame.left
                anchors.top: password_frame.bottom
                anchors.topMargin: 10
                source: './media/button_go.png'
                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        var hasAtSing = username.text.indexOf('@') >= 0;

                        flipable.flipped = true;
                        interactionPane.opacity = 1;
                        xmpp.server = "talk.google.com";

                        // demo case
                        if( !hasAtSing ) {
                            xmpp.username = username.text + "@gmail.com";
                            xmpp.password = 'kissa123';
                            var target = username.text == 'hiit.tester1' ? 'hiit.tester2' : 'hiit.tester1';
                            target = target + "@gmail.com";
                            System.init( target, 'Demo' );
                            xmpp.login();
                        } else {
                            System.init('matti.nelimarkka@gmail.com');
                            xmpp.username = username.text
                            xmpp.password = password.text
                            xmpp.login();
                        }
                    }
                }
            }
        }

        back: Rectangle {

            id: beanCanvas

            height: parent.height
            width: parent.width

            Behavior on x {
                NumberAnimation {
                    duration: 1000
                }
            }

        }

        states: State {
            name: "back"
            PropertyChanges { target: flipable; angle: 180 }
            when: flipable.flipped
        }

        transitions: Transition {
            NumberAnimation { properties: "angle"; duration: 1000 }
        }

    }

    Item {

        id: interactionPane
        width: parent.width
        height: parent.height
        opacity: 0

        Behavior on opacity {
            NumberAnimation {
                duration: 1000
            }
        }

        Image {
            anchors.top: parent.top
            anchors.left: parent.left
            source: './media/button_new.png'
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    userSelection.opacity = 1;
                }
            }
        }

        Image {
            anchors.top: parent.top
            anchors.right: parent.right
            source: './media/button_close.png'
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    interactionPane.opacity = 0;
                    flipable.flipped = false;
                }
            }
        }

        Image {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            source: './media/button_prev.png'
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // bound detection
                    if( beanCanvas.x < System.width ) {
                        beanCanvas.x = System.width * ( System.canvasCount - 1);
                    } else {
                        beanCanvas.x -= System.width
                    }
                }
            }
        }

        Image {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            source: './media/button_next.png'
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // bound detection
                    if( beanCanvas.x > System.width * ( System.canvasCount - 2) ) {
                        beanCanvas.x = 0
                    } else {
                        beanCanvas.x += System.width
                    }
                }
            }
        }

        Rectangle {
            id: userSelection

            width: parent.width - 20
            height: parent.height - 20
            anchors.centerIn: parent
            color: "white"

            opacity: 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                }
            }

            Component {
                id: delegate
                Item {
                    id: wrapper
                    width: 80; height: 78
                    visible : jid != username.text + "@gmail.com";
                    Column {
                        Image {
                            width: 80
                            height: 80
                            source: './media/user_icon.png'
                            id: icon
                            fillMode: Image.PreserveAspectFit
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    userSelection.opacity = 0;
                                    System.init( jid, name )
                                }
                            }
                            Text {
                                text: name
                                font.pointSize: 6
                                anchors.top: parent.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                    }
                }
            }

            ListModel {
                id: testData
                ListElement {
                    jid: "hiit.tester2@gmail.com"
                    name: "Demo"
                    portrait: "http://profile.ak.fbcdn.net/hprofile-ak-snc4/41397_684442320_7114_n.jpg"
                }
                ListElement {
                    jid: "hiit.tester1@gmail.com"
                    name: "Demo"
                    portrait: "http://profile.ak.fbcdn.net/hprofile-ak-snc4/41397_684442320_7114_n.jpg"
                }
                ListElement {
                    jid: "matti.nelimarkka@gmail.com"
                    name: "Matti"
                    portrait: "http://profile.ak.fbcdn.net/profile-ak-snc1/profile5/1976/23/q744183082_7720.jpg"
                }
                ListElement {
                    jid: "hiit.tester1@humanisti.fixme.fi"
                    name: "Maija"
                    portrait: "http://profile.ak.fbcdn.net/hprofile-ak-snc4/41397_684442320_7114_n.jpg"
                }
                ListElement {
                    jid: "hiit.tester2@humanisti.fixme.fi"
                    name: "Minna"
                    portrait: "http://profile.ak.fbcdn.net/hprofile-ak-snc4/41397_684442320_7114_n.jpg"
                }
                ListElement {
                    jid: "hiit.tester3@humanisti.fixme.fi"
                    name: "Mikko"
                    portrait: "http://profile.ak.fbcdn.net/hprofile-ak-snc4/41397_684442320_7114_n.jpg"
                }
            }

            // The actual grid
            GridView {
                width: parent.width
                height: parent.height
                delegate: delegate
                model: testData
                cellWidth: 85
                cellHeight: 100
                focus: true
            }

        }

    }

    XMPP {
        id: xmpp
        onReciveMessage: {
            System.handleIncoming ( from, message );
        }
    }
}
