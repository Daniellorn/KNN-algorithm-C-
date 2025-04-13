import QtQuick 2.15

import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: rightBar
    anchors {
        right: parent.right
        bottom: parent.bottom
        top: parent.top
    }

    color: "#333232"
    width: parent.width * 1/4

    ColumnLayout {

        anchors.fill: parent
        spacing: 5

        anchors.topMargin: 25
        anchors.bottomMargin: 25

        Text {
            text: "Algorytm KNN"
            font.pixelSize: 24
            color: "white"
            Layout.alignment: Qt.AlignHCenter
        }

        Column {

            Layout.fillWidth: true
            spacing: 5

            Text {
                text: "Nazwa pliku"
                font.pixelSize: 18
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            TextField {

                width: 200
                height: 25
                anchors.horizontalCenter: parent.horizontalCenter

                leftPadding: 5
                topPadding: 5
                bottomPadding: 5

                placeholderText: qsTr("Podaj nazwę pliku")
            }

        }

        Column {

            Layout.fillWidth: true
            spacing: 5


            Text {
                text: "Liczba sąsiadów"
                font.pixelSize: 18
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ComboBox {
                id: comboBox1
                width: 200
                height: 25
                anchors.horizontalCenter: parent.horizontalCenter

                model:  ListModel {
                    Component.onCompleted: {
                        for (var i = 1; i <= 20; i++)
                        {
                            append({value: i})
                        }

                        comboBox1.currentIndex = 0
                    }
                }

                textRole: "value"
            }

        }

        Column {

            Layout.fillWidth: true
            spacing: 5


            Text {
                text: "Metryka"
                font.pixelSize: 18
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ComboBox {
                id: comboBox2
                width: 200
                height: 25
                anchors.horizontalCenter: parent.horizontalCenter

                model:  ListModel {

                        ListElement { value: "Metryka euklidesowa" }
                        ListElement { value: "Metryka miejska" }
                    }

                    textRole: "value"

                    Component.onCompleted: {
                        comboBox2.currentIndex = 0
                    }
                }
            }


        Column {

            Layout.fillWidth: true
            spacing: 5


            Text {
                text: "Rodzaj głosowania"
                font.pixelSize: 18
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ComboBox {
                id: comboBox3
                width: 200
                height: 25
                anchors.horizontalCenter: parent.horizontalCenter

                model:  ListModel {

                        ListElement { value: "Proste" }
                        ListElement { value: "Ważone" }
                    }

                    textRole: "value"


                    Component.onCompleted: {
                        comboBox3.currentIndex = 0
                    }

                }
            }
    }
}
