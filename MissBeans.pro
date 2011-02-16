#-------------------------------------------------
#
# Project created by QtCreator 2010-08-16T09:24:22
#
#-------------------------------------------------

QT       += core gui declarative mobility

MOBILITY += bearer

TARGET = BeanQt2
TEMPLATE = app

## qxmpp

INCLUDEPATH += ../qxmpp/source

QT += network xml

CONFIG += console debug_and_release

CONFIG(debug, debug|release) {
    QXMPP_LIB = QXmppClient_d
    QXMPP_DIR = ../qxmpp/source/debug
} else {
    QXMPP_LIB = QXmppClient
    QXMPP_DIR = ../qxmpp/source/release
}

LIBS += -L$$QXMPP_DIR -l$$QXMPP_LIB
PRE_TARGETDEPS += $${QXMPP_DIR}/lib$${QXMPP_LIB}.a

#qxmpp end

SOURCES +=\
xmppcore.cpp \
xmpp.cpp \
main.cpp\
mainwindow.cpp \


HEADERS  += \
xmppcore.h \
mainwindow.h \
xmpp.h


FORMS    += mainwindow.ui

RESOURCES += qml/qml.qrc

symbian {
    TARGET.CAPABILITY = NetworkServices
}

