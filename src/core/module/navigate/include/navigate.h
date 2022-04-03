#ifndef SOLANA_GUI_NAVIGATE_H
#define SOLANA_GUI_NAVIGATE_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Navigate : public QObject {
    Q_OBJECT
    Q_PROPERTY(int back READ back CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void back() const;
};

#endif //SOLANA_GUI_NAVIGATE_H
