import QtQuick 2.0
import QtQuick.Controls 2.12



   Rectangle {

      id: calcbutton
      width: parent.width/8
      height: parent.height/4


       property alias cellColor: calcbutton.color
       property alias buttonColor: button.color

       property  alias imgtopsrc:  imgtop.source
       property  alias imgbottomsrc:  imgbottom.source
       property  string buttonname


       Rectangle {
         id:top
         width: parent.width
         height: parent.height - button.height
         color: calcbutton.color

         anchors.top: parent.top
         anchors.left:  parent.left
         anchors.right: parent.right

         Image {
           id: imgtop
           anchors.fill: parent
         }



      }


       Rectangle {
        id: button
        width: parent.width
        height: parent.height*0.5

        anchors.bottom: parent.bottom
        anchors.left:   parent.left
        anchors.right:  parent.right

        radius: parent.width/8



        Image {
          id: imgbottom
          anchors.fill: parent

         }

         MouseArea {
           anchors.fill: parent
           onClicked: {

           buttonClic(buttonname);

           updateICD();

           setDigitImg(digit1, 0)
           setDigitImg(digit2, 1)
           setDigitImg(digit3, 2)
           setDigitImg(digit4, 3)
           setDigitImg(digit5, 4)
           setDigitImg(digit6, 5)
           setDigitImg(digit7, 6)
           setDigitImg(digit8, 7)
           setDigitImg(digit9, 8)
           setDigitImg(digit10, 9)
           setDigitImg(digit11, 10)

           }
         }
       }

}
//=====================*******=====================




