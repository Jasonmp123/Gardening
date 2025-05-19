// Main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 900
    height: 600
    title: qsTr("Three Panels with Independent Dropdowns")

    RowLayout {
        anchors.fill: parent
        spacing: 10

        // Repeat for Left, Center, Right
        // Pane 1 - Left
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            spacing: 5

            RowLayout {
                Layout.fillWidth: true
                spacing: 5

                Label {
                    text: "Left"
                    font.bold: true
                }

                ComboBox {
                    id: dropdownLeft
                    Layout.fillWidth: true
                    model: ["Left Option 1", "Left Option 2", "Left Option 3"]
                    onCurrentTextChanged: {
                        textAreaLeft.text = "Left selected: " + currentText
                    }
                }
            }

            TextArea {
                id: textAreaLeft
                Layout.fillWidth: true
                Layout.fillHeight: true
                placeholderText: "Left panel content"
            }
        }

        // Pane 2 - Center
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            spacing: 5

            RowLayout {
                Layout.fillWidth: true
                spacing: 5

                Label {
                    text: "Center"
                    font.bold: true
                }

                ComboBox {
                    id: dropdownCenter
                    Layout.fillWidth: true
                    model: ["Center Option 1", "Center Option 2", "Center Option 3"]
                    onCurrentTextChanged: {
                        textAreaCenter.text = "Center selected: " + currentText
                    }
                }
            }

            TextArea {
                id: textAreaCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
                placeholderText: "Center panel content"
            }
        }

        // Pane 3 - Right
        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredWidth: 1
            spacing: 5

            RowLayout {
                Layout.fillWidth: true
                spacing: 5

                Label {
                    text: "Right"
                    font.bold: true
                }

                ComboBox {
                    id: dropdownRight
                    Layout.fillWidth: true
                    model: ["Right Option 1", "Right Option 2", "Right Option 3"]
                    onCurrentTextChanged: {
                        textAreaRight.text = "Right selected: " + currentText
                    }
                }
            }

            TextArea {
                id: textAreaRight
                Layout.fillWidth: true
                Layout.fillHeight: true
                placeholderText: "Right panel content"
            }
        }
    }
}
