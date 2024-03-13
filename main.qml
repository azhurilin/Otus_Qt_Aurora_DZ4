import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

//import QtQuick 2.15
//import QtQuick.Window 2.15



Window {
    id: root

    width: 1024
    height: width/2

    function  updateICD()
    {

     digitstring = isdText();
     icdText.text = digitstring

    }

    function  setDigitImg(Digit, i)
    {
      Digit.imgsrc = "";
      if (root.digitstring[i] == "1")  Digit.imgsrc = "qrc:/icons/1_button.png"
      if (root.digitstring[i] == "2")  Digit.imgsrc = "qrc:/icons/2_button.png"
      if (root.digitstring[i] == "3")  Digit.imgsrc = "qrc:/icons/3_button.png"
      if (root.digitstring[i] == "4")  Digit.imgsrc = "qrc:/icons/4_button.png"
      if (root.digitstring[i] == "5")  Digit.imgsrc = "qrc:/icons/5_button.png"
      if (root.digitstring[i] == "6")  Digit.imgsrc = "qrc:/icons/6_button.png"
      if (root.digitstring[i] == "7")  Digit.imgsrc = "qrc:/icons/7_button.png"
      if (root.digitstring[i] == "8")  Digit.imgsrc = "qrc:/icons/8_button.png"
      if (root.digitstring[i] == "9")  Digit.imgsrc = "qrc:/icons/9_button.png"
      if (root.digitstring[i] == "0")  Digit.imgsrc = "qrc:/icons/0_button.png"
      if (root.digitstring[i] == ".")  Digit.imgsrc = "qrc:/icons/point_button.png"
      if (root.digitstring[i] == "-")  Digit.imgsrc = "qrc:/icons/sub_button.png"


    }





    minimumWidth: 640
    minimumHeight: minimumWidth/2

   // flags: Qt.Window | Qt.FramelessWindowHint //5.15
    visible: true

    title: qsTr("QML MK52")

    property var resizeRectangleSize: 5
    property var moveRectangleSize: 5
    property string digitstring: ""

    Shortcut {
        sequence: "Ctrl+Q"
        onActivated: Qt.quit()
    }


//=====================*******==========================================*******=====================
    Rectangle {
        anchors.fill: parent
        color: "#035570"
    }

//=====================*******=====================
    Rectangle {
        id: moveRectangle
        color: "transparent" //"orange"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: moveRectangleSize
        MouseArea {
            anchors.fill: parent
            onPressed: {
             //   window.startSystemMove(); //QtQuick.Window 2.15
            }
        }
    }
//=====================*******=====================
    Rectangle {
        id: resizeRectangleRight
        color: "transparent" //"red"
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: resizeRectangleSize
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.SizeHorCursor : Qt.ArrowCursor
            onPressed: {
             //   window.startSystemResize(Qt.RightEdge); //QtQuick.Window 2.15
            }
        }
    }
//=====================*******=====================
    Rectangle {
        id: resizeRectangleLeft
        color: "transparent" //"green"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: resizeRectangleSize
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.SizeHorCursor : Qt.ArrowCursor
            onPressed: {
              //  window.startSystemResize(Qt.LeftEdge); //QtQuick.Window 2.15
            }
        }
    }
//=====================*******=====================
    Rectangle {
        id: resizeRectangleBottom
        color: "transparent" //"yellow"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: resizeRectangleSize
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.SizeVerCursor : Qt.ArrowCursor
            onPressed: {
              //  window.startSystemResize(Qt.BottomEdge); //QtQuick.Window 2.15
            }
        }
    }
//=====================*******==========================================*******=====================
//=====================*******==========================================*******=====================
   Rectangle {
        id: topFrame
        color: "#707070"
        height: parent.height*0.23

        anchors.left: resizeRectangleLeft.right
        anchors.right: resizeRectangleRight.left
        anchors.top: moveRectangle.bottom

        Text {
          id: topText
          x: 24
          y: 16

          height: parent.height*0.3
          color: "white"

          text: "ЭЛЕКТРОНИКА МК52"

          font.family: "Ubuntu"
          font.pixelSize: 28

    }


        Text {
          id: icdText
          anchors.left: parent.left
          anchors.bottom: parent.bottom



          height: parent.height*0.3
          color: "white"

          text: ""

          font.family: "Ubuntu"
          font.pixelSize: 24
          visible: false

        }



    }


