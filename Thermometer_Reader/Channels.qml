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
    id: channels_element
    Connections {
        target: main_element

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
                        onCheckedChanged:  channel_selected(1)
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
    }
}
