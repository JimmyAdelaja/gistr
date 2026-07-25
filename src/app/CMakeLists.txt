qt_add_executable(appgistr
    cpp/main.cpp
    cpp/authcontroller.h
    resource.qrc
)

qt_add_qml_module(appgistr
    URI gistr
    QML_FILES
        qml/Main.qml
        qml/LoginPage.qml
        qml/DashboardPage.qml
        qml/ListLinkItem.qml
        qml/DashboardActionButton.qml
        qml/RegistrationPage.qml
    RESOURCES resource.qrc
)

set_target_properties(appgistr PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appgistr
    PRIVATE Qt6::Quick Qt6::Sql
)

include(GNUInstallDirs)

# Install executable target to bin/
install(TARGETS appgistr
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION bin
)

# Install windeployqt output (DLLs, plugins, QML modules) from this subdirectory's binary folder
install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
    DESTINATION bin
    FILES_MATCHING
    PATTERN "*.dll"
    PATTERN "platforms/*"
    PATTERN "styles/*"
    PATTERN "imageformats/*"
    PATTERN "iconengines/*"
    PATTERN "generic/*"
    PATTERN "qml/*"
    PATTERN "QtQuick/*"
    PATTERN "QtQml/*"
    PATTERN "translations/*"
    PATTERN "CMakeFiles" EXCLUDE
    PATTERN "_CPack_Packages" EXCLUDE
)