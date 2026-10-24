import Quickshell
import QtQuick

// folders
import "../../theme"
import "../../components/"

Scope {
  id: root

  PanelWindow {
    id: bar
    anchors { top: true; bottom: true; right: true; }
    implicitWidth: 50
    color: "transparent"

    Rectangle {
      id: barRect
      anchors.fill: parent
      color: Theme.surface_container
      border.color: Theme.outline_variant
      border.width: 2
      
      Column {
        id: firstWidgets
        spacing: 3
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10

        Workspaces {}
      }

      DateAndClock {
        center: parent
        anchors.centerIn: parent
      }

      Column {
        id: topWidgets
        spacing: 3
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10

        Battery {
          center: parent
        }
      }
    }
  }
}
