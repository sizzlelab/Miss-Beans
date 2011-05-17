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

#ifndef XMPPCORE_H
#define XMPPCORE_H

#include <QObject>

#include "QXmppClient.h"
#include "QXmppMessage.h"

// Is abstraction of the real XMPP implementation and the implementation used in classes

class XMPPCore : public QXmppClient
{
    Q_OBJECT
private:
    QXmppClient client;
public:
    XMPPCore(QObject *p = 0);
private slots:
    void clientSendXMPP(QXmppMessage &m);
    void clientReviceXMPP(const QXmppMessage &m);
public slots:
    void connectXMPP(const QString &server, const QString &username, const QString &domain, const QString &password);
    void sendXMPP(QString &reciver, QString &message);
signals:
    void reciveXMPP(QString &sender, QString &message);
};

#endif // XMPPCORE_H
