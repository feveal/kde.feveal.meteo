// ToolTip.qml
import QtQuick 2.15
import QtQuick.Controls 2.15 as Controls
import QtQuick.Templates 2.15 as T
import org.kde.kirigami 2.15 as Kirigami

T.ToolTip {
    id: tooltip

    visible: parent && parent.hovered && text.length > 0
    delay: Kirigami.Units.toolTipDelay
    timeout: -1
    x: parent ? (parent.width - implicitWidth) / 2 : 0
    y: -implicitHeight - Kirigami.Units.smallSpacing

    background: Rectangle {
        x: -5
        y: -10
        color: "#705f9ea0"
        radius: 6
        width: 120
        height: 20
        border.color: "#adccd9"
        border.width: 1
        opacity: 0.95
    }

    contentItem: Controls.Label {
        text: tooltip.text
        wrapMode: Text.WordWrap
        color: "white" // Texto negro
        font: tooltip.font
        padding: Kirigami.Units.smallSpacing
        anchors.centerIn: parent // Asegurarse de que el texto se centra dentro del fondo

    }
}
