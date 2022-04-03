#ifndef SOLANA_GUI_VIEW_H
#define SOLANA_GUI_VIEW_H

#include <QObject>
#include <QtQml/qqmlregistration.h>

class View : public QObject {
    Q_OBJECT
    Q_PROPERTY(int appearance READ appearance CONSTANT)
    QML_ELEMENT
public:
    Q_INVOKABLE void appearance() const;
};

#endif //SOLANA_GUI_VIEW_H
