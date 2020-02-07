import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtCharts 2.3

Item {
    id: main_element
    width: 1280
    height: 600
    signal close_mainwindow()
    signal open()
    signal channel_selected(int chnum,bool status)
    signal minimize_mainwindow()
    signal viewMode(int tnum)

    property var timeX: readTimeList(timeList)
    //property var valueY: readValueList(chNumber,chStatus)
    property var ch_num: numberOfchannels()


    function readTimeList(timeList)
    {
        timeX = timeList
        console.log("timeX: ")
        console.log(timeX)
    }

    //    function readValueList(chNumber,chStatus)
    //    {
    //        if (chStatus===true)
    //            return valueY
    //        console.log("value: ")
    //        console.log(valueY)
    //    }

    function numberOfchannels()
    {
        ch_num=  numberOfchannels()
        console.log("number of channels: ")
        console.log(ch_num)
    }

    Image {
        id: main_image
        height: 36
        anchors.fill: parent
        sourceSize.height: 0
        sourceSize.width: 0
        source: "qrc:/Images/main_Image.gif"
        fillMode: Image.PreserveAspectCrop

        Text {
            id: text_Thermometer_Report_Monitor
            x: 447
            y: 0
            width: 359
            height: 58
            color: "#110bc1"
            text: qsTr("Thermometer Report Monitor")
            elide: Text.ElideNone
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            font.family: "Arial"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 27
            ShaderEffectSource {
                id: shaderEffectSource
                live: false
                sourceItem: shaderEffectSource
                recursive: true

                LinearGradient  {
                    anchors.fill: text_Thermometer_Report_Monitor
                    source: parent
                    gradient: Gradient {
                        GradientStop { position: 0; color: "dark blue" }
                        GradientStop { position: 1; color: "light blue" }

                    }
                }
            }

        }

        Rectangle {
            id: main_rectangle
            x: 8
            y: 46
            width: 1264
            height: 537
            color: "#ffffff"
            radius: 20
            border.width: 3
            opacity: 0.6
        }
    }

    Text {
        id: text_view_mode
        x: 1173
        y: 142
        width: 90
        height: 21
        text: qsTr("View Mode")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
        ShaderEffectSource {
            id: shaderEffectSource2
            live: true
            sourceItem: parent
            recursive: true

            LinearGradient  {
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: text_view_mode
                source: shaderEffectSource2

                gradient: Gradient {
                    GradientStop { position: 0; color: "dark blue" }
                    GradientStop { position: 1; color: "light blue" }

                }
            }
        }
    }

    Text {
        id: text_openFile
        x: 57
        y: 510
        width: 90
        height: 21
        text: qsTr("Open File")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
        ShaderEffectSource {
            id: shaderEffectSource3
            live: false
            sourceItem: shaderEffectSource3
            recursive: true
            LinearGradient  {
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: text_openFile
                source: text_openFile
                gradient: Gradient {
                    GradientStop { position: 0; color: "dark blue" }
                    GradientStop { position: 1; color: "light blue" }
                }
            }
        }
    }

    Text {
        id: text_channels
        x: 57
        y: 67
        width: 90
        height: 21
        text: qsTr("Channels")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
        ShaderEffectSource {
            id: shaderEffectSource4
            live: false
            sourceItem: shaderEffectSource4
            recursive: true
            LinearGradient  {
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.fill: parent
                source: text_channels
                gradient: Gradient {
                    GradientStop { position: 0; color: "dark blue" }
                    GradientStop { position: 1; color: "light blue" }
                }
            }
        }
    }

    Rectangle {
        id: radioButton_rectangle

        x: 1180
        y: 164
        width: 75
        height: 111
        color: "#00ffffff"
        opacity: 1
        border.color: "black"

        ColumnLayout {
            x: 14
            y: 5
            width: 53
            ExclusiveGroup { id: tabPositionGroup }

            RadioButton {
                id: radioButton1
                objectName: "RadioButton1"

                x: 19
                y: 8
                width: 90
                height: 23
                text: qsTr("minute")
                exclusiveGroup: tabPositionGroup
                //onClicked:axis_x.format="h:mm"
                //onClicked:viewMode(1)
                onClicked:viewMode(1)
                //onCheckedChanged: if(true){ axis_x.format="h:mm"}else{axis_x.format="h:mm" || axis_x.format = "" }
                style: RadioButtonStyle {
                    indicator: Rectangle {
                        implicitWidth: 16
                        implicitHeight: 16
                        radius: 9
                        border.color: "dark blue"
                        border.width: 1
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: 9
                            anchors.margins: 4
                        }
                    }
                }
            }

            RadioButton {
                id: radioButton2
                x: 19
                y: 38
                width: 90
                height: 23
                text: qsTr("hour")
                exclusiveGroup: tabPositionGroup
                onClicked:axis_x.format="h:mm"

                //onCheckedChanged: if(true){ axis_x.format="h:mm"}
                // checked:  axis_x.format="h:mm"

                style: RadioButtonStyle {
                    indicator: Rectangle {
                        radius: 9
                        border.width: 1
                        implicitHeight: 16
                        border.color: "dark blue"
                        implicitWidth: 16
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: 9
                            anchors.margins: 4
                        }
                    }
                }
            }

            RadioButton {
                id: radioButton3
                x: 19
                y: 68
                width: 90
                height: 23
                text: qsTr("day")
                exclusiveGroup: tabPositionGroup
                //onCheckedChanged: if(true){ axis_x.format="dd-MM"}
                //checked: axis_x.format="dd-MM"
                //onClicked:axis_x.format="dd-MM"
                onClicked:viewMode(2)

                style: RadioButtonStyle {
                    indicator: Rectangle {
                        radius: 9
                        border.width: 1
                        implicitHeight: 16
                        border.color: "dark blue"
                        implicitWidth: 16
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: 9
                            anchors.margins: 4
                        }
                    }
                }
            }

            RadioButton {
                id: radioButton4
                x: 19
                y: 98
                width: 90
                height: 23
                text: qsTr("month")
                //onCheckedChanged: (true)? axis_x.format="MM-yyyy" : axis_x.format=""
                //onCheckedChanged: if(true){ axis_x.format="MM-yyyy"}
                exclusiveGroup: tabPositionGroup
                //onClicked:axis_x.format="MM-yyyy"
                onClicked:viewMode(3)
                //onCheckedChanged: if(true){ axis_x.format="MM-yyyy"}
                //checked:  axis_x.format="MM-yyyy"

                style: RadioButtonStyle {
                    indicator: Rectangle {
                        radius: 9
                        border.width: 1
                        implicitHeight: 16
                        border.color: "dark blue"
                        implicitWidth: 16
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: 9
                            anchors.margins: 4
                        }
                    }
                }
            }

            RadioButton {
                id: radioButton5
                x: 19
                y: 128
                width: 90
                height: 23
                text: qsTr("Year")
                //onCheckedChanged: (true)? axis_x.format="MM-yyyy" : axis_x.format=""
                exclusiveGroup: tabPositionGroup
                //onCheckedChanged: if(true){ axis_x.format="MM-yyyy"}
                //checked:  axis_x.format="MM-yyyy"
                //onClicked:axis_x.format="MM-yyyy"
                onClicked:viewMode(3)


                style: RadioButtonStyle {
                    indicator: Rectangle {
                        radius: 9
                        border.width: 1
                        implicitHeight: 16
                        border.color: "dark blue"
                        implicitWidth: 16
                        Rectangle {
                            anchors.fill: parent
                            visible: control.checked
                            color: "#555"
                            radius: 9
                            anchors.margins: 4
                        }
                    }
                }
            }
        }

    }
    Rectangle {
        id: checkbox_rectangle
        //objectName: "checkBox_Rectangle1"
        x: 43
        y: 92
        width: 117
        height: 406
        color: "#00ffffff"
        opacity: 1
        border.color: "black"

        ScrollView{
            anchors.rightMargin: 0
            anchors.fill: parent

            Column {
                spacing: 20
                opacity: 1
                anchors.fill: checkbox_rectangle

                CheckBox {
                    id: checkBox1
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(1,checkBox1.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "dark blue"
                            text: "Channel 1"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "dark blue"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "dark blue"
                                border.color: "dark blue"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox2
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(2,checkBox2.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "dark red"
                            text: "Channel 2"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "dark red"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "dark red"
                                border.color: "dark red"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox3

                    x: 7
                    y: 70
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(3,checkBox3.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "dark green"
                            text: "Channel 3"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "dark green"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "dark green"
                                border.color: "dark green"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox4
                    x: 7
                    y: 100
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(4,checkBox4.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "deeppink"
                            text: "Channel 4"

                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "deeppink"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "deeppink"
                                border.color: "deeppink"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox5
                    x: 7
                    y: 170
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(5,checkBox5.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "olive"
                            text: "Channel 5"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "olive"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "olive"
                                border.color: "olive"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox6
                    x: 7
                    y: 210
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(6,checkBox6.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "dark orange"
                            text: "Channel 6"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "dark orange"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "dark orange"
                                border.color: "dark orange"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox7
                    x: 7
                    y: 250
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(7,checkBox7.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "dark violet"
                            text: "Channel 7"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "dark violet"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "dark violet"
                                border.color: "dark violet"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox8
                    x: 7
                    y: 291
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(8,checkBox8.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "darkcyan"
                            text: "Channel 8"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "darkcyan"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "darkcyan"
                                border.color: "darkcyan"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox9
                    x: 7
                    y: 333
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(9,checkBox9.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "saddlebrown"
                            text: "Channel 9"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "saddlebrown"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "saddlebrown"
                                border.color: "saddlebrown"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }

                CheckBox {
                    id: checkBox10
                    x: 7
                    y: 374
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(10,checkBox10.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "red"
                            text: "Channel 10"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "red"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "red"
                                border.color: "red"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox11
                    x: 7
                    y: 374
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(11,checkBox11.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "springgreen"
                            opacity: 4
                            text: "Channel 11"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "springgreen"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "springgreen"
                                border.color: "springgreen"
                                opacity: 4
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox12
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(12,checkBox12.checked)
                    style: CheckBoxStyle {
                        label: Text {
                            color: "slategray"
                            text: "Channel 12"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "slategray"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "slategray"
                                border.color: "slategray"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox13
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(13,checkBox13.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "palevioletred"
                            text: "Channel 13"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "palevioletred"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "palevioletred"
                                border.color: "palevioletred"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox14
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(14,checkBox14.checked)


                    style: CheckBoxStyle {
                        label: Text {
                            color: "cornflowerblue"
                            text: "Channel 14"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "cornflowerblue"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "cornflowerblue"
                                border.color: "cornflowerblue"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox15
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(15,checkBox15.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "chocolate"
                            text: "Channel 15"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "chocolate"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "chocolate"
                                border.color: "chocolate"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox16
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(16,checkBox16.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "forestgreen"
                            text: "Channel 16"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "forestgreen"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "forestgreen"
                                border.color: "forestgreen"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox17
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(17,checkBox17.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "royalblue"
                            text: "Channel 17"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "royalblue"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "royalblue"
                                border.color: "royalblue"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox18
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(18,checkBox18.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "mediumpurple"
                            text: "Channel 18"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "mediumpurple"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "mediumpurple"
                                border.color: "mediumpurple"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox19
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(19,checkBox19.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "orangered"
                            text: "Channel 19"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "orangered"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "orangered"
                                border.color: "orangered"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
                CheckBox {
                    id: checkBox20
                    x: 7
                    width: 95
                    height: 21
                    onCheckedChanged: channel_selected(20,checkBox20.checked)

                    style: CheckBoxStyle {
                        label: Text {
                            color: "yellowgreen"
                            opacity: 40

                            text: "Channel 20"
                        }
                        indicator: Rectangle {
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 3
                            border.color: "yellowgreen"
                            border.width: 1
                            Rectangle {
                                visible: control.checked
                                color: "yellowgreen"
                                opacity: 40

                                border.color: "yellowgreen"
                                radius: 1
                                anchors.margins: 4
                                anchors.fill: parent
                            }
                        }
                    }
                }
            }
        }
    }


    MouseArea {
        id: mouseArea1
        x: 1219
        y: 8
        width: 36
        height: 36
        onClicked: close_mainwindow()
        hoverEnabled: true
        onHoveredChanged:   close_animation.running = !close_animation.running

        Image {
            id: image_close
            height: 36
            anchors.fill: parent
            sourceSize.height: 0
            sourceSize.width: 0
            source: "qrc:/Images/Close_Icon.png"
            fillMode: Image.Stretch
            ScaleAnimator {
                id : close_animation
                target: image_close;
                from: 0.8;
                to: 1;
                loops: Animation.Infinite
                duration: 1000
                running: false
            }
        }
    }

    MouseArea {
        id: mouseArea2
        x: 76
        y: 520
        width: 52
        height: 54
        onClicked: open()
        hoverEnabled: true
        onHoveredChanged:   open_animation.running = !open_animation.running

        Image {
            id: image_open
            objectName: "image_open1"
            width: 100
            height: 100
            anchors.fill: parent
            sourceSize.height: 0
            sourceSize.width: 0
            source: "qrc:/Images/Browse_Image.png"
            fillMode: Image.Stretch
            ScaleAnimator {
                id : open_animation
                target: image_open;
                from: 0.8;
                to: 1;
                loops: Animation.Infinite
                duration: 1000
                running: false
            }
        }
    }


    Rectangle{
        id: chart_rectangle

        objectName: "chart_rectangle"
        x: 198
        y:97
        width: 955
        height: 434
        color: "#00ffffff"
        opacity: 1

        //     ScrollView{
        //          id: scrollview
        //           anchors.fill: parent


        ChartView {
            id: chartview
            objectName: "MainChart"
            anchors.fill: chart_rectangle
            legend.visible:  false

            //            ValueAxis {
            //                id: axisX
            //            }

            //            ValueAxis {
            //                id: axisY
            //            }

            LineSeries {
                name: "LineSeries"
                id: line_series

                axisX: {
                    id: axis_x
                    objectName:"axis_x"
                }

                axisY: ValueAxis {
                    id: axis_y

                }

                //            ScatterSeries {
                //                id: series2
                //                axisX: axisX
                //                axisY: axisY
                //            }
            }
        }
        //    MouseArea {
        //        id: mouseArea_chart
        //        anchors.fill: chartview


        //    }
    }

    MouseArea {
        id: mouseArea3
        x: 1180
        y: 8
        width: 36
        height: 36
        onClicked: minimize_mainwindow()
        hoverEnabled: true
        onHoveredChanged:   minimize_animation.running = !minimize_animation.running
        Image {
            id: image_minimize
            height: 36
            anchors.fill: parent
            sourceSize.width: 0
            sourceSize.height: 0
            source: "qrc:/Images/Minus_Image.png"
            fillMode: Image.Stretch
            ScaleAnimator {
                id: minimize_animation
                target: image_minimize
                loops: Animation.Infinite
                running: false
                from: 0.8
                to: 1
                duration: 1000
            }
        }
    }
}



