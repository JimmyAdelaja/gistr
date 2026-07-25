import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow
    width: 1024
    height: 768
    visible: true
    title: qsTr("Gistr Election System")

    // TODO Later
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

    // State variable to track what view should be active
    property string currentView: "login"

    // The Loader dynamically loads QML files depending on the currentView state
    Loader {
        id: pageLoader
        anchors.fill: parent

        // Reactive switch statement to choose the source component
        source: {
            if (mainWindow.currentView === "login") {
                return "LoginPage.qml"
            } else if (mainWindow.currentView === "dashboard") {
                return "DashboardPage.qml"
            } else if (mainWindow.currentView === "registration") {
                return "RegistrationPage.qml"
            } else if (mainWindow.currentView === "editProfile") {
                return "EditProfilePage.qml"
            } else if (mainWindow.currentView === "changePassword") {
                return "ChangePasswordPage.qml"
            } else if (mainWindow.currentView === "viewPermissions") {
                return "ViewPermissionsPage.qml"
            } else if (mainWindow.currentView === "manageDevices") {
                return "ManageDevicesPage.qml"
            } else if (mainWindow.currentView === "checkStatus") {
                return "CheckStatusPage.qml"
            } else if (mainWindow.currentView === "manageRegistrations") {
                return "ManageRegistrationsPage.qml"
            } else if (mainWindow.currentView === "viewVoterRoll") {
                return "ViewVoterRollPage.qml"
            }
            return ""
        }
    }

    // React cleanly to C++ signals to change the UI state
    Connections {
        target: authCtrl // Your C++ object registered in main.cpp

        onLoginSuccess: {
            // Change the state variable; the Loader automatically reacts and switches views
            mainWindow.currentView = "dashboard"
        }

        onLoginFailure: (reason) => {
            console.log("Login failed in main window context:", reason)
        }
    }
}
