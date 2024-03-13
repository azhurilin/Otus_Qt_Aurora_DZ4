#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <calcengine.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


    CalcEngine CEngine;
    engine.rootContext()->setContextObject(&CEngine);

   // QObject::connect(CEngine, SIGNAL(signal_updateISD), root, SLOT(updateICD("Ok")));


    engine.load(url);

    return app.exec();
}
