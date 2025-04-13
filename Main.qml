import QtQuick
import QtGraphs

import "UI/RightBar"
import "UI/Paddings"

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("KNN")


    RightBar {
        id: rightBar
    }

    LeftPadding {
        id: leftPadding
    }

    TopPadding {
        id: topPadding
    }

    BottomPadding {
        id: bottomPadding
    }


    property real xMin: 0
    property real xMax: 3
    property real yMin: 0
    property real yMax: 3


    GraphsView {
        id: graphsView


        anchors {
            top: topPadding.bottom
            bottom: bottomPadding.top
            right: rightBar.left
            left: leftPadding.right
        }

        theme: GraphsTheme {
            colorScheme: GraphsTheme.ColorScheme.Dark
            //backgroundColor: "#333232"
            backgroundColor: "white"
        }

        panStyle: GraphsView.PanStyle.Drag
        zoomStyle: GraphsView.ZoomStyle.Center

        axisX: ValueAxis {
            min: xMin
            max: xMax
        }

        axisY: ValueAxis {
            max: yMax
            min: yMin
        }

        ScatterSeries {
            id: scatterSeries
            color: "#00ff00"
            XYPoint { x: 0.5; y: 0.5 }
            XYPoint { x: 1; y: 1 }
            XYPoint { x: 2; y: 2 }
            XYPoint { x: 2.5; y: 1.5 }
        }
    }



    MouseArea {
           id: overlayMouseArea
           anchors.fill: graphsView
           acceptedButtons: Qt.RightButton
           z: 999 // upewnij się, że jest na wierzchu

           onClicked: {
               var xRatio = mouseX / width
               var yRatio = 1.0 - (mouseY / height)

               var xValue = xMin + xRatio * (xMax - xMin)
               var yValue = yMin + yRatio * (yMax - yMin)

               console.log("Mouse clicked at:", mouseX, mouseY)
               console.log("Mapped to value:", xValue, yValue)


               scatterSeries.append(xValue, yValue)
           }
       }
}


