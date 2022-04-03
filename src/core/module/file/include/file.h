#ifndef SOLANA_GUI_FILE_H
#define SOLANA_GUI_FILE_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class File : public QObject {
    Q_OBJECT
    Q_PROPERTY(int exit READ exit CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void exit() const;
};

#endif //SOLANA_GUI_FILE_H
