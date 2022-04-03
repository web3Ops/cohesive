#ifndef SOLANA_GUI_EDIT_H
#define SOLANA_GUI_EDIT_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Edit : public QObject {
    Q_OBJECT
    Q_PROPERTY(int copy READ copy CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void copy() const;
};

#endif //SOLANA_GUI_EDIT_H
