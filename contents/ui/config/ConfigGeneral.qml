import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.0
import org.kde.plasma.core 2.0 as PlasmaCore

ColumnLayout {
    spacing: 20

    Item {
        id: root
        property string location: location
        function saveLocation(newLocation) {
            plasmoid.configuration.location = newLocation;
            console.log ("📍 New location saved:", plasmoid.configuration.location);
            location = plasmoid.configuration.location;
        }

        Label {
            text: i18n("Input Location Code:")
            wrapMode: Text.Wrap
        }

        TextField {
            id: locationInput
            x: 0
            y: 30
            text: plasmoid.configuration.location || ""
            placeholderText: i18n ("Input location; (See Meteoblue)")
            onEditingFinished: {
                    root.saveLocation(text);
            }
        }
    }


        // Note
        Label {
            text: i18n("Note: To obtain the code for the MeteoBlue website, search for the location, copy, and paste the last part of the web address, consisting of the city_country_code; e.g., paris_france_2988507")
            Layout.fillWidth: true
            wrapMode: Text.Wrap
        }

}