//=====================*******==========================================*******=====================
   Rectangle {
        id: buttonFrame
        color: "#3070A0"
        width : parent.width*0.55

        anchors.top: topFrame.bottom
        anchors.bottom: resizeRectangleBottom.top
        anchors.right: resizeRectangleRight.left

        Grid {
          id: buttonGrid

          anchors.fill: parent
          rows: 4; columns: 8;


         CalcButton  {
           id: btn_A_1
           buttonname:  "btn_A_1"
           cellColor:   topFrame.color
           buttonColor: "yellow"
        //   imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/f_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_A_2
           buttonname:  "btn_A_2"
           cellColor:   topFrame.color
           buttonColor: "black"
       //    imgtopsrc:    "qrc:/icons/warning.png"
       //    imgbottomsrc: "qrc:/icons/music.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_A_3
           buttonname:  "btn_A_3"
           cellColor:   topFrame.color
           buttonColor: "black"
         //  imgtopsrc:    "qrc:/icons/warning.png"
         //  imgbottomsrc: "qrc:/icons/air-con.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_B_7
           buttonname:  "btn_B_7"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
         //  imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/7_button.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_B_8
           buttonname:  "btn_B_8"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
          // imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/8_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_9
           buttonname:  "btn_B_9"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
         //  imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/9_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_13
           buttonname:  "btn_B_13"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           imgtopsrc:    "qrc:/icons/b13_label.png"
           imgbottomsrc: "qrc:/icons/sub_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_17
           buttonname:  "btn_B_17"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           imgtopsrc:    "qrc:/icons/b17_label.png"
           imgbottomsrc: "qrc:/icons/div_button.png"
           antialiasing: true

        }

//=====================*******=====================
         CalcButton  {
           id: btn_A_4
           buttonname:  "btn_A_4"
           cellColor:    topFrame.color
           buttonColor: "blue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/music.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_A_5
           buttonname:  "btn_A_5"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/air-con.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_A_6
           buttonname:  "btn_A_6"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/music.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_B_4
           buttonname:  "btn_B_4"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/4_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_5
           buttonname:  "btn_B_5"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/5_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_6
           buttonname:  "btn_B_6"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/6_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_14
           buttonname:  "btn_B_14"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/add_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_18
           buttonname:  "btn_B_18"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           imgtopsrc:    "qrc:/icons/b18_label.png"
           imgbottomsrc: "qrc:/icons/mul_button.png"
           antialiasing: true

        }
//=====================*******=====================

         CalcButton  {
           id: btn_A_7
           buttonname:  "btn_A_7"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/air-con.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_A_8
           buttonname:  "btn_A_8"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/music.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_A_9
           buttonname:  "btn_A_9"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/air-con.png"
           antialiasing: true

        }


        CalcButton  {
           id: btn_B_1
           buttonname:  "btn_B_1"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/1_button.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_B_2
           buttonname:  "btn_B_2"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/2_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_3
           buttonname:  "btn_B_3"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/3_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_15
           buttonname:  "btn_B_15"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/swap_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_19
           buttonname:  "btn_B_19"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/enter_button.png"
           antialiasing: true

        }

//=====================*******=====================

        CalcButton  {
           id: btn_A_10
           buttonname:  "btn_A_10"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/music.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_A_11
           buttonname:  "btn_A_11"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/air-con.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_A_12
           buttonname:  "btn_A_12"
           cellColor:    topFrame.color
           buttonColor: "black"
           //imgtopsrc:    "qrc:/icons/warning.png"
           //imgbottomsrc: "qrc:/icons/music.png"
           antialiasing: true

        }


         CalcButton  {
           id: btn_B_10
           buttonname:  "btn_B_10"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/0_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_11
           buttonname:  "btn_B_11"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/point_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_12
           buttonname:  "btn_B_12"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/sign_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_16
           buttonname:  "btn_B_16"
           cellColor:    topFrame.color
           buttonColor: "lightsteelblue"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/em_button.png"
           antialiasing: true

        }

         CalcButton  {
           id: btn_B_20
           buttonname:  "btn_B_20"
           cellColor:    topFrame.color
           buttonColor: "red"
           //imgtopsrc:    "qrc:/icons/warning.png"
           imgbottomsrc: "qrc:/icons/cx_button.png"
           antialiasing: true

        }



        }

    }


