import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    DatePicker {
        Component.onCompleted: set(new Date()) // today
        onClicked:             print('onClicked', Qt.formatDate(date, 'M/d/yyyy'))
    }
}
