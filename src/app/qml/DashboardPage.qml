import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Rectangle {
    id: dashboardRoot
    width: 1024
    height: 768
    color: "#f4f6f9"

    // // --- Background Grid Simulation ---
    // Grid {
    //     id: gridBackdrop
    //     opacity: 0.05
    //     anchors.centerIn: parent
    //     readonly property real cellWidth: 40
    //     readonly property real cellHeight: 40
    //     columns: Math.ceil(parent.width / cellWidth)
    //     rows: Math.ceil(parent.height / cellHeight)

    //     Repeater {
    //         model: gridBackdrop.columns * gridBackdrop.rows
    //         Rectangle {
    //             width: gridBackdrop.cellWidth
    //             height: gridBackdrop.cellHeight
    //             color: "transparent"
    //             border.color: "#000000"
    //             border.width: 1
    //         }
    //     }
    // }

    // --- TOP HEADER LOGO & PROFILE BAR ---
    Item {
        id: headerBar
        width: parent.width
        height: 120
        anchors.top: parent.top

        Image {
            id: mainLogo
            source: "qrc:/assets/icon-no-bg.png"
            height: 60
            fillMode: Image.PreserveAspectFit
            anchors.left: parent.left
            anchors.leftMargin: 40
            anchors.verticalCenter: parent.verticalCenter
        }

        Item {
            id: profileCardContainer
            width: 420
            height: 70
            anchors.right: parent.right
            anchors.rightMargin: 40
            anchors.verticalCenter: parent.verticalCenter

            MultiEffect {
                source: profileCard
                anchors.fill: profileCard
                shadowEnabled: true
                shadowColor: "#15000000"
                shadowBlur: 0.4
                shadowVerticalOffset: 4
            }

            Rectangle {
                id: profileCard
                anchors.fill: parent
                color: "#ffffff"
                radius: 12

                Row {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    anchors.leftMargin: 15
                    anchors.rightMargin: 15
                    spacing: 12

                    Image {
                        id: avatarIcon
                        source: "qrc:/assets/icons8-user-male-96.png"
                        anchors.verticalCenter: parent.verticalCenter
                        width: 44
                        height: 44
                    }

                    Column {
                        spacing: 2
                        anchors.verticalCenter: parent.verticalCenter
                        Text {
                            text: "Welcome,"
                            color: "#718096"
                            font.pixelSize: 13
                        }
                        Text {
                            text: "Alice Johnson (Administrator)"
                            color: "#1a202c"
                            font.bold: true
                            font.pixelSize: 15
                        }
                    }

                    // Item { width: 1; height: 1; Row.fillWidth: true }

                    Button {
                        id: logoutButton
                        anchors.verticalCenter: parent.verticalCenter
                        width: 90
                        height: 38
                        contentItem: Text {
                            text: "Log Out"
                            font.pixelSize: 13
                            font.bold: true
                            color: "#ffffff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }
                        background: Rectangle {
                            radius: 8
                            gradient: Gradient {
                                orientation: Gradient.Horizontal
                                GradientStop {
                                    position: 0.0
                                    color: "#00cbd5"
                                }
                                GradientStop {
                                    position: 1.0
                                    color: "#00b2be"
                                }
                            }
                        }
                        onClicked: mainWindow.currentView = "login"
                    }
                }
            }
        }
    }

    // --- MAIN DASHBOARD CONTENT GRIDS ---
    Row {
        id: mainContentRow
        anchors.top: headerBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 40
        anchors.topMargin: 10
        spacing: 30

        // ================= LEFT: USER SETTINGS CARD =================
        Item {
            width: (parent.width - parent.spacing) / 2
            height: 480

            MultiEffect {
                source: userSettingsCard
                anchors.fill: userSettingsCard
                shadowEnabled: true
                shadowColor: "#15000000"
                shadowBlur: 0.5
                shadowVerticalOffset: 6
            }

            Rectangle {
                id: userSettingsCard
                anchors.fill: parent
                color: "#ffffff"
                radius: 12
                // padding: 30

                Rectangle {

                    anchors.fill: parent
                    anchors.margins: 30

                    Column {
                        anchors.fill: parent
                        spacing: 20

                        Text {
                            text: "User Settings"
                            font.pixelSize: 24
                            font.bold: true
                            color: "#1a202c"
                        }
                        Text {
                            text: "Quick links:"
                            font.pixelSize: 15
                            color: "#718096"
                        }

                        Column {
                            width: parent.width
                            spacing: 0

                            // These now perfectly reference your new external files!
                            ListLinkItem {
                                iconSource: "qrc:/assets/icons8-user-male-96.png"
                                titleText: "Edit Profile"
                                onClicked: mainWindow.currentView = "editProfile"
                            }
                            ListLinkItem {
                                iconSource: "qrc:/assets/icons8-password-96.png"
                                titleText: "Change Password"
                                onClicked: mainWindow.currentView = "changePassword"
                            }
                            ListLinkItem {
                                iconSource: "qrc:/assets/icons8-username-94.png"
                                titleText: "View Permissions"
                                onClicked: mainWindow.currentView = "viewPermissions"
                            }
                            ListLinkItem {
                                iconSource: "qrc:/assets/icons8-settings-96.png"
                                titleText: "Manage My Devices"
                                isLast: true
                                onClicked: mainWindow.currentView = "manageDevices"
                            }
                        }
                    }
                }
            }
        }

        // ================= RIGHT: REGISTRATION MODULES CARD =================
        Item {
            width: (parent.width - parent.spacing) / 2
            height: 480

            MultiEffect {
                source: registrationCard
                anchors.fill: registrationCard
                shadowEnabled: true
                shadowColor: "#15000000"
                shadowBlur: 0.5
                shadowVerticalOffset: 6
            }

            Rectangle {
                id: registrationCard
                anchors.fill: parent
                color: "#ffffff"
                radius: 12

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 30

                    Column {
                        anchors.fill: parent
                        spacing: 24

                        Text {
                            text: "Registration Modules"
                            font.pixelSize: 24
                            font.bold: true
                            color: "#1a202c"
                        }

                        Column {
                            width: parent.width
                            spacing: 14

                            DashboardActionButton {
                                buttonText: "New Voter Registration"
                                onClicked: mainWindow.currentView = "registration"
                            }
                            DashboardActionButton {
                                buttonText: "Check Status"
                                onClicked: mainWindow.currentView = "checkStatus"
                            }
                            DashboardActionButton {
                                buttonText: "Manage Existing Registrations"
                                onClicked: mainWindow.currentView = "manageRegistrations"
                            }
                            DashboardActionButton {
                                buttonText: "View Voter Roll"
                                onClicked: mainWindow.currentView = "viewVoterRoll"
                            }
                        }
                    }
                }
            }
        }
    }
}
