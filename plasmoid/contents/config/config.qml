import QtQuick 2.0
import org.kde.plasma.configuration 2.0

ConfigModel {
	ConfigCategory {
		name: i18n("Location")
		icon: Qt.resolvedUrl('../screenshot.png').replace('file://', '')
		source: "config/ConfigGeneral.qml"
	}

}
