import QtQuick 2.15

Rectangle {
    id: bottomPadding
    anchors {
        left: leftPadding.right
        bottom: parent.bottom
        right: rightBar.left
    }

    color: "#333232"
    height: parent.height * 1/75
}
