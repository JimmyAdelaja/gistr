import QtQuick
import QtQuick.Controls

Window {
    id: mainWindow
    width: 1024
    height: 768
    visible: true
    title: qsTr("Gistr Election System")

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
                return "DashboardPage.qml" // Your post-login landing page
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
