import QtQuick
import QtQuick.Controls

ApplicationWindow {
    id: window
    
    title: qsTr('I Am MAX!')
    width: 750
    height: 282
    visible: true
    
    flags: Qt.SplashScreen | Qt.FramelessWindowHint
    
    QtObject {
        id: internal
        
        property string name:
            if (cell.currentText == 'M')
                'Max'
            else if (cell.currentText == 'A')
                'mAx'
            else
                'maX'
    }
    
    Rectangle {
        id: topBar
        
        height: 32
        color: '#333'
        
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        
        Text {
            text: 'I am ' + internal.name + '!'
            color: 'white'
            font.pixelSize: 12
            
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
        }
        
        Rectangle {
            width: 63
            height: 32
            color: '#222'
            
            anchors.right: parent.right
            
            RoundButton {
                width: 18
                height: 18
                
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 9
                }
                
                background: Rectangle {
                    color: minimizeButtonArea.containsMouse ? 'green' : '#0a0'
                    radius: parent.width
                }
                
                Text {
                    text: qsTr('_')
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                MouseArea {
                    id: minimizeButtonArea
                    
                    anchors.fill: parent
                    
                    hoverEnabled: true
                    onClicked: window.showMinimized()
                }
            }
            
            RoundButton {
                width: 18
                height: 18
                
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 9
                }
                
                background: Rectangle {
                    color: closeButtonArea.containsMouse ? '#c00' : 'red'
                    radius: parent.width
                }
                
                Text {
                    text: qsTr('x')
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                
                MouseArea {
                    id: closeButtonArea
                    
                    anchors.fill: parent
                    
                    hoverEnabled: true
                    onClicked: window.close()
                }
            }
        }
    }
    
    Rectangle {
        color: '#222'
        
        anchors {
            top: topBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        
        MouseArea {
            id: mouse1
            
            width: 250
            height: 250
            
            anchors {
                left: parent.left
                leftMargin: 250
            }
            
            hoverEnabled: true
            onEntered: cell.state = 'YELLOW_A'
            onExited: cell.state = 'GREEN_M'
        }
        
        MouseArea {
            id: mouse2
            
            width: 250
            height: 250
            
            anchors {
                left: parent.left
                leftMargin: 500
            }
            
            hoverEnabled: true
            onEntered: cell.state = 'RED_X'
            onExited: cell.state = 'GREEN_M'
        }

        Rectangle {
            id: cell
            
            width: 250
            height: 250
            color: 'green'
            
            anchors.left: parent.left
            
            state: 'GREEN_M'
            
            property string currentText: 'M'
            
            Text {
                text: cell.currentText
                color: 'black'
                font.pointSize: 36
                
                anchors.centerIn: parent
            }

            states: [
                State {
                    name: 'GREEN_M'

                    PropertyChanges {
                        target: cell
                        color: 'limegreen'
                        currentText: 'M'
                        anchors.leftMargin: 0
                    }
                },
                
                State {
                    name: 'YELLOW_A'

                    PropertyChanges {
                        target: cell
                        color: 'yellow'
                        currentText: 'A'
                        anchors.leftMargin: 250
                    }
                },
                
                State {
                    name: 'RED_X'

                    PropertyChanges {
                        target: cell
                        color: 'red'
                        currentText: 'X'
                        anchors.leftMargin: 500
                    }
                }
            ]
            
            transitions: [                
                Transition {
                    to: 'GREEN_M'
                    
                    ColorAnimation {
                        target: cell
                        duration: 1000
                    }
                    
                    NumberAnimation {
                        target: cell
                        property: 'anchors.leftMargin'
                        easing.type: Easing.InElastic
                        duration: 500
                    }
                },
                
                Transition {
                    to: 'YELLOW_A'
                    
                    ColorAnimation {
                        target: cell
                        duration: 1000
                    }
                    
                    NumberAnimation {
                        target: cell
                        property: 'anchors.leftMargin'
                        easing.type: Easing.InOutExpo
                        duration: 1000
                    }
                },
                
                Transition {
                    to: 'RED_X'
                    
                    ColorAnimation {
                        target: cell
                        duration: 1000
                    }
                    
                    NumberAnimation {
                        target: cell
                        property: 'anchors.leftMargin'
                        easing.type: Easing.OutElastic
                        duration: 500
                    }
                }
            ]
        }
    }
}
