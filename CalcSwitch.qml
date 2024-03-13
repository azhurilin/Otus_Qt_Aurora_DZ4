import QtQuick 2.0



   Rectangle {

      id: calcswitch
      width: parent.width/4
      height: parent.height


      property alias cellColor: calcswitch.color
      property alias switchColor:   cswitch.color

      property bool tristate: false

      property alias imgsrc:        switchimg.source
      property alias imgtopsrc:     imgtop.source
      property alias imgcentrsrc:     imgcentr.source
      property alias imgbottomsrc:  imgbottom.source

      property  string switchname


       Rectangle {
         id:top
         width: parent.width
         height: (parent.height - cswitch.height)/2
         color: calcswitch.color

         anchors.top: parent.top
         anchors.left:  parent.left
         anchors.right: parent.right

         Image {
           id: imgtop
           anchors.fill: parent
         }
      }
//=====================*******=====================
   Rectangle {
        id: cswitch
        width: parent.width
        height: parent.height*0.35

        anchors.centerIn: parent

        signal clicked

        states: [
            State {
                name: "leftposition"
                PropertyChanges
                { target: switchimg; x: 0; y: parent.height/2 - height/2;


                }

            },
            State {
                name: "centrposition"
               PropertyChanges
                { target: switchimg; x: cswitch.width/2 - switchimg.width/2; y: parent.height/2 - height/2;

                }
            },
            State {
                name: "rightposition"
               PropertyChanges
                { target: switchimg; x: cswitch.width - switchimg.width; y: parent.height/2 - height/2;

                }
            }
        ]



        Image {
           id: imgcentr
           anchors.fill: parent
        }


        Image {
          id: switchimg
          width: parent.width/5
          height: parent.height*1.2

        //  x: parent.width/2 -  width/2
        //  y: parent.height/2 - height/2


          Behavior on x {
             NumberAnimation {
               duration: 700
             }
          }


         }


         MouseArea {
           id: leftswitch
           width: parent.width/2
           height: parent.height

           anchors.left:   parent.left
           anchors.top:    parent.top
           anchors.bottom: parent.bottom

           onClicked: {

           if (cswitch.state == "") {cswitch.state = "leftposition"}
           if (cswitch.state == "centrposition") {cswitch.state = "leftposition"}
           if (cswitch.state == "rightposition" && tristate==true)     {cswitch.state = "centrposition"}
             else  {cswitch.state = "leftposition"}

           buttonClic(switchname + "_" + cswitch.state);

           }




         }


         MouseArea {
           id: rightswitch
           width: parent.width/2
           height: parent.height

           anchors.right:  parent.right
           anchors.top:    parent.top
           anchors.bottom: parent.bottom

           onClicked: {

           if (cswitch.state == "") {cswitch.state = "rightposition"}
           if (cswitch.state == "centrposition") {cswitch.state = "rightposition"}
           if (cswitch.state == "leftposition" && tristate==true)   {cswitch.state = "centrposition"}
             else  {cswitch.state = "rightposition"}

           buttonClic(switchname + "_" + cswitch.state);

           }

         }

   }


//=====================*******=====================
   Rectangle {
         id:bottom
         width: parent.width
         height: parent.height - cswitch.height - top.height
         color: calcswitch.color

         anchors.bottom: parent.bottom
         anchors.left:  parent.left
         anchors.right: parent.right

         Image {
           id: imgbottom
           anchors.fill: parent
         }

   }

}
//=====================*******=====================
