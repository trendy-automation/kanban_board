TEMPLATE = app
TARGET = kanban_board
QT += qml quick

#windeployqt.exe "D:\Docs\Qt projects\kanban_board\build-kanban_board-Desktop_Qt_5_13_0_MinGW_32_bit-Release\release" --release C:\Qt\5.13.0\mingw73_32\qml

include(../../../shared_classes/message_handler/message_handler.pri)
include(../../../shared_classes/single_apprun/single_apprun.pri)
#include(../../../../shared_classes/watchdog/watchdog.pri)
include(plc_station/plc_station.pri)
include(udpreceiver/udpreceiver.pri)
#include(../../../../shared_classes/qtxlsx/qtxlsx.pri)

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../../../shared_classes/qtxlsx/build-qtxlsx-Release/release/ -lQtXlsx
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../../../shared_classes/qtxlsx/build-qtxlsx-Release/release/ -lQtXlsx
else:unix: LIBS += -L$$OUT_PWD/../../../shared_classes/qtxlsx/build-qtxlsx-Release/ -lQtXlsx

INCLUDEPATH += $$PWD/../../../../../shared_classes/qtxlsx
DEPENDPATH += $$PWD/../../../../../shared_classes/qtxlsx

CONFIG(release, debug|release){BUILD_TYPE=release}
CONFIG(debug, debug|release){BUILD_TYPE=debug}

copydata.commands = $(COPY_FILE) \"$$shell_path($$clean_path($$OUT_PWD/../../../shared_classes/qtxlsx/build-qtxlsx-Release/$$BUILD_TYPE/QtXlsx.dll))\" \"$$shell_path($$OUT_PWD/$$BUILD_TYPE)\"
first.depends = $(first) copydata
export(first.depends)
export(copydata.commands)
QMAKE_EXTRA_TARGETS += first copydata


DEFINES += DEBUG_NAME=\\\"kanbanApp\\\"
DEFINES += APP_NAME='\\"KANBAN_BOARD\\"'
DEFINES += BUILD_PATH='\"$${OUT_PWD}\"'
DEFINES += APP_OPTION_WATHCDOG='\\"watchdog\\"'
DEFINES += APP_OPTION_FORCE='\\"force\\"'
DEFINES += APP_VER='\\"1.0\\"'
DEFINES += KANBAN_COUNT='5'
#PLC UDP connection properties
DEFINES += UDP_PORT='2000'
DEFINES += UDP_PLC_HOST='\\"10.208.105.174\\"'
#PLC S7 connection properties
#DEFINES += LOCAL_ID='2'
DEFINES += LOCAL_IP='\\"192.168.0.11\\"'
DEFINES += PARTNER_IP='\\"192.168.0.12\\"'
DEFINES += LOCAL_TASP='\\"1902\\"'
DEFINES += PARTNER_TASP='\\"1002\\"'

CONFIG  += c++17

QT      += core gui network widgets concurrent

SOURCES += \
    kanbanApp.cpp \
    main.cpp

RESOURCES += \
    kanban_board.qml \
    kanban_board.qrc \
    fonts/fontello.ttf

TRANSLATIONS += \
   translations/qt_ru.qm

#target.path = $${OUT_PWD}/release
#INSTALLS += target

HEADERS += \
    kanbanApp.h
