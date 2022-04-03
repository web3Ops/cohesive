#ifndef SOLANA_GUI_TOOLS_H
#define SOLANA_GUI_TOOLS_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Tools : public QObject {
Q_OBJECT
    Q_PROPERTY(int explorer READ explorer CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void explorer() const;
};

#endif //SOLANA_GUI_TOOLS_H
