import Quickshell
import Quickshell.Services.UPower
import QtQuick

// folders
import "../../theme/"

Column {
  property var center: ""
  property int bat: UPower.displayDevice.percentage * 100
  property bool charging: UPower.displayDevice.state === UPowerDeviceState.Charging

  id: root
  spacing: 5

  Rectangle {
    id: battery
    width: 25
    height: 100
    radius: 5
    color: Theme.surface
    x: (parent,center.width - width) / 2
    border.color: Theme.outline_variant
    border.width: 2
    clip: true

    Text {
      text: root.charging ? "󰂄" : root.bat >= 30 ? "󰁹" : root.bat <= 5 ? "!\n󰂃" : "󰂃"
      font.family: "Figtree"
      font.variableAxes: { "wght": 500 }
      x: (parent.width - width) / 2
      y: (parent.height - height) / 2
      lineHeight: 0.85 
      color: Theme.outline
      font.pointSize: 13
      horizontalAlignment: Text.AlignHCenter
      visible: root.bat <= 29
    }

    Rectangle {
      id: batteryFill
      anchors.bottom: parent.bottom
      anchors.right: parent.right
      anchors.left: parent.left
      radius: 5
      width: 10
      color: root.charging ? Theme.success : root.bat >= 30 ? Theme.on_surface : Theme.error
      height: root.bat <= 5 ? 100 : root.bat
      border.color: Theme.outline_variant
      border.width: 2

      Behavior on height {
        NumberAnimation {
          duration: 500
          easing.type: Easing.OutExpo
        }
      }
      
      Column {
        id: batRow
        spacing: 0
        anchors.centerIn: parent

        Text {
          text: root.charging ? "󰂄" : root.bat >= 30 ? "󰁹" : root.bat <= 5 ? "!\n󰂃" : "󰂃"
          width: 10
          wrapMode: Text.Wrap
          font.family: "Figtree"
          font.variableAxes: { "wght": 500 }
          lineHeightMode: Text.ProportionalHeight
          lineHeight: 0.85 
          color: Theme.surface
          font.pointSize: 13
          horizontalAlignment: Text.AlignHCenter
          visible: root.bat <= 5 || root.bat >= 30
        }

        Text {
          text: root.bat
          width: 10
          font.family: "Figtree"
          font.variableAxes: { "wght": 500 }
          color: Theme.surface
          font.pointSize: 13
          horizontalAlignment: Text.AlignHCenter
          visible: root.bat >= 50 || root.bat <= 5
        }
      }
    }
  }
}
