import Quickshell
import QtQuick

// folders
import "../../../theme/"
import "../../../components/"

PopupWindow {
  id: root
  property QsWindow mama
  property bool clicked

  anchor.window: mama
  anchor.rect.y: mama.height - height
  anchor.rect.x: -width 
  implicitHeight: 175
  implicitWidth: 500
  color: "transparent"
  visible: powerRect.opacity > 0.01

  Rectangle {
    id: powerRect
    width: parent.width
    height: parent.height
    color: Theme.surface_container
    topLeftRadius: 50
    x: root.clicked ? 0 : width * 2
    opacity: root.clicked ? 1 : 0

    Behavior on x {
      NumberAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }

    Behavior on opacity {
      NumberAnimation {
        duration: 500
        easing.type: Easing.OutExpo
      }
    }
    
    Row {
      id: powerRow
      spacing: 10
      anchors.centerIn: parent

      Button {
        height: 100
        width: 100
        radius: 20
        center: parent
        centerVertically: true
        label1: "\uf011"
        label2: "Power Off"

        onClicked: {
          Quickshell.execDetached(["sh", "-c", "systemctl poweroff"])
        }
      }

      Button {
        height: 100
        width: 100
        radius: 20
        center: parent
        centerVertically: true
        label1: "\uf021"
        label2: "Reboot"

        onClicked: {
          Quickshell.execDetached(["sh", "-c", "systemctl reboot"])
        }
      }

      Button {
        height: 100
        width: 100
        radius: 20
        center: parent
        centerVertically: true
        label1: "\uf08b"
        label2: "Log Out"

        onClicked: {
          // warning: very unclean code
          Quickshell.execDetached(["sh", "-c", "swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -B 'Yes, exit sway' 'swaymsg exit'"])
        }
      }

      Button {
        height: 100
        width: 100
        radius: 20
        center: parent
        centerVertically: true
        label1: "\uf023"
        label2: "Lock Screen"

        onClicked: {
          Quickshell.execDetached(["sh", "-c", "swaylock"])
        }
      }
    }
  }
}
