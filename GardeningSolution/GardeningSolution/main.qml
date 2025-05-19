// Main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.settings 1.1

ApplicationWindow {
    visible: true
    width: 900
    height: 600
    title: qsTr("Multi-Screen Config App")

    // Persistent settings
    Settings {
        id: appSettings
        property bool hasSeenSetup: false
    }

    StackView {
        id: stackView
        anchors.fill: parent
        Component.onCompleted: {
            if (appSettings.hasSeenSetup) {
                stackView.push(configScreenComponent)
            } else {
                stackView.push(userInfoScreen)
            }
        }
    }

    // 1. First screen - setup wizard
    Component {
        id: userInfoScreen

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 10

            Label { text: "Welcome! Please enter your details." }

            TextField {
                id: emailField
                placeholderText: "Email address"
                Layout.fillWidth: true
            }

            TextField {
                id: locationField
                placeholderText: "Where do you live?"
                Layout.fillWidth: true
            }

            RowLayout {
                spacing: 10
                Layout.fillWidth: true

                TextField {
                    id: dateField
                    placeholderText: "Date (e.g. 2025-05-18)"
                    Layout.fillWidth: true
                }

                TextField {
                    id: timeField
                    placeholderText: "Time (e.g. 14:30)"
                    Layout.fillWidth: true
                }
            }

            Button {
                text: "Continue"
                Layout.alignment: Qt.AlignHCenter
                onClicked: {
                    console.log("Email:", emailField.text)
                    console.log("Location:", locationField.text)
                    console.log("Date:", dateField.text)
                    console.log("Time:", timeField.text)

                    appSettings.hasSeenSetup = true
                    stackView.replace(configScreenComponent)
                }
            }
        }
    }

    // 2. Main config screen - 3 panel layout
    Component {
        id: configScreenComponent

        RowLayout {
            anchors.fill: parent
            spacing: 10

            // LEFT
            ColumnLayout {
                Layout.fillWidth: true
                Layout.preferredWidth: 1
                spacing: 5
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 5
                    Label { text: "Left"; font.bold: true }

                    ComboBox {
                        Layout.fillWidth: true
                        model: ["Left Option 1", "Left Option 2"]
                        onCurrentTextChanged: textAreaLeft.text = "Left: " + currentText
                    }
                }
                TextArea {
                    id: textAreaLeft
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    placeholderText: "Left panel content"
                }
            }

            // CENTER
            ColumnLayout {
                Layout.fillWidth: true
                Layout.preferredWidth: 1
                spacing: 5
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 5
                    Label { text: "Center"; font.bold: true }

                    ComboBox {
                        Layout.fillWidth: true
                        model: ["Center Option 1", "Center Option 2"]
                        onCurrentTextChanged: textAreaCenter.text = "Center: " + currentText
                    }
                }
                TextArea {
                    id: textAreaCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    placeholderText: "Center panel content"
                }
            }

            // RIGHT
            ColumnLayout {
                Layout.fillWidth: true
                Layout.preferredWidth: 1
                spacing: 5
                RowLayout {
                    Layout.fillWidth: true
                    spacing: 5
                    Label { text: "Right"; font.bold: true }

                    ComboBox {
                        Layout.fillWidth: true
                        model: ["Right Option 1", "Right Option 2"]
                        onCurrentTextChanged: textAreaRight.text = "Right: " + currentText
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
}
