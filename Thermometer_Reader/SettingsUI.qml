import QtQuick.Window 2.2
import QtQuick 2.5
import QtQuick.Controls 2.2

import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2

Item {
    id:mainContainer
    signal statusSignal(string msg)
    property string message: "none"
    property variant win;
    property alias weightReadValue: wread.text
    property alias heightReadValue: hread.text
    width: 1280
    height: 720  // you can hold this as a reference..
    SystemPalette { id: palette }
    clip: true
    function sendSignal(msg)
    {
        statusSignal(msg);
    }

    BorderImage {
        id: borderImage1
        anchors.fill: parent
        source: "qrc:/Images/impedance graphics/original.jpg"

        AnimatedImage{
            id:animationi
            x: -44
            y: -46
            width: 250
            height: 250
            source: "qrc:/Images/impedance graphics/settings1.gif"
            fillMode: Image.PreserveAspectCrop
            paused: false
        }
        Row {
            spacing: 10
            anchors.top: parent.top
            anchors.topMargin: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            opacity: 1
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.right: parent.right
            anchors.rightMargin: 9
            layoutDirection: Qt.RightToLeft

            Column {
                spacing: 5
                opacity: 1
                Repeater {
                    model: view.count
                    Rectangle {
                        width: 100
                        height: 60
                        radius: 10
                        id: tabItem
                        gradient: Gradient {
                            GradientStop {
                                position: 0.00;
                                color: "#ffffff"
                            }
                            GradientStop {
                                id: middle
                                position: 0.49;
                                color: "#3e5ecf";
                            }
                            GradientStop {
                                position: 1.00;
                                color: "#24a1e0";
                            }
                        }
                        Text {
                            anchors.centerIn: parent
                            text: view.getTab(index).title
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.bold: false
                            font.pointSize: 12
                        }
                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            hoverEnabled: true
                            onEntered:
                            {
                                animation.paused = false
                                mouseEnter.start()
                            }
                            onExited:{
                                mouseExit.start()
                                animation.paused = true
                            }
                            onClicked: view.currentIndex = index
                            onPressed: mouseDown.start()
                            onReleased: mouseUp.start()
                        }
                        NumberAnimation {
                            id: mouseEnter
                            target: middle
                            property: "position"
                            from: 0.49
                            to: 0.65
                            duration: 250
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            id: mouseExit
                            target: middle
                            property: "position"
                            from: 0.65
                            to: 0.49
                            duration: 250
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            id: mouseDown
                            target: middle
                            property: "position"
                            from: 0.65
                            to: 0.35
                            duration: 250
                            easing.type: Easing.InOutQuad
                        }
                        NumberAnimation {
                            id: mouseUp
                            target: middle
                            property: "position"
                            from: 0.35
                            to: 0.65
                            duration: 250
                            easing.type: Easing.InOutQuad
                        }

                        AnimatedImage{
                            id:animation

                            anchors.rightMargin: 30
                            anchors.leftMargin: 30
                            anchors.bottomMargin: 30
                            anchors.topMargin: 30
                            anchors.fill: parent
                            fillMode: Image.Stretch
                            paused: true;

                        }

                    }
                }
            }
            TabBar {
                id: view
                opacity: 0


                TabButton {
                    opacity: 0.5
                    text:  "کاربران"
                }
                TabButton {
                    text: "ارتباط"
                }
                TabButton {
                    text: "کالیبراسیون"
                }

            }
        }

        StackLayout {
            currentIndex: view.currentIndex
            anchors.bottomMargin: 50
            anchors.topMargin: 50
            anchors.leftMargin: 600
            anchors.rightMargin: 110
            anchors.fill: parent
            Item {
                id: item1

                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.fill: parent

                Rectangle {
                    id: rectangle
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#b3eff99c"
                        }

                        GradientStop {
                            position: 1
                            color: "#b359b9c5"
                        }
                    }
                    anchors.fill: parent
                }
                Item {
                    id: users
                    anchors.top: parent.top
                    anchors.topMargin: 15
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0;
                    anchors.right: parent.right
                    anchors.left: parent.left
                    Grid {
                        id: gridUsers
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        layoutDirection: Qt.RightToLeft
                        flow: Grid.TopToBottom
                        rows: 1
                        Item{
                            id: names
                            anchors.leftMargin: 0;
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridNames
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: namesLabel
                                    text: "نام کاربران:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10

                                }
                                ComboBox{
                                    id:nameBox
                                    model: usersNameModel
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-namesLabel.width-25
                                    onCurrentIndexChanged: {
                                        if(currentText!="0"){
                                        message="setting#currentUserSelected#%1".arg(currentIndex);
                                        statusSignal(message);}
                                    }
                                }
                            }
                        }
                        Item{
                            id: fNameContainer
                            anchors.topMargin: 30
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridFName
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: fnameLabel
                                    text: "نام:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }

                                TextField {
                                    id: fName
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-fnameLabel.width-25
                                    placeholderText: qsTr("نام کاربر")
                                    onTextChanged: {
                                        message="setting#currentUserFirstNameChange#%1".arg(text);
                                        statusSignal(message);
                                    }
                                }
                            }
                        }
                        Item{
                            id: lNameContainer
                            anchors.topMargin: 60
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridLName
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: lnameLabel
                                    text: "نام خانوادگی:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }

                                TextField {
                                    id: lName
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-lnameLabel.width-25
                                    placeholderText: qsTr("نام خانوادگی کاربر")
                                    onTextChanged: {
                                        message="setting#currentUserLastNameChange#%1".arg(text);
                                        statusSignal(message);
                                    }
                                }
                            }
                        }
                        Item{
                            id:iDContainer
                            anchors.topMargin: 90
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridID
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: iDLabel
                                    text: "کد شناسایی:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }

                                TextField {
                                    id: iD
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-iDLabel.width-25
                                    placeholderText: qsTr("کد شناسایی کاربر")
                                    onTextChanged: {
                                        message="setting#currentUserIDChange#%1".arg(text);
                                        statusSignal(message);
                                    }
                                }
                            }
                        }
                        Item{
                            id: hPhoneContainer
                            anchors.topMargin: 120
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridHPhone
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: hPhoneLabel
                                    text: "تلفن:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }

                                TextField {
                                    id: hPhoneName
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-hPhoneLabel.width-25
                                    placeholderText: qsTr("شماره تلفن")
                                    onTextChanged: {
                                        message="setting#currentUserHomePhoneChange#%1".arg(text);
                                        statusSignal(message);
                                    }
                                }
                            }
                        }
                        Item{
                            id: mPhoneContainer
                            anchors.topMargin: 150
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridMPhone
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: mPhoneLabel
                                    text: "تلفن همراه:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }

                                TextField {
                                    id: mPhoneName
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-mPhoneLabel.width-25
                                    placeholderText: qsTr("شماره تلفن همراه")
                                    onTextChanged: {
                                        message="setting#currentUserMobilePhoneChange#%1".arg(text);
                                        statusSignal(message);
                                    }
                                }
                            }
                        }
                        Item{
                            id: passContainer
                            anchors.topMargin: 180
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: passPhone
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                Label{
                                    id: passLabel
                                    text: "رمز عبور:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }

                                TextField {
                                    id: password
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width: parent.width-passLabel.width-25
                                    echoMode:TextInput.Password
                                    placeholderText: qsTr("رمز عبور")
                                    onTextChanged: {
                                        message="setting#currentUserPasswordChange#%1".arg(text);
                                        statusSignal(message);
                                    }
                                }
                            }
                        }
                        Item{
                            id: showNameContainer
                            anchors.topMargin: 210
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: sNameGrid
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                CheckBox{
                                    id: sName
                                    text: "درج نام کاربر در گزارش"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                    onCheckedChanged: {
                                        message="setting#currentUserNamePrintChange#%1".arg(checked);
                                        statusSignal(message);
                                    }
                                }


                            }
                        }
                        Item{
                            id: showPhoneContainer
                            anchors.topMargin: 240
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: sPhoneGrid
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 2;
                                CheckBox{
                                    id: sPhone
                                    text: "درج شماره تلفن کاربر در گزارش"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                    onCheckedChanged: {
                                        message="setting#currentUserPhonePrintChange#%1".arg(checked);
                                        statusSignal(message);
                                    }
                                }


                            }
                        }
                        Item{
                            id: reportFileContainer
                            anchors.topMargin: 270
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: reportGrid
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                columns: 3;
                                Label{
                                    id: reportLabel
                                    text: "فایل گزارش:"
                                    anchors.right: parent.right
                                    anchors.rightMargin: 10
                                }
                                TextField {
                                    id: reportFile
                                    anchors.left: parent.left
                                    anchors.leftMargin: 40
                                    width: parent.width-reportLabel.width-55
                                    placeholderText: qsTr("مسیر فایل گزارش")
                                }
                                Button{
                                    id:fileBrowse
                                    text:"..."
                                    anchors.left: parent.left
                                    anchors.leftMargin: 10
                                    width:30
                                    onClicked: {
                                        statusSignal("setting#openfile")
                                    }
                                }
                                //                                FileDialog{
                                //                                    id: fileDialogs
                                //                                    title: "Please choose a file"
                                //                                    modality: Qt.WindowModal

                                //                                    folder: shortcuts.home
                                //                                    nameFilters: ["Text files (*.txt)", "Report files (*.rep *.report)"]
                                //                                    onAccepted: {
                                //                                        message = "Settings#%1#%2".arg("ReportFilePath").arg(fileUrls);
                                //                                        statusSignal(message);
                                //                                        console.log(message)
                                //                                    }
                                //                                    onRejected: {
                                //                                        console.log("Canceled")
                                //                                    }

                                //                                }
                            }
                        }
                    }
                }
            }
            Item {
                id: item2
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.fill: parent
                Rectangle {
                    id: rectangle2
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#b3eff99c"
                        }

                        GradientStop {
                            position: 1
                            color: "#b359b9c5"
                        }
                    }
                    anchors.fill: parent
                }
                Item {
                    id: devices
                    anchors.top: parent.top
                    anchors.topMargin: 15

                    anchors.leftMargin: 0
                    anchors.rightMargin: 0;
                    anchors.right: parent.right
                    anchors.left: parent.left
                    Grid{
                        id:gridDEvices
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        layoutDirection: Qt.RightToLeft
                        flow: Grid.TopToBottom
                        rows: 1
                        Item{
                            id: serial

                            anchors.leftMargin: 0;
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Grid {
                                id: gridSerial
                                anchors.right: parent.right
                                anchors.rightMargin: 0
                                anchors.left: parent.left
                                anchors.leftMargin: 0
                                layoutDirection: Qt.RightToLeft
                                flow: Grid.TopToBottom
                                rows:1
                                Item{
                                    id: serialPoerts
                                    anchors.topMargin: 0
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid{
                                        id:gridSerials
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        Label{
                                            id: portsLabel
                                            text: "لیست پرتها:"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10

                                        }
                                        ComboBox{
                                            id:portsBox
                                            model:portsModel
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width-portsLabel.width-25
                                            onCurrentIndexChanged: {
                                                message="setting#SelectedPort#%1".arg(currentIndex);
                                                statusSignal(message);
                                            }
                                        }

                                    }
                                }
                                Item{
                                    id: baud
                                    anchors.topMargin: 30
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid{
                                        id:gridBauds
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        Label{
                                            id: baudsLabel
                                            text: "انتخاب سرعت انتقال داده های جانبی:"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10

                                        }
                                        ComboBox{
                                            id:baudBox
                                            model: ListModel {
                                                id: cbItems
                                                ListElement { text: "4800"; }
                                                ListElement { text: "9600";  }
                                                ListElement { text: "19200"; }
                                                ListElement { text: "38400"; }
                                                ListElement { text: "57600";  }
                                                ListElement { text: "115200"; }
                                                ListElement { text: "230400"; }
                                            }
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width-baudsLabel.width-25
                                            onCurrentIndexChanged: {
                                                message="setting#Baudrate#%1".arg(cbItems.get(currentIndex).text);
                                                statusSignal(message);
                                            }
                                        }

                                    }
                                }
                                Item{
                                    id: parity
                                    anchors.topMargin: 60
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid{
                                        id:gridParity
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        Label{
                                            id: parityLabel
                                            text: "تشخیص و تصحیح خطا:"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10

                                        }
                                        ComboBox{
                                            id:parityBox
                                            model: ListModel {
                                                id: cpItems
                                                ListElement { text: "Even"; }
                                                ListElement { text: "Mark";  }
                                                ListElement { text: "None"; }
                                                ListElement { text: "Odd"; }
                                                ListElement { text: "Space";  }
                                            }
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width-parityLabel.width-25
                                            onCurrentIndexChanged: {
                                                message="setting#Parity#%1".arg(cpItems.get(currentIndex).text);
                                                statusSignal(message);
                                            }
                                        }

                                    }
                                }
                                Item{
                                    id: databits
                                    anchors.topMargin: 90
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid{
                                        id:gridDataBits
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        Label{
                                            id: databitsLabel
                                            text: "تعداد بیتهای انتقالی در هر مرتبه:"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10

                                        }
                                        SpinBox{
                                            id:databitsBox
                                            value: 8
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width-databitsLabel.width-25
                                            onValueChanged: {
                                                message="setting#DataBits#%1".arg(value);
                                                statusSignal(message);
                                            }
                                        }

                                    }
                                }
                                Item{
                                    id: stopBit
                                    anchors.topMargin: 120
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid{
                                        id:gridStopBit
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        Label{
                                            id: stopBitLabel
                                            text: "بیت توقف انتقال داده:"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10

                                        }
                                        ComboBox{
                                            id:stopBitBox
                                            model: ListModel {
                                                id: csItems
                                                ListElement { text: "None"; }
                                                ListElement { text: "One";  }
                                                ListElement { text: "OnePointFive"; }
                                                ListElement { text: "Two"; }
                                            }
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width-stopBitLabel.width-25
                                            onCurrentIndexChanged: {
                                                message="setting#StopBit#%1".arg(csItems.get(currentIndex).text);
                                                statusSignal(message);
                                            }
                                        }

                                    }
                                }
                                Item{
                                    id: printers
                                    anchors.topMargin: 150
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid{
                                        id:gridPrinters
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        Label{
                                            id: printerLabel
                                            text: "لیست پرینترها:"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10

                                        }
                                        ComboBox{
                                            id:printerBox
                                            model:printersModel
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10
                                            width: parent.width-printerLabel.width-25
                                            onCurrentIndexChanged: {
                                                message="setting#SelectedPrinter#%1".arg(currentIndex);
                                                statusSignal(message);
                                            }
                                        }

                                    }
                                }
                                Item{
                                    id: showGraphContainer
                                    anchors.topMargin: 180
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid {
                                        id: sGraphGrid
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        CheckBox{
                                            id: sGraph
                                            text: "نمایش گرافهای به دست آمده در گزارش چاپی"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10
                                            onCheckedChanged: {
                                                message="setting#insertGraphinPrint#%1".arg(checked);
                                                statusSignal(message);
                                            }
                                        }
                                    }
                                }
                                Item{
                                    id: showHintContainer
                                    anchors.topMargin: 210
                                    anchors.top: parent.top
                                    anchors.leftMargin: 0
                                    anchors.rightMargin: 0;
                                    anchors.right: parent.right
                                    anchors.left: parent.left
                                    Grid {
                                        id: sHintGrid
                                        anchors.right: parent.right
                                        anchors.rightMargin: 0
                                        anchors.left: parent.left
                                        anchors.leftMargin: 0
                                        layoutDirection: Qt.RightToLeft
                                        columns: 2;
                                        CheckBox{
                                            id: sHint
                                            text: "درج راهنمای  پزشکی در گزارش"
                                            anchors.right: parent.right
                                            anchors.rightMargin: 10
                                            onCheckedChanged: {
                                                message="setting#insertMedicalHintinPrint#%1".arg(checked);
                                                statusSignal(message);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Item {
                id:calibrations
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                anchors.fill: parent
                Rectangle {
                    id: rectangle3
                    radius: 10
                    gradient: Gradient {
                        GradientStop {
                            position: 0
                            color: "#b3eff99c"
                        }

                        GradientStop {
                            position: 1
                            color: "#b359b9c5"
                        }
                    }
                    anchors.fill: parent


                }
                Item {
                    id: calibrators
                    anchors.top: parent.top
                    anchors.topMargin: 15

                    anchors.leftMargin: 0
                    anchors.rightMargin: 0;
                    anchors.right: parent.right
                    anchors.left: parent.left
                    Grid{
                        id:gridValibrators
                        anchors.right: parent.right
                        anchors.rightMargin: 0
                        anchors.left: parent.left
                        anchors.leftMargin: 0
                        layoutDirection: Qt.RightToLeft
                        flow: Grid.TopToBottom
                        rows: 1
                        Item{
                            id: weightCalibratorContainer
                            anchors.topMargin: 50
                            anchors.top: parent.top
                            anchors.leftMargin: 0
                            anchors.rightMargin: 0;
                            anchors.right: parent.right
                            anchors.left: parent.left
                            Tile {
                                id: tile
                                x: 75
                                y: 122
                                width: 110
                                height: 110
                                text: "کالیبراسیون \n قد"
                                onClicked: {
                                    weightCalibrator.visible=false;
                                    heightCalibrator.visible=true;
                                    tile1.visible=false;
                                    tile.visible=true;
                                }
                            }

                            Tile {
                                id: tile1
                                x: 384
                                y: 122
                                width: 110
                                height: 110
                                text: "کالیبراسیون \n وزن"
                                onClicked: {
                                    weightCalibrator.visible=true;
                                    heightCalibrator.visible=false;
                                    tile1.visible=true;
                                    tile.visible=false;
                                }
                            }

                        }
                    }
                }
            }
        }

        Item {
            id: weightCalibrator
            x: 104
            y: 160
            width: 400
            height: 400
            z: 1
            visible: false
            Rectangle {
                id: rectangle1
                radius: 10
                border.width: 5
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#cc49d5a7"
                    }

                    GradientStop {
                        position: 1
                        color: "#992c368a"
                    }
                }
                border.color: "#00000000"
                anchors.fill: parent
            }
            Tile {
                id: tile23
                x: 50
                y: 64
                width: 117
                height: 69
                text: "شروع \n کالیبراسیون"
                onClicked: {
                    container.visible=!container.visible
                }
            }

            Item {
                id: container
                visible: false
                Tile {
                    id: tile100
                    x: 233
                    y: 64
                    width: 117
                    height: 69
                    text: "ذخیره \n نتیجه"
                    onClicked:{
                        message="setting#weightResults#%1#%2#%3#%4#%5#%6".arg(spinBox.value).arg(spinBox1.value).arg(spinBox2.value).arg(spinBox3.value).arg(spinBox4.value).arg(spinBox5.value);
                        statusSignal(message);
                        close();
                    }
                }
                ProgressBar {
                    x: 50
                    y: 165
                    width: 300
                    height: 40
                    id: progress1

                    indeterminate: true
//                    style: ProgressBarStyle {
//                        background: Rectangle {
//                            radius: 10
//                            color: "lightgray"
//                            border.color: "gray"
//                            border.width: 1
//                            implicitWidth: 400
//                            implicitHeight: 50

//                        }
//                        progress: Rectangle {
//                            border.color: "steelblue"
//                            color: "lightsteelblue"
//                            radius: 10
//                            height: 50
//                            // Indeterminate animation by animating alternating stripes:
//                            Item {
//                                anchors.fill: parent
//                                anchors.margins: 1
//                                visible: control.indeterminate
//                                clip: true
//                                Row {
//                                    Repeater {
//                                        Rectangle {
//                                            color: index % 2 ? "steelblue" : "lightsteelblue"
//                                            width: 20 ; height: control.height
//                                            radius: 2
//                                        }
//                                        model: control.width / 10 + 2
//                                    }
//                                    XAnimator on x {
//                                        from: -40 ; to: 0
//                                        loops: Animation.Infinite
//                                        running: control.indeterminate
//                                    }
//                                }
//                            }
//                        }
//                    }
                }


                Label {
                    id: label
                    x: 39
                    y: 244
                    text: qsTr("مقادیر خوانده شده")
                    font.pointSize: 12
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: label1
                    x: 242
                    y: 244
                    text: qsTr("مقادیر واقعی")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    font.bold: true
                }

                SpinBox {
                    id: spinBox
                    x: 76
                    y: 277
                }

                SpinBox {
                    id: spinBox1
                    x: 259
                    y: 277
                }

                SpinBox {
                    id: spinBox2
                    x: 76
                    y: 320
                }

                SpinBox {
                    id: spinBox3
                    x: 259
                    y: 320
                }

                SpinBox {
                    id: spinBox4
                    x: 76
                    y: 363

                }

                SpinBox {
                    id: spinBox5
                    x: 259
                    y: 363
                }
                Rectangle {
                    id: rectangle100
                    x: 173
                    y: 301
                    width: 80
                    height: 63
                    color: "#000000"

                    Label {
                        id: wread
                        text: qsTr("0.0")
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                        anchors.fill: parent
                        style: Text.Raised
                        font.bold: true
                        font.pointSize: 14
                        styleColor: "#6424e0"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }


            Image {
                id: image1
                x: 5
                y: 5
                width: 58
                height: 58
                source: "qrc:/Images/impedance graphics/256.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        weightCalibrator.visible=false;
                        heightCalibrator.visible=false;
                        tile1.visible=true;
                        tile.visible=true;
                    }
                }
            }

        }

        Item {
            id: heightCalibrator
            x: 104
            y: 160
            width: 400
            height: 400
            z: 1
            visible: false
            Rectangle {
                id: rectangle200
                radius: 10
                border.width: 5
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#cc49d5a7"
                    }

                    GradientStop {
                        position: 1
                        color: "#992c368a"
                    }
                }
                border.color: "#00000000"
                anchors.fill: parent
            }
            Tile {
                id: tile2
                x: 50
                y: 64
                width: 117
                height: 69
                text: "شروع \n کالیبراسیون"
                onClicked: {
                    container2.visible=!container.visible
                }
            }

            Item {
                id: container2
                visible: false
                Tile {
                    id: tile12
                    x: 233
                    y: 64
                    width: 117
                    height: 69
                    text: "ذخیره \n نتیجه"
                    onClicked:{
                        message="setting#heightResults#%1#%2#%3#%4#%5#%6".arg(spinBoxh.value).arg(spinBoxh1.value).arg(spinBoxh2.value).arg(spinBoxh3.value).arg(spinBoxh4.value).arg(spinBoxh5.value);
                        statusSignal(message);
                        close();
                    }
                }
                ProgressBar {
                    x: 50
                    y: 165
                    width: 300
                    height: 40
                    id: progress

                    indeterminate: true
//                    style: ProgressBarStyle {
//                        background: Rectangle {
//                            radius: 10
//                            color: "lightgray"
//                            border.color: "gray"
//                            border.width: 1
//                            implicitWidth: 400
//                            implicitHeight: 50

//                        }
//                        progress: Rectangle {
//                            border.color: "steelblue"
//                            color: "lightsteelblue"
//                            radius: 10
//                            height: 50
//                            // Indeterminate animation by animating alternating stripes:
//                            Item {
//                                anchors.fill: parent
//                                anchors.margins: 1
//                                visible: control.indeterminate
//                                clip: true
//                                Row {
//                                    Repeater {
//                                        Rectangle {
//                                            color: index % 2 ? "steelblue" : "lightsteelblue"
//                                            width: 20 ; height: control.height
//                                            radius: 2
//                                        }
//                                        model: control.width / 10 + 2
//                                    }
//                                    XAnimator on x {
//                                        from: -40 ; to: 0
//                                        loops: Animation.Infinite
//                                        running: control.indeterminate
//                                    }
//                                }
//                            }
//                        }
//                    }
                }


                Label {
                    id: label2
                    x: 39
                    y: 244
                    text: qsTr("مقادیر خوانده شده")
                    font.pointSize: 12
                    font.bold: true
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                Label {
                    id: label12
                    x: 242
                    y: 244
                    text: qsTr("مقادیر واقعی")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    font.bold: true
                }

                SpinBox {
                    id: spinBoxh
                    x: 76
                    y: 277
                }

                SpinBox {
                    id: spinBoxh1
                    x: 259
                    y: 277
                }

                SpinBox {
                    id: spinBoxh2
                    x: 76
                    y: 320
                }

                SpinBox {
                    id: spinBoxh3
                    x: 259
                    y: 320
                }

                SpinBox {
                    id: spinBoxh4
                    x: 76
                    y: 363
                }

                SpinBox {
                    id: spinBoxh5
                    x: 259
                    y: 363
                }
                Rectangle {
                    id: rectangleh1
                    x: 166
                    y: 301
                    width: 80
                    height: 63
                    color: "#00000000"

                    Label {
                        id: hread
                        text: qsTr("0.0")
                        style: Text.Raised
                        font.bold: true
                        font.pointSize: 14
                        styleColor: "#6424e0"
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        anchors.fill: parent
                    }
                }

            }


            Image {
                id: image12
                x: 5
                y: 5
                width: 58
                height: 58
                source: "qrc:/Images/impedance graphics/256.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        weightCalibrator.visible=false;
                        heightCalibrator.visible=false;
                        tile1.visible=true;
                        tile.visible=true;
                    }
                }
            }
        }
    }
}
