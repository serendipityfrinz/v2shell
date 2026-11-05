import Quickshell
import QtQuick

// folders
import "../../../theme/"

Column {
  id: root
  property alias hovered: powerIcon.hovered
  property alias center: powerIcon.center
  property QsWindow mama // route PowerPopup anchor yet again 😖
  anchors.horizontalCenter: center.horizontalCenter

  Text {
    id: powerIcon
    property var center: ""
    property bool hovered: false // ... yet.
    property var popup: "" // self-explanatory

    text: "⏻" 
    color: hovered ? Theme.secondary : Theme.error
    font.pointSize: hovered ? 16 : 13

    Behavior on color {
      ColorAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }

    Behavior on font.pointSize {
      NumberAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onEntered:  {
        parent.hovered = true
      }
      
      onExited: {
        parent.hovered = false
      }

      onClicked: powerPopup.clicked = !powerPopup.clicked
    }

    // ^ the first MouseArea ever created in v2Shell.
  }

  PowerPopup {
    id: powerPopup
    mama: root.mama
  }
}
