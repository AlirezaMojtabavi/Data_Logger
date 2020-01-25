QT       += core gui quickwidgets quick multimedia

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
QT += charts
CONFIG += c++11
CONFIG+=qml_debug
DEFINES += QT_QML_DEBUG_NO_WARNING

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS
LIBS += -luser32

#-qmljsdebugger=port:<port_from>[,port_to][,host:<ip address>][,block][,file:<local socket>][,services:<comma-separated list of services to enable>]

RC_ICONS = Temp_Icon.ico

Q_DECLARE_METATYPE

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    dataparser.cpp \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    dataparser.h \
    mainwindow.h

FORMS += \
    mainwindow.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RESOURCES += \
    Resource.qrc