//=====================*******==========================================*******=====================
   Rectangle {
        id: switchFrame
        color: "#A070A0"
        height:  parent.height*0.16


        anchors.bottom: resizeRectangleBottom.top
        anchors.left:  resizeRectangleLeft.right
        anchors.right: buttonFrame.left


        Grid {
          id: switchGrid

          anchors.fill: parent
          rows: 1; columns: 4;

          CalcSwitch {
            id: switch_A
            switchname:  "switch_A"
            cellColor:    topFrame.color
            switchColor:  "black"
        //   imgtopsrc:    "qrc:/icons/warning.png"
            imgcentrsrc: "qrc:/icons/back_switch.png"
            imgsrc:    "qrc:/icons/switch_a.png"
            imgbottomsrc: "qrc:/icons/on_button.png"
            antialiasing: true


            tristate: false
            state: "rightposition"

          }

          CalcSwitch {
            id: switch_B
            switchname:  "switch_B"
            cellColor:    topFrame.color
            switchColor:  "black"
            imgsrc:    "qrc:/icons/switch_b.png"
            imgcentrsrc: "qrc:/icons/back_switch.png"
            imgbottomsrc: "qrc:/icons/cz_switch.png"
            antialiasing: true
            tristate: true
            state: "leftposition"

          }


          CalcSwitch {
            id: switch_C
            switchname:  "switch_C"
            cellColor:    topFrame.color
            switchColor:  "black"
            imgsrc:    "qrc:/icons/switch_b.png"
            imgcentrsrc: "qrc:/icons/back_switch.png"
            imgbottomsrc: "qrc:/icons/grd_switch.png"
            antialiasing: true
            tristate: true
            state: "centrposition"

          }

          CalcSwitch {
            id: switch_D
            switchname:  "switch_D"
            cellColor:    topFrame.color
            switchColor:  "black"
            imgsrc:    "qrc:/icons/switch_a.png"
            imgcentrsrc: "qrc:/icons/back_switch.png"
            imgbottomsrc: "qrc:/icons/dp_switch.png"
            antialiasing: true
            tristate: false
            state: "leftposition"

          }



        }




    }


//=====================*******==========================================*******=====================
   Rectangle {
        id: icdFrame
        color: "#A07030"

        anchors.top : topFrame.bottom
        anchors.bottom: switchFrame.top
        anchors.left:  resizeRectangleLeft.right
        anchors.right: buttonFrame.left
        radius: parent.height/8



     //   Grid {
       //   id: digitGrid

         // anchors.fill: parent
          //rows: 1; columns: 11;


          CalcDigit {
            id: digit1
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: parent.left
          }

          CalcDigit {
            id: digit2
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit1.right
          }

          CalcDigit {
            id: digit3
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit2.right
          }

          CalcDigit {
            id: digit4
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit3.right
          }

          CalcDigit {
            id: digit5
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit4.right
          }

          CalcDigit {
            id: digit6
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit5.right
          }

          CalcDigit {
            id: digit7
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit6.right
          }

          CalcDigit {
            id: digit8
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit7.right
          }

          CalcDigit {
            id: digit9
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit8.right
          }

          CalcDigit {
            id: digit10
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit9.right
          }

          CalcDigit {
            id: digit11
            anchors.top: parent.top
            anchors.bottom:  parent.bottom
            anchors.left: digit10.right
          }



         //}


    }


//=====================*******==========================================*******=====================
}
