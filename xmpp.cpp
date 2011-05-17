/*
Copyright (c) 2010 Helsinki Institute of Information Technology HIIT
Matti Nelimarkka <matti.nelimarkka@hiit.fi>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#include "xmpp.h"

#include <QStringList>
#include <QDebug>

Xmpp::Xmpp(QObject *parent) : QObject(parent)
{
    this->core = new XMPPCore();
    connect( core, SIGNAL( reciveXMPP(QString&, QString&) ), this, SLOT( proxyRecieved(QString&,QString&)) );
}

void Xmpp::setServer(QString server) {
   this->x_server = server;
}

QString Xmpp::server() {
    return this->x_server;
}

void Xmpp::setUsername(QString username) {
    this->x_username = username;
}

QString Xmpp::username() {
    return this->x_username;
}

void Xmpp::setPassword(QString password) {
    this->x_password = password;
}

QString Xmpp::password() {
    return this->x_password;
}

void Xmpp::login() {
    // spilt the username
    QStringList username = x_username.split( QChar('@') );
    this->core->connectXMPP( x_server, username[0], username[1], x_password);
}

void Xmpp::sendMessage(QString to, QString message) {
    this->core->sendXMPP(to, message);
}

void Xmpp::proxyRecieved(QString &from, QString &message) {
    emit reciveMessage(from, message);
}
