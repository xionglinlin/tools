cmake_minimum_required(VERSION 3.16)

set(PROJECT_NAME SSTools)
project(${PROJECT_NAME} VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 1. 引入完整Qt模块（添加Qt6::Qml和Qt6::QuickPrivate）
find_package(Qt6 REQUIRED COMPONENTS Widgets Gui Quick Qml)
find_package(Dtk6 COMPONENTS Widget)

set(SRC_FILES
    crpcontroller.h
    crpcontroller.cpp
)

set(RES_FILES
    main.qrc
)

set(QML_FILES
    Main.qml
    CrpPackagePage.qml
)

# 2. 创建共享库目标
qt_add_library(sstoolscommon SHARED
    ${SRC_FILES}
    ${RES_FILES}
)

# 3. 创建可执行文件
qt_add_executable(${PROJECT_NAME} main.cpp)

# 4. 定义QML模块（关键修复：添加DEPENDENCIES和调整插件路径）
qt_add_qml_module(sstoolscommon
    URI SSTools
    VERSION 1.0
    DEPENDENCIES QtQuick  # 声明QML模块级依赖
    RESOURCES qml.qrc
    RESOURCE_PREFIX /qt/qml
    QML_FILES ${QML_FILES}
    OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/plugins/SSTools  # 路径已正确包含SSTools
)

find_package(Qt6QmlImportScanner REQUIRED)
qt6_import_qml_plugins(${PROJECT_NAME})

set_target_properties(sstoolscommon PROPERTIES PREFIX "")

# 5. 链接依赖库（添加Qt6::Qml和Qt6::QuickPrivate）
target_link_libraries(sstoolscommon PUBLIC
    Qt6::Widgets
    Qt6::Gui
    Qt6::Quick
    Qt6::Qml
    Dtk6::Widget
)

# 6. 可执行文件链接共享库
target_link_libraries(${PROJECT_NAME} PRIVATE
    sstoolscommon
)