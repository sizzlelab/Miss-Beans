#-------------------------------------------------
#
# Project created by QtCreator 2010-08-16T09:24:22
#
#-------------------------------------------------

QT       += core gui declarative mobility

## We need network
equals( QT_MAJOR_VERSION, 4 ) : greaterThan(QT_MINOR_VERSION, 6) {
     QT+=network
     #DEFINES += USE_BEARER_IN_QT_NETWORK
} else {
     CONFIG+=mobility
     MOBILITY+=bearer
}

## MOBILITY += bearer

TARGET = MissBeans
TEMPLATE = app

## qxmpp

INCLUDEPATH += ../qxmpp/src

QT += network xml

CONFIG += console debug_and_release

QXMPP_LIB = qxmpp_d
QXMPP_DIR = ../qxmpp/lib/

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

## Symbian spesific
LIBS += -lesock
}

