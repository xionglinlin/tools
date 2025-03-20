import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.deepin.dtk 1.0 as D

D.ApplicationWindow {
    id: root
    width: 1000
    height: 800
    visible: true
    title: "SSTools"
    D.DWindow.enabled: true
    flags: Qt.Window | Qt.WindowMinimizeButtonHint | Qt.WindowCloseButtonHint
    header: D.TitleBar {}

    RowLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        ListView {
            Layout.fillHeight: true
            Layout.preferredWidth: 150
            currentIndex: 0
            spacing: 3
            model: ["CRP打包", "CRP查询", "github提log"]
            delegate: D.ItemDelegate {
                text: modelData
                width: 150
                height: 50
            }
        }

        Rectangle {
            Layout.fillHeight: true
            implicitWidth: 1
            color: "gray"
        }

        StackLayout {
            id: mainStackLayout
            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.leftMargin: 15
            Layout.rightMargin: 5
            Layout.bottomMargin: 5

            CrpPackagePage {
                Layout.fillWidth: true
                Layout.fillHeight: true
                id: packagePage
            }
        }
    }
}
