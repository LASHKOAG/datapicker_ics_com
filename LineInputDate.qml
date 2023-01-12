import QtQuick 2.15
//import P358 1.0

Item {
	id: container
    property alias text: input.text
    property alias input: input
    property bool validDate: true
    property date dateValue
	width: 180; height: 28

    BorderImage {
        id: borderImage
        source: "pic/lineedit.sci"
        anchors.fill: parent
    }

	TextInput {
		id: input
        color: enabled ? validDate ? "#151515" : "red" : "grey"
		selectionColor: "green"
		font.pixelSize: 16; font.bold: true
		width: parent.width-16
		anchors.centerIn: parent
        focus: false
//        inputMask: "00.00.0000"
//    <---validator: DateValidator {}
//        placeholderText: "Digits only field"
        inputMethodHints: Qt.ImhDigitsOnly
//        enterKeyAction: EnterKeyAction.Next
//        onAccepted: textArea.focus = true
//        onAccepted: setDateFromUser()
//        onTextEdited: setDateFromUser()
//        onFocusChanged: setDateFromUser()
        MouseArea {
            id: mouseAreaRec
            anchors.fill: parent
            onClicked: {
                console.log("ma")
                setDateFromUser()
            }
        }
    }

    DatePicker {
        id: datePicker
        visible: false
        anchors.top: borderImage.bottom
        Component.onCompleted: set(new Date()) // today
        onClicked:{
            input.text = Qt.formatDate(date, 'dd.MM.yyyy')
            //print('onClicked', Qt.formatDate(date, 'M/d/yyyy'))
            datePicker.visible = false
            input.visible = true
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
        input.visible = !input.visible
        datePicker.visible = !datePicker.visible
    }

}


