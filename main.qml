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
    const squareComponent = Qt.createComponent("BoardSquare.qml");
    if (squareComponent.status === Component.Ready) {
        squareComponent.createObject(parent, { x: 40, y: 40, index: 0 });
        squareComponent.createObject(parent, { x: 40, y: 150, index: 1 });
        squareComponent.createObject(parent, { x: 40, y: 260, index: 2 });
        squareComponent.createObject(parent, { x: 150, y: 40, index: 3 });
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

