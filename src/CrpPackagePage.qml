import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import org.deepin.dtk 1.0 as D
import Qt.labs.qmlmodels

Item {
    anchors.fill: parent
    anchors.rightMargin: 10
    ColumnLayout {
        anchors.fill: parent
        D.Label {
            text: "主题名"
        }
        RowLayout {
            D.LineEdit {
                Layout.fillWidth: true
            }
            D.Button {
                text: "补全"
            }
        }
        D.Label {
            text: "选择包名分支"
        }
        RowLayout {
            D.LineEdit {
                Layout.fillWidth: true
                placeholderText: "包名"
            }
            D.ComboBox {
                model: ["upstream/master"]
            }
            D.Button {
                text: "补全"
            }
        }
        D.Label {
            text: "选择架构"
        }
        RowLayout {
            D.CheckBox {
                text: "amd64"
            }
            D.CheckBox {
                text: "sw64"
            }
            D.CheckBox {
                text: "arm64"
            }
            D.CheckBox {
                text: "lonng64"
            }
            D.CheckBox {
                text: "mips64"
            }
        }
        D.Label {
            text: "检查提交信息"
        }

        RowLayout {
            D.LineEdit {
                text: "当前提交hash"
                Layout.fillWidth: true
            }
            D.LineEdit {
                text: "当前提交message"
                Layout.fillWidth: true
            }
        }
        D.Label {
            text: "检查版本"
        }

        RowLayout {
            D.LineEdit {
                text: "1.1.1"
                Layout.fillWidth: true
            }
            D.CheckBox {
                text: "自定义版本"
            }
            D.Button {
                text: "添加到任务列表"
            }
        }

        Rectangle {
            border.color: "gray"
            Layout.preferredHeight: 1
            Layout.fillWidth: true
            opacity: 0.3
        }

        D.Label {
            text: "选择组"
        }


        RowLayout {
            D.ComboBox {
                model: ["DTK5"]
                Layout.fillWidth: true
            }
            D.Button {
                text: "添加当前组到任务列表"
            }
            D.Button {
                text: "保存当前任务列表"
            }
        }

        Rectangle {
            border.color: "gray"
            Layout.preferredHeight: 1
            Layout.fillWidth: true
            opacity: 0.3
        }

        D.TextArea {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        D.ProgressBar {
            value: 0.5
            Layout.fillWidth: true
            formatText: "正在打包(50%)"
        }
    }

    // 包名， 分支， 版本， 架构， msg
}
