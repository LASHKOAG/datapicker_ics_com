import QtQuick 2.15
//import P358 1.0

Item {
    id: container
    property bool validDate: true
    property date dateValue
    width: 180; height: 28

    BorderImage {
        id: borderImage
        source: "pic/lineedit.sci"
        anchors.fill: parent
    }

    Text {
        id: lbl_dateInput
        color: enabled ? validDate ? "#151515" : "red" : "grey"
        //            selectionColor: "green"  ???
        font.pixelSize: 16
        font.bold: true
        width: parent.width-16
        anchors.centerIn: parent
        focus: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        //            style: Text.Raised; styleColor: "black"
        text: ""
//    <---validator: DateValidator {}
        //            inputMethodHints: Qt.ImhDigitsOnly ???
        wrapMode: Text.WordWrap
    }
    MouseArea {
        id: region
        anchors.fill: container
        onClicked: {
            setDateFromUser()
        }
    }
//    transitions: Transition {
//        ColorAnimation { target: lbl_dateInput; }
//    }

    DatePicker {
        id: datePicker
        visible: false
        anchors.top: borderImage.bottom
        Component.onCompleted: set(new Date()) // today
        onClicked:{
            lbl_dateInput.text = Qt.formatDate(date, 'dd.MM.yyyy')
            //print('onClicked', Qt.formatDate(date, 'M/d/yyyy'))
            datePicker.visible = false
            lbl_dateInput.visible = true
        }
    }

    function dateValid(ADateString, AFormat)
    {
        var res = true
        //var d = Date.parse(ADateString);
        //res = !isNaN(d);
        //console.log(ADateString + "; " +res + "; " + n)
        return res
    }

    function setDateFromUser(){
        lbl_dateInput.visible = !lbl_dateInput.visible
        datePicker.visible = !datePicker.visible
    }

}


