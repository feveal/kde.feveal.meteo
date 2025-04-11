import QtQuick 2.15
import QtWebEngine 1.9

Item {
    id: webEngine
    width: widthHeader
    height: heightHeader

    Rectangle {
        id:rectHeader
        x: 0
        y: -25
        z: 10
        width: widthHeader
        height: 20
        color: "#705f9ea0"
    }

    WebEngineView {
        id: webViews
        anchors.fill: parent
        url: "https://www.meteoblue.com/es/tiempo/widget/three/" + location + "?geoloc=fixed&nocurrent=0&noforecast=0&days=4&tempunit=CELSIUS&windunit=KILOMETER_PER_HOUR&layout=image"
        settings.javascriptEnabled: true
        settings.autoLoadImages: true
        settings.allowRunningInsecureContent: false

        Component.onCompleted: {
            console.log("View Loaded Engine - Width: " + width + " Height: " + height, "   Location: ", location) + " --- " + webViews;
        }

        onLoadingChanged: {
            if (loadRequest.status === WebEngineView.LoadSucceededStatus) {
                webViews.runJavaScript(`
                    document.body.style.overflow = 'hidden';
                    document.documentElement.style.overflow = 'hidden';
                `);
            }
        }
    }
}




