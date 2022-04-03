#ifndef SOLANA_GUI_FILE_H
#define SOLANA_GUI_FILE_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class Help : public QObject {
Q_OBJECT
    Q_PROPERTY(int answer READ about CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE int about() const;
};

#endif //SOLANA_GUI_FILE_H