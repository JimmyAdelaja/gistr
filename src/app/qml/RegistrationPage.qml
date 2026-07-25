import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Rectangle {
    id: registrationRoot
    width: 1024
    height: 768
    color: "#f4f6f9"

    // --- API Configuration ---
    // Update this URL placeholder with your actual endpoint later
    property string apiEndpoint: "https://api.yourdomain.com/v1/voter-registration"

    // --- Header Section ---
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

        // Profile Card matching top right mockup
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

                    Item {
                        width: 1
                        height: 1
                    }

                    Button {
                        id: logoutButton
                        width: 90
                        height: 38
                        anchors.verticalCenter: parent.verticalCenter
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

    // --- Main Content Card ---
    Item {
        id: mainCardContainer
        anchors.top: headerBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 40
        anchors.topMargin: 10

        MultiEffect {
            source: mainCard
            anchors.fill: mainCard
            shadowEnabled: true
            shadowColor: "#12000000"
            shadowBlur: 0.5
            shadowVerticalOffset: 6
        }

        Rectangle {
            id: mainCard
            anchors.fill: parent
            color: "#ffffff"
            radius: 12

            // Top Header Inside Card (Title & Steps)
            Item {
                id: cardHeader
                width: parent.width - 60
                height: 50
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 30

                Text {
                    text: "New Voter Registration"
                    font.pixelSize: 24
                    font.bold: true
                    color: "#1a202c"
                    anchors.verticalCenter: parent.verticalCenter
                }

                // Step Indicator Setup
                Row {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 8

                    Rectangle {
                        width: 50
                        height: 24
                        color: "#e2e8f0"
                        radius: 4
                        Text {
                            text: "Step 1"
                            font.pixelSize: 12
                            color: "#4a5568"
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 2
                        color: "#00cbd5"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Rectangle {
                        width: 50
                        height: 24
                        color: "#e2e8f0"
                        radius: 4
                        Text {
                            text: "Step 2"
                            font.pixelSize: 12
                            color: "#4a5568"
                            anchors.centerIn: parent
                        }
                    }
                    Rectangle {
                        width: 60
                        height: 2
                        color: "#cbd5e0"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Rectangle {
                        width: 50
                        height: 24
                        color: "#f7fafc"
                        radius: 4
                        border.color: "#e2e8f0"
                        Text {
                            text: "Step 3"
                            font.pixelSize: 12
                            color: "#a0aec0"
                            anchors.centerIn: parent
                        }
                    }
                }
            }

            // 3-Column Form Grid Layout
            Grid {
                id: formGrid
                anchors.top: cardHeader.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 30
                anchors.topMargin: 20
                columns: 3
                spacing: 40

                // Helper Component for Form Labels
                Component {
                    id: formLabel
                    Text {
                        font.pixelSize: 14
                        font.bold: true
                        color: "#2d3748"
                    }
                }

                // Helper Component for Custom TextFields
                Component {
                    id: customTextField
                    TextField {
                        width: 280
                        height: 40
                        color: "#1a202c"
                        font.pixelSize: 14
                        background: Rectangle {
                            border.color: parent.activeFocus ? "#00cbd5" : "#cbd5e0"
                            border.width: 1.5
                            radius: 6
                        }
                    }
                }

                // ================= COLUMN 1: PERSONAL INFORMATION =================
                Column {
                    width: 280
                    spacing: 12

                    Text {
                        text: "Personal Information"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#1a202c"
                        bottomPadding: 4
                    }

                    Column {
                        spacing: 6
                        Text {
                            text: "First Name"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: firstNameField
                            sourceComponent: customTextField
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "Last Name"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: lastNameField
                            sourceComponent: customTextField
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "Date of Birth"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Row {
                            spacing: 10
                            Loader {
                                id: dobDateField
                                sourceComponent: customTextField
                                width: 160
                                onLoaded: {
                                    item.placeholderText = "DD/MM/YYYY";
                                }
                            }
                            ComboBox {
                                id: dobMonthCombo
                                width: 110
                                height: 40
                                model: ["Month", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
                            }
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "Gender"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Row {
                            spacing: 20
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter
                            RadioButton {
                                id: genderFemale
                                text: "Female"
                                checked: true
                            }
                            RadioButton {
                                id: genderMale
                                text: "Male"
                            }
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "SSN / National ID Type"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        ComboBox {
                            id: idTypeCombo
                            width: 280
                            height: 40
                            model: ["National ID Card", "Social Security Number", "Passport", "Driver's License"]
                        }
                    }
                }

                // ================= COLUMN 2: CONTACT DETAILS =================
                Column {
                    width: 280
                    spacing: 12

                    Text {
                        text: "Contact Details"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#1a202c"
                        bottomPadding: 4
                    }

                    Column {
                        spacing: 6
                        Text {
                            text: "Email"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: emailField
                            sourceComponent: customTextField
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "Phone Number"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: phoneField
                            sourceComponent: customTextField
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "Residential Address"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: addressField
                            sourceComponent: customTextField
                        }
                    }
                    Row {
                        spacing: 15
                        Column {
                            spacing: 6
                            Text {
                                text: "City"
                                font.pixelSize: 14
                                font.bold: true
                                color: "#2d3748"
                            }
                            Loader {
                                id: cityField
                                sourceComponent: customTextField
                                width: 132
                            }
                        }
                        Column {
                            spacing: 6
                            Text {
                                text: "Zip Code"
                                font.pixelSize: 14
                                font.bold: true
                                color: "#2d3748"
                            }
                            Loader {
                                id: zipShortField
                                sourceComponent: customTextField
                                width: 133
                            }
                        }
                    }
                    Column {
                        spacing: 6
                        Text {
                            text: "Full Zip Code / Region"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: zipFullField
                            sourceComponent: customTextField
                        }
                    }
                }

                // ================= COLUMN 3: ELIGIBILITY & IDENTITY =================
                Column {
                    width: 280
                    spacing: 12

                    Text {
                        text: "Eligibility & Identity"
                        font.pixelSize: 16
                        font.bold: true
                        color: "#1a202c"
                        bottomPadding: 4
                    }

                    Column {
                        spacing: 6
                        Text {
                            text: "SSN / National ID Number"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        Loader {
                            id: idNumberField
                            sourceComponent: customTextField
                        }
                    }

                    Column {
                        spacing: 6
                        Text {
                            text: "Citizenship Status declaration"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        CheckBox {
                            id: citizenshipCheck
                            text: "I declare my eligibility in the election stated."
                            font.pixelSize: 12
                            width: 280

                            contentItem: Text {
                                text: citizenshipCheck.text
                                font: citizenshipCheck.font
                                color: citizenshipCheck.palette.windowText
                                verticalAlignment: Text.AlignVCenter
                                
                                leftPadding: citizenshipCheck.indicator ? citizenshipCheck.indicator.width + citizenshipCheck.spacing : 0
                                
                                wrapMode: Text.Wrap
                            }
                        }
                    }

                    Column {
                        spacing: 6
                        Text {
                            text: "Polling Station preference"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }
                        ComboBox {
                            id: pollingStationCombo
                            width: 280
                            height: 40
                            model: ["Select Polling Station", "District Center A", "Public Library Branch B", "Community Hub C"]
                        }
                    }

                    Column {
                        spacing: 6
                        Text {
                            text: "Identity Document Scan"
                            font.pixelSize: 14
                            font.bold: true
                            color: "#2d3748"
                        }

                        // Fake upload zone from mockup
                        Rectangle {
                            width: 280
                            height: 75
                            color: "#f7fafc"
                            border.color: "#cbd5e0"
                            border.width: 1
                            // style: Text.Sunken
                            radius: 6

                            Column {
                                anchors.centerIn: parent
                                spacing: 4
                                Text {
                                    text: "⬆"
                                    font.pixelSize: 18
                                    color: "#718096"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                                Text {
                                    text: "Upload File (optional)"
                                    font.pixelSize: 13
                                    color: "#718096"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: console.log("File picker triggered (Mock up)")
                            }
                        }
                    }

                    Item {
                        width: 1
                        height: 10
                    } // Spacer

                    // Submit Button Section
                    Button {
                        id: submitButton
                        width: 280
                        height: 44

                        contentItem: Text {
                            text: "Submit Registration"
                            font.pixelSize: 15
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
                                    color: "#00ecf6"
                                }
                                GradientStop {
                                    position: 1.0
                                    color: "#00beca"
                                }
                            }
                        }

                        onClicked: {
                            registrationRoot.submitRegistrationData();
                        }
                    }
                }
            }
        }
    }

    // --- JavaScript Functions ---
    function submitRegistrationData() {
        // 1. Gather all data values neatly into a single payload object
        var payload = {
            "personalInformation": {
                "firstName": firstNameField.item.text,
                "lastName": lastNameField.item.text,
                "dateOfBirth": dobDateField.item.text,
                "birthMonth": dobMonthCombo.currentText,
                "gender": genderFemale.checked ? "Female" : "Male",
                "idType": idTypeCombo.currentText
            },
            "contactDetails": {
                "email": emailField.item.text,
                "phoneNumber": phoneField.item.text,
                "address": addressField.item.text,
                "city": cityField.item.text,
                "zipShort": zipShortField.item.text,
                "zipFullRegion": zipFullField.item.text
            },
            "eligibilityAndIdentity": {
                "idNumber": idNumberField.item.text,
                "citizenshipDeclared": citizenshipCheck.checked,
                "pollingStationPreference": pollingStationCombo.currentText
            }
        };

        // 2. Format object as JSON string
        var jsonString = JSON.stringify(payload, null, 2);
        console.log("Preparing payload string payload:\n" + jsonString);

        // 3. Initiate the HTTP POST Network Call
        var xhr = new XMLHttpRequest();
        xhr.open("POST", registrationRoot.apiEndpoint);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200 || xhr.status === 201) {
                    console.log("Registration successfully pushed! Server response:", xhr.responseText);
                    // Route user back cleanly or trigger success modal view setup
                    mainWindow.currentView = "dashboard";
                } else {
                    console.log("Error posting registration setup. Status code:", xhr.status, "Response text:", xhr.responseText);
                }
            }
        };

        xhr.send(jsonString);
    }
}
