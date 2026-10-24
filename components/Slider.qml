import Quickshell // just in case
import QtQuick
import QtQuick.Templates as T

// folders
import "../theme/"

// AI generated to save time

T.Slider {
  id: control

  property color trackColor: "#3f3f4a"
  property color fillColor: "#bcc2ff"
  property color knobColor: "#bcc2ff"
  property var center: ""

  implicitWidth: control.vertical ? 18 : 160
  implicitHeight: control.vertical ? 160 : 18

  x: vertical ? (center.width - width) / 2 : 0
  y: vertical ? 0 : (center.width - width) / 2

  background: Rectangle {
    id: track
    width: control.vertical ? 6 : control.width
    height: control.vertical ? control.height : 6
    radius: 3
    anchors.centerIn: parent
    color: control.trackColor

    Rectangle {
      id: fill
      anchors.left: parent.left
      anchors.bottom: parent.bottom
      width: control.vertical ? track.width : control.visualPosition * track.width
      height: control.vertical ? control.position * track.height : track.height
      radius: track.radius
      color: control.fillColor
    }

    Rectangle {
      width: 20
      height: 20
      radius: 9
      border.color: Theme.surface
      border.width: 2
      color: control.knobColor
      anchors.horizontalCenter: control.vertical ? parent.horizontalCenter : fill.right
      anchors.verticalCenter: control.vertical ? fill.top : parent.verticalCenter
    }
  }

  handle: Item { }
}
