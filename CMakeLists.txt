cmake_minimum_required(VERSION 3.13...3.17)

project(cmake-ci-test LANGUAGES CXX)

if( WIN32 )
    set(QT_WIN_PATH "C:\\" CACHE STRING "Path to installed qt binaries")
    message(STATUS "Looking for installed Qt5 at the following path:\n" ${QT_WIN_PATH})
    set(CMAKE_PREFIX_PATH ${QT_WIN_PATH})
endif()

find_package(Qt5 COMPONENTS Core Widgets Svg REQUIRED)


add_executable(cmake_test)

target_compile_features(cmake_test PUBLIC cxx_std_11)
set_target_properties(cmake_test PROPERTIES
        CXX_EXTENSIONS OFF
        AUTOMOC ON)

target_link_libraries(cmake_test PRIVATE
        Qt5::Widgets Qt5::Svg
        )

target_include_directories(cmake_test PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        )
target_sources(cmake_test PRIVATE src/main.cpp src/mainwindow.cpp)

if( NOT WIN32 )
    install(FILES res/cmake_test.desktop
            DESTINATION share/applications/)
    install(FILES res/cmake_test.svg
            DESTINATION share/icons/hicolor/scalable/apps)
endif()

install(TARGETS cmake_test DESTINATION "bin")
