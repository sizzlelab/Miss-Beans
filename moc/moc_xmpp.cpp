/****************************************************************************
** Meta object code from reading C++ file 'xmpp.h'
**
** Created: Fri 10. Sep 11:07:49 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../xmpp.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'xmpp.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Xmpp[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       3,   34, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
      19,    6,    5,    5, 0x05,

 // slots: signature, parameters, type, tag, flags
      61,   50,    5,    5, 0x0a,
      90,    5,    5,    5, 0x0a,
      98,    6,    5,    5, 0x08,

 // properties: name, type, flags
     139,  131, 0x0a095103,
     146,  131, 0x0a095103,
     155,  131, 0x0a095103,

       0        // eod
};

static const char qt_meta_stringdata_Xmpp[] = {
    "Xmpp\0\0from,message\0reciveMessage(QString,QString)\0"
    "to,message\0sendMessage(QString,QString)\0"
    "login()\0proxyRecieved(QString&,QString&)\0"
    "QString\0server\0username\0password\0"
};

const QMetaObject Xmpp::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Xmpp,
      qt_meta_data_Xmpp, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Xmpp::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Xmpp::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Xmpp::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Xmpp))
        return static_cast<void*>(const_cast< Xmpp*>(this));
    return QObject::qt_metacast(_clname);
}

int Xmpp::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: reciveMessage((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 1: sendMessage((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 2: login(); break;
        case 3: proxyRecieved((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        default: ;
        }
        _id -= 4;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = server(); break;
        case 1: *reinterpret_cast< QString*>(_v) = username(); break;
        case 2: *reinterpret_cast< QString*>(_v) = password(); break;
        }
        _id -= 3;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setServer(*reinterpret_cast< QString*>(_v)); break;
        case 1: setUsername(*reinterpret_cast< QString*>(_v)); break;
        case 2: setPassword(*reinterpret_cast< QString*>(_v)); break;
        }
        _id -= 3;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Xmpp::reciveMessage(const QString & _t1, const QString & _t2)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
