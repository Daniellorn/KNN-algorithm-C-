import QtQuick 2.15

Rectangle {
    id: topPadding
    anchors {
        left: leftPadding.right
        top: parent.top
        right: rightBar.left
    }

    color: "#333232"
    height: parent.height * 1/75
}
