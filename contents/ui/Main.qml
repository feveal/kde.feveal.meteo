import QtQuick 2.7
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.components 3.0 as PlasmaComponents

import "webViews"

Item {
    id: root
    width: 540 // small 360, large 540
    height: 600 // small 140, large 600

    Plasmoid.backgroundHints: "NoBackground"
    property bool needsConfiguring: plasmoid.configuration.location === ""
    property string location: plasmoid.configuration.location  || "" // reactivar
    property int widthHeader: 360;
    property string locationNil: plasmoid.configuration.location;

    Rectangle {
        id:rectHeader
        x: 0
        y: 15
        z: 0
        width: widthHeader
        height: 20
        color: "#705f9ea0"
    }

    PlasmaComponents.Button {
        id: configureButton
        implicitWidth: 20
        implicitHeight: 20
        x: 300
        y: 15
        icon.name: "favorite" // favorite, configure

        onClicked: plasmoid.action("configure").trigger()
        ToolTip {
            x: 30
            y: 40
            text: i18n("Define location");
        }

    }

    PlasmaComponents.Button {
        id: refreshButton
        implicitWidth: 20
        implicitHeight: 20
        x: 340
        y: 15
        z: 6
        text: "↻"
        onClicked: {
            reload();
        }

        ToolTip {
            x: 30
            y: 40
            text: i18n("Force refresh");
        }
    }

    PlasmaComponents.Button {
        id: windyButton
        implicitWidth: 20
        implicitHeight: 20
        x: 320
        y: 15
        contentItem:
            Image {
                source: Qt.resolvedUrl("icons/meteoblue.png")
                width: 20
                height: 20
                fillMode: Image.PreserveAspectFit
            }
        text: i18n("Wind map")
        z: 6

        onClicked: {
            Qt.openUrlExternally("https://www.meteoblue.com/es/tiempo/mapas/widget/" + location)
            }

        ToolTip {
            x: 30
            y: 40
            text: i18n("Wind map");
        }
    }


    // LLamada al Contenedor de las vistas del clima
    Loader {
        id: webViewsLoader
        source: location !== "" ? "webViews/WebViews.qml" : ""
        active: location !== ""
    }

    Text {
        id: meteoblueLink
        x: 0
        y: 15
        z: 3
        text: i18n("<a href='https://www.meteoblue.com/' style='text-decoration:none; color:#f0f8ff;'>Weather data provided by Meteoblue</a>")
        textFormat: Text.RichText
        onLinkActivated: Qt.openUrlExternally(link)
        font.pixelSize: 12
    }

    Timer {
        id: refreshTimer
        interval: 1800000 // // 5 minutos son 300000 // 3600000  // 1 hora en milisegundos
        running: !needsConfiguring
        repeat: true
        onTriggered: {
            console.log("🔄 Refreshing data ...");
            reload();
        }
    }

    function reload() {
        if (location === "") {
            console.log("Location Nill, select location.");
            return;
        }
        locationNil = location;
        location = "";
        // Reload loader
        webViewsLoader;
        location = locationNil;
        webViewsLoader;
        console.log("📌 Reload... " + location);
    }


    Component.onCompleted: {
        if (root.location === "Location not configured") {
            console.log("The location is not yet set.");
        } else {
            console.log("Location recovered:", location);
        }

    }

}
