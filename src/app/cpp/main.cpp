#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "authcontroller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    AuthController authController;
    engine.rootContext()->setContextProperty("authCtrl", &authController);

   const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.loadFromModule("gistr", "Main");

    return app.exec();
}
