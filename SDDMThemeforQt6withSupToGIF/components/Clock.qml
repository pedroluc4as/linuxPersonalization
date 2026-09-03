import QtQuick 2.8
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.5
import org.kde.plasma.plasma5support 2.0 as PlasmaCore

ColumnLayout {
    readonly property bool softwareRendering: GraphicsInfo.api === GraphicsInfo.Software

    Label {
        text:  Qt.formatTime(timeSource.data["Local"]["DateTime"], Qt.locale(), Locale.ShortFormat)
        color: root.clock_color
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? ColorScope.backgroundColor : "transparent" //no outline, doesn't matter
        font.pointSize: 34
        Layout.alignment: Qt.AlignHCenter
        font.family: config.font

    }
    Label {
        text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.locale(), Locale.LongFormat)
        color: root.clock_color
        style: softwareRendering ? Text.Outline : Text.Normal
        styleColor: softwareRendering ? ColorScope.backgroundColor : "transparent" //no outline, doesn't matter
        font.pointSize: 17
        Layout.alignment: Qt.AlignHCenter
        font.family: config.font

    }
    PlasmaCore.DataSource {
        id: timeSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 1000
    }
}
