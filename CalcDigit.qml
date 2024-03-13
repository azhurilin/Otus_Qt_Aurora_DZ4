import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Window 2.12

//import QtQuick 2.15
//import QtQuick.Window 2.15



Rectangle {
    id:digit
    width: parent.width/11
    height: parent.height
    color: "lightgreen"
    border.color: "darkgreen"
    border.width: 3
    radius: width/8

    property  alias imgsrc:  digitimg.source


    
    Image {
        id: digitimg
        anchors.fill: parent
        
        source: ""
        
        //  visible: false   
    }
    
}
//=====================*******=====================
