// meow
import Quickshell
import QtQuick

// folders
import "../theme/"

Column {
  id: root
  spacing: 5
  signal clicked()
  property Item center
  property color color
  property int radius: 0
  property string label1: ""
  property string label2: ""
  property bool centerHorizontally: false
  property bool centerVertically: false

  Rectangle {
    id: button
    color: Theme.on_surface
    height: parent.height
    width: parent.width
    radius: parent.radius
    // the instantiator sets these three.
    x: parent.center && parent.centerHorizontally ? (parent.center.width - width) / 2 : 0
    y: parent.center && parent.centerVertically ? (parent.center.height - height) / 2 : 0

    Text {
      id: label1
      anchors.centerIn: parent
      color: Theme.surface
      text: root.label1 ? root.label1 : ":)"
      font.pointSize: 24
      font.family: "Figtree"
      font.variableAxes: { "wght": 500 }
    }

    Behavior on color {
      ColorAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }
    
    /* just in case the instantiator 
     * tries to put a ternary on width and height */

    Behavior on width {
      NumberAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }
    
    Behavior on height {
      NumberAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onClicked: {
        root.clicked()
        button.color = Theme.primary
        clickColor.running = true
      }
      onEntered: button.color = Theme.secondary
      onExited: button.color = Theme.on_surface
    }

    Timer {
      id: clickColor
      interval: 250
      onTriggered: button.color = Theme.on_surface
    }
  }

  Text {
    id: label2
    font.variableAxes: { "wght": 500 }
    font.family: "Figtree"
    text: parent.label2
    color: Theme.on_surface
    anchors.horizontalCenter: parent.horizontalCenter
  }
}
