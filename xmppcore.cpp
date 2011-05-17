/*
Copyright (c) 2010 Aalto University / Helsinki Institute of Information Technology HIIT

Authors:
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

#include "xmppcore.h"

#include "QXmppClient.h"
#include "QXmppMessage.h"
#include "QXmppLogger.h"

XMPPCore::XMPPCore(QObject *parent) : QXmppClient(parent)
{
    // makes life easier
    this->logger()->setLoggingType( QXmppLogger::StdoutLogging );
}

void XMPPCore::connectXMPP(const QString &server, const QString &username, const QString &domain, const QString &password)
{
    QXmppConfiguration config = QXmppConfiguration();
    config.setDomain( domain );
    config.setHost( server );
    config.setUser( username );
    config.setPassword( password );
    this->connectToServer( config );
    // this->connectToServer(server, username, password, domain);
    connect(this, SIGNAL(messageReceived(const QXmppMessage&)),SLOT(clientReviceXMPP(const QXmppMessage&)));
}

void XMPPCore::clientReviceXMPP(const QXmppMessage &m) {
    QString sender = m.from();
    QString message = m.body();
    emit reciveXMPP(sender, message);
}

void XMPPCore::clientSendXMPP(QXmppMessage &m)
{

}

void XMPPCore::sendXMPP(QString &reciver, QString &message) {
    QXmppMessage m = QXmppMessage("", reciver, message);
    this->sendPacket( m );
}
