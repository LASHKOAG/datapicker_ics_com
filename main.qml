import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    DatePicker {
        id: datePicker

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        function orientationString() {
            if (screen.currentOrientation === Screen.Portrait || screen.currentOrientation === Screen.PortraitInverted )
                return "portrait"
            else
                return "landscape"
        }

        platformStyle: DatePickerStyle {
            orientationString: datePicker.orientationString()
        }
    }
}
