#ifndef SOLANA_GUI_RUN_H
#define SOLANA_GUI_RUN_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Run : public QObject {
Q_OBJECT
    Q_PROPERTY(int run READ run CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void run() const;
};

#endif //SOLANA_GUI_RUN_H
