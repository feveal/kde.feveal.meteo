import QtQuick 2.7
import QtQuick.Layouts 1.1


    Item {
        id: webViews
        property int widthHeader: 360;
        property int heightHeader: 140;
        width: widthHeader // small 360, large 540
        height: heightHeader // small 140, large 600
            x: 0
            y: 0
            z: 1
        anchors.fill: parent

        Loader {
            id:webEngViewSmall
            property int widthHeader: 360;
            property int heightHeader: 140;
            x: 0
            y: 40
            z: 2
            source: "WebEngView.qml"
            visible: true
        }

        Loader {
            id: webEngViewLarge
            property int widthHeader: 540
            property int heightHeader: 600
            x: 0
            y: 40
            z: 3
            source: "WebEngView.qml"
            visible: false
        }

        // MouseArea switch views
        Rectangle {
            id: container
            width: 360
            height: 140
            y: 40
            z: 10
            color: "transparent"

        MouseArea {
            id: toggleArea

            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                // Switch between views
                webEngViewSmall.visible = !webEngViewSmall.visible;
                webEngViewLarge.visible = !webEngViewSmall.visible;
            }

        }
        }

    }
