#ifndef SOLANA_GUI_WALLET_H
#define SOLANA_GUI_WALLET_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Wallet: public QObject {
Q_OBJECT
    Q_PROPERTY(int create READ create CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void create() const;
};


#endif //SOLANA_GUI_WALLET_H
