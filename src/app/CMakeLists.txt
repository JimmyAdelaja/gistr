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

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appgistr PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appgistr
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appgistr
    PRIVATE Qt6::Quick Qt6::Sql
)

include(GNUInstallDirs)
install(TARGETS appgistr
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

# Automatically deploy Qt runtime (DLLs, platform plugins, QML modules)
# alongside the installed exe — runs during `cmake --install` / `cpack`,
# so it always targets the real install location, no manual windeployqt needed.
if(WIN32)
    qt_generate_deploy_app_script(
        TARGET appgistr
        OUTPUT_SCRIPT deploy_script
        NO_UNSUPPORTED_PLATFORM_ERROR
        NO_TRANSLATIONS
    )
    install(SCRIPT ${deploy_script})
endif()
