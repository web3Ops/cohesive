#ifndef SOLANA_GUI_WINDOW_H
#define SOLANA_GUI_WINDOW_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Window: public QObject {
Q_OBJECT
    Q_PROPERTY(int dummy READ dummy CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void dummy() const;
};

#endif //SOLANA_GUI_WINDOW_H
