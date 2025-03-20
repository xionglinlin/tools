#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath("/home/zhangkun/Dev/tools/build/src/plugins/SSTools");
    engine.loadFromModule("SSTools", "Main");

    return app.exec();
}