#include <QtCore/QObject>
#include <QtTest>


class CoreTest : public QObject {
Q_OBJECT

private
    slots:

    void initTestCase() {
        qDebug("Called before everything else...");
    }

    void dummyTestCase() {
        QVERIFY(true); // check that a condition is satisfied
        QCOMPARE(1, 1); // compare two values
    }

    void cleanupTestCase() {
        qDebug("Called after all tests...");
    }
};

QTEST_MAIN(CoreTest)

#include "core.moc"