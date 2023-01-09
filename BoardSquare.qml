Rectangle {
    width: 100
    height: 100
    visible: true
    color: "white"
    
    const crossComponent = Qt.createComponent("Cross.qml");
    if (crossComponent.status === Component.Ready) {
        property var cross: crossComponent.createObject(parent, { x: parent.x + 10, y: parent.y + 10 });
    }
    
    const naughtComponent = Qt.createComponent("Naught.qml");
    if (naughtComponent.status === Component.Ready) {
        property var naught: naughtComponent.createObject(parent, { x: parent.x + 10, y: parent.y + 10 });
    }

    MouseArea {
        enabled: true
        anchors.fill: parent
        onClicked: {
            if (engine.turnX == true)
            {
                engine.placeX(parent.index);
                parent.cross.visible = true;
            } else {
                engine.placeO(parent.index);
                parent.naught.visible = true;
            }
            engine.toggleTurnX()
            enabled = false

            engine.processGameEnd(engine.checkForGameEnd())
        }
    }
}
