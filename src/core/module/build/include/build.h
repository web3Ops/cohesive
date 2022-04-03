#ifndef SOLANA_GUI_BUILD_H
#define SOLANA_GUI_BUILD_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Build : public QObject {
Q_OBJECT
    Q_PROPERTY(int deploy READ copy CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void deploy() const;
};

#endif //SOLANA_GUI_BUILD_H
