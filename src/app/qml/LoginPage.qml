import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Rectangle {
    id: root
    width: 1024
    height: 768
    visible: true

    // // Background: Grid pattern simulation
    // color: "#f4f6f9"

    // Grid {
    //     id: grid
    //     opacity: 0.05
    //     anchors.centerIn: parent

    //     // 1. Define your fixed cell dimensions
    //     readonly property real cellWidth: 40
    //     readonly property real cellHeight: 40

    //     // 2. Dynamically calculate columns and rows based on available space
    //     columns: Math.ceil(parent.width / cellWidth)
    //     rows: Math.ceil(parent.height / cellHeight)

    //     Repeater {
    //         // 3. Multiply columns by rows to get the total needed squares
    //         model: grid.columns * grid.rows

    //         Rectangle {
    //             // 4. Set the cells to the fixed sizes
    //             width: grid.cellWidth
    //             height: grid.cellHeight
    //             color: "transparent"
    //             border.color: "#000000"
    //             border.width: 1
    //         }
    //     }
    // }

    // The Deep Ambient Glow Cloud
    Item {
        id: glowContainer
        width: 900  // Drastically increased size for boundless falloff
        height: 900
        anchors.centerIn: parent

        // Low opacity keeps it an ethereal backdrop, not a harsh solid shape
        opacity: 0.2

        MultiEffect {
            source: canvasGlowSource
            anchors.fill: canvasGlowSource
            blurEnabled: true
            blur: 1.0
            blurMultiplier: 4.0 // Pushes the gradient into an ultra-soft mist
        }

        // Canvas forces smooth sub-pixel rendering for continuous color blending
        Canvas {
            id: canvasGlowSource
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();

                // Create a native radial gradient: (startX, startY, startRadius, endX, endY, endRadius)
                var centerX = width / 2;
                var centerY = height / 2;
                var grad = ctx.createRadialGradient(centerX, centerY, 0, centerX, centerY, width / 2);

                // Seamlessly bleed color into pure transparency
                grad.addColorStop(0.0, "#0d3c7d"); // Core deep blue
                grad.addColorStop(0.3, "#164d96"); // Mid-tone expansion
                grad.addColorStop(0.6, "rgba(26, 82, 155, 0.2)"); // Dissolving edge
                grad.addColorStop(1.0, "transparent"); // Complete fadeout

                ctx.fillStyle = grad;
                ctx.fillRect(0, 0, width, height);
            }
        }
    }

    // Main Login Card Container
    Item {
        id: loginCardContainer
        width: 420
        height: 520
        anchors.centerIn: parent

        // Soft Drop Shadow for the Card
        MultiEffect {
            source: loginCard
            anchors.fill: loginCard
            shadowEnabled: true
            shadowColor: "#20000000"
            shadowBlur: 0.8
            shadowVerticalOffset: 8
            shadowHorizontalOffset: 0
        }

        Rectangle {
            id: loginCard
            anchors.fill: parent
            color: "#ffffff"
            radius: 12

            Column {
                anchors.fill: parent
                anchors.margins: 40
                spacing: 16
                // alignment: Qt.AlignHCenter

                // Logo and Subtitle Section
                Column {
                    width: parent.width
                    spacing: 8
                    // alignment: Qt.AlignHCenter

                    Image {
                        id: logo
                        source: "qrc:/assets/icon-no-bg.png"
                        height: 152
                        fillMode: Image.PreserveAspectFit
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                // Spacer

                // Username / Voter ID Input
                TextField {
                    id: usernameInput
                    width: parent.width
                    height: 50
                    placeholderText: "Username"
                    placeholderTextColor: "#a0aec0"
                    color: "#1a202c"
                    font.pixelSize: 15

                    leftPadding: 45
                    background: Rectangle {
                        border.color: usernameInput.activeFocus ? "#00cbd5" : "#cbd5e0"
                        border.width: 1.5
                        radius: 8

                        // User Icon Placeholder
                        Image {
                            id: usernameIcon
                            source:"qrc:/assets/icons8-user-male-96.png"
                            width: 20
                            height: 20
                            // color: "#2d3748"
                            // radius: 10
                            anchors.left: parent.left
                            anchors.leftMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                // Password Input
                TextField {
                    id: passwordInput
                    width: parent.width
                    height: 50
                    placeholderText: "Password"
                    placeholderTextColor: "#a0aec0"
                    color: "#1a202c"
                    font.pixelSize: 15
                    echoMode: TextInput.Password

                    leftPadding: 45
                    background: Rectangle {
                        border.color: passwordInput.activeFocus ? "#00cbd5" : "#cbd5e0"
                        border.width: 1.5
                        radius: 8

                        // Key Icon Placeholder
                        Image {
                            id: passwordIcon
                            source:"qrc:/assets/icons8-password-96.png"
                            width: 20
                            height: 20
                            // color: "#2d3748"
                            // radius: 2
                            anchors.left: parent.left
                            anchors.leftMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }

                // Log In Button Container (for Shadow Effect)
                Item {
                    width: parent.width
                    height: 50

                    MultiEffect {
                        source: loginButtonBackground
                        anchors.fill: loginButtonBackground
                        shadowEnabled: true
                        shadowColor: "#4000cbd5"
                        shadowBlur: 0.5
                        shadowVerticalOffset: 4
                    }

                    Button {
                        id: loginButton
                        anchors.fill: parent

                        contentItem: Text {
                            text: "Log In"
                            font.pixelSize: 16
                            font.bold: true
                            color: "#ffffff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle {
                            id: loginButtonBackground
                            radius: 8
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop { position: 0.0; color: "#00e1ec" }
                                GradientStop { position: 1.0; color: "#00b2be" }
                            }
                        }

                        onClicked: {
                            if (usernameInput.text !== "" && passwordInput.text !== "") {
                              authCtrl.login(usernameInput.text, passwordInput.text)
                            } else {
                              console.log("Form submission caught: Missing input targets.")
                            }
                        }
                    }
                }

                // Spacer
                Item { width: 1; height: 5 }

                // Footer Links
                Text {
                    text: "Forgot Password?"
                    font.pixelSize: 13
                    color: "#1a73e8"
                    anchors.horizontalCenter: parent.horizontalCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: console.log("Forgot password clicked")
                    }
                }

                Text {
                    text: "Create an Account"
                    font.pixelSize: 13
                    color: "#1a73e8"
                    anchors.horizontalCenter: parent.horizontalCenter

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: console.log("Create account clicked")
                    }
                }
            }
        }
    }
}
