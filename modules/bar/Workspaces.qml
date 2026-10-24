import Quickshell
import Quickshell.I3
import QtQuick

// files
import "../../theme/"

Rectangle {
  id: wRect
  height: wCol.height + 25
  width: wCol.width + 15
  radius: 100
  color: Theme.surface
  border.color: Theme.outline_variant
  border.width: 2

  Column {
    id: wCol
    spacing: 10
    anchors.centerIn: parent

    Repeater {
      id: wRepeater
      model: 7

      delegate: Rectangle {
        required property var modelData
        required property var index
        property bool isActive: I3.focusedWorkspace? I3.focusedWorkspace.num === (index + 1) : false
        property var ws: I3.workspaces.values.find(w => w.number === index + 1)

        color: isActive ? Theme.primary : ws ? Theme.outline : Theme.outline_variant
        height: isActive ? 35 : ws ? 15 : 10
        width: isActive ? 15 : ws ? 10 : 10
        radius: 50
        anchors.horizontalCenter: parent.horizontalCenter

        Behavior on width {
          SpringAnimation {
            spring: 5
            damping: 0.3
          }
        }

        Behavior on height {
          NumberAnimation {
            duration: 500
            easing.type: Easing.OutExpo
          }
        }

        Behavior on color {
          ColorAnimation {
            duration: 500
            easing.type: Easing.OutExpo
          }
        }
      } 
    }
  }
}
