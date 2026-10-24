import Quickshell
import QtQuick
import "../theme/"

// Nothing complex to see here.

Text {
  property var center: ""
  property int size: 20

  id: seperator
  text: "•"
  color: Theme.outline_variant
  font.pointSize: size
  x: (center.width - width) / 2
}
