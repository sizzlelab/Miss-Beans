#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include <QDebug>
#include "xmpp.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    qmlRegisterType<Xmpp>("XMPP", 1,0, "XMPP");
    ui->qml->setSource( QUrl("qrc:qml/main") );
    // ui->qml->setSource( QUrl("/Users/matnel/QtWorkspace/BeanQt2/qml/Bug.qml") );
    ui->qml->setFixedHeight(640);
    ui->qml->setFixedWidth(360);
    ui->centralWidget->setMinimumHeight( ui->qml->height() );
    ui->centralWidget->setMaximumWidth( ui->qml->width() );
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::changeEvent(QEvent *e)
{
    QMainWindow::changeEvent(e);
    switch (e->type()) {
    case QEvent::LanguageChange:
        ui->retranslateUi(this);
        break;
    default:
        break;
    }
}
