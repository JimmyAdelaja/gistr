cmake_minimum_required(VERSION 3.16)

project(gistr VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Sql)

qt_standard_project_setup(REQUIRES 6.8)

add_subdirectory(src/app)

# Install targets so CPack knows what to put in the installer
# install(TARGETS appgistr DESTINATION bin)
# install(DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/"
#         DESTINATION bin
#         FILES_MATCHING 
#         PATTERN "*.dll"
#         PATTERN "platforms/*"
#         PATTERN "plugins/*"
#         PATTERN "qml/*"
#         PATTERN "translations/*"
#         PATTERN "_CPack_Packages" EXCLUDE
# )

# Configure CPack for WiX MSI generation
set(CPACK_GENERATOR "WIX")
set(CPACK_PACKAGE_NAME "appgistr")
set(CPACK_PACKAGE_VENDOR "OrgCorp")
set(CPACK_PACKAGE_VERSION "1.0.0")
set(CPACK_WIX_UPGRADE_GUID "10fb36de-b1b7-4b13-a770-f581f9919926")
set(CPACK_PACKAGE_EXECUTABLES "appgistr" "Gistr")

include(CPack)