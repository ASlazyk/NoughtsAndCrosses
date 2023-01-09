import QtQuick 2.15
import QtQuick.Window 2.15
import GameEngine 1.0



Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Naughts and Crosses")

    //object of GameEngine class
    GameEngine {
        id: engine
        turnX: true
        scoreX: 0
        scoreO: 0
    }

    //board background rectangle
    Rectangle {
        id: background
        x: 40
        y: 40
        width: 320
        height: 320
        visible: true
        color: "#0080FF"
    }

    Text {
        id: message
        text: (engine.turnX == true) ? "X's turn" : "O's turn"
        color: "#0000CC"
        leftPadding: 400
        topPadding: 100
        font.pixelSize: 18
        Component.onCompleted:
        {
        engine.setMessageLabel(message)
        }
    }

    Text {
        id: score
        property int scoreX: 0
        property int scoreO: 0
        text: scoreX + " for X's, " + scoreO + " for O's"
        color: "#0000CC"
        leftPadding: 400
        topPadding: 180
        font.pixelSize: 18
        Component.onCompleted:
        {
        engine.setScoreLabel(score)
        }
    }

    //board squares rectangles
    Rectangle {
        id: topleft
        x: 40
        y: 40
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: topleftMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(0);
                    topleftX.visible = true;
                } else {
                    engine.placeO(0);
                    topleftO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: topmid
        x: 150
        y: 40
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: topmidMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(1);
                    topmidX.visible = true;
                } else {
                    engine.placeO(1);
                    topmidO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: topright
        x: 260
        y: 40
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: toprightMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(2);
                    toprightX.visible = true;
                } else {
                    engine.placeO(2);
                    toprightO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: midleft
        x: 40
        y: 150
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: midleftMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(3);
                    midleftX.visible = true;
                } else {
                    engine.placeO(3);
                    midleftO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: midmid
        x: 150
        y: 150
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: midmidMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(4);
                    midmidX.visible = true;
                } else {
                    engine.placeO(4);
                    midmidO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: midright
        x: 260
        y: 150
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: midrightMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(5);
                    midrightX.visible = true;
                } else {
                    engine.placeO(5);
                    midrightO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: botleft
        x: 40
        y: 260
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: botleftMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(6);
                    botleftX.visible = true;
                } else {
                    engine.placeO(6);
                    botleftO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: botmid
        x: 150
        y: 260
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: botmidMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(7);
                    botmidX.visible = true;
                } else {
                    engine.placeO(7);
                    botmidO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }
    Rectangle {
        id: botright
        x: 260
        y: 260
        width: 100
        height: 100
        visible: true
        color: "white"

        MouseArea {
            id: botrightMA
            enabled: true
            anchors.fill: parent
            onClicked: {
                if (engine.turnX == true)
                {
                    engine.placeX(8);
                    botrightX.visible = true;
                } else {
                    engine.placeO(8);
                    botrightO.visible = true;
                }
                engine.toggleTurnX()
                enabled = false

                engine.processGameEnd(engine.checkForGameEnd())
            }
        }
    }

    //O's to be displayed
    Rectangle {
            id: topleftO
            x: 50
            y: 50
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: topmidO
            x: 160
            y: 50
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: toprightO
            x: 270
            y: 50
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: midleftO
            x: 50
            y: 160
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: midmidO
            x: 160
            y: 160
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: midrightO
            x: 270
            y: 160
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: botleftO
            x: 50
            y: 270
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: botmidO
            x: 160
            y: 270
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }
    Rectangle {
            id: botrightO
            x: 270
            y: 270
            width: 80
            height: 80
            radius: 80 * 0.5
            border.color: "#289EEE"
            border.width: 10
            visible: false
        }

    //X's to be displayed
    Rectangle {
        id:topleftX
        x: 50
        y: 85
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:topmidX
        x: 160
        y: 85
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:toprightX
        x: 270
        y: 85
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:midleftX
        x: 50
        y: 195
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:midmidX
        x: 160
        y: 195
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:midrightX
        x: 270
        y: 195
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:botleftX
        x: 50
        y: 305
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:botmidX
        x: 160
        y: 305
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }
    Rectangle {
        id:botrightX
        x: 270
        y: 305
        visible: false
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 45}
            }
            Rectangle {
                width: 80
                height: 10
                color: "#289EEE"
                transform: Rotation { origin.x: 40; origin.y: 5; angle: 135}
            }
    }

    Rectangle {
        id: crossing
        property int angle: 0
        property int offsetX: 0
        property int offsetY: 0
        height: 10
        width: (crossing.angle == 45 || crossing.angle == 135) ? 310 + 90 : 310
        x: (crossing.angle == 45 || crossing.angle == 135) ? 0 : (50 + 110 * crossing.offsetX)
        y: (195 + 110 * crossing.offsetY)
        color: "#096CAF"
        transform: Rotation { origin.x: crossing.width / 2; origin.y: 5; angle: crossing.angle}
        visible: false
        Component.onCompleted:
        {
        engine.setCrossingLine(crossing)
        }


    }
    MouseArea
    {
        id: generalMA
        enabled: false
        anchors.fill: parent
        Component.onCompleted:
        {
        engine.setGeneralMouseArea(generalMA)
        }
        onClicked: {
            topleftMA.enabled = true
            topmidMA.enabled = true
            toprightMA.enabled = true
            midleftMA.enabled = true
            midmidMA.enabled = true
            midrightMA.enabled = true
            botleftMA.enabled = true
            botmidMA.enabled = true
            botrightMA.enabled = true

            topleftO.visible = false
            topmidO.visible = false
            toprightO.visible = false
            midleftO.visible = false
            midmidO.visible = false
            midrightO.visible = false
            botleftO.visible = false
            botmidO.visible = false
            botrightO.visible = false

            topleftX.visible = false
            topmidX.visible = false
            toprightX.visible = false
            midleftX.visible = false
            midmidX.visible = false
            midrightX.visible = false
            botleftX.visible = false
            botmidX.visible = false
            botrightX.visible = false

            crossing.visible = false

            engine.prepareNextGame()

            enabled = false;
        }

    }
}

