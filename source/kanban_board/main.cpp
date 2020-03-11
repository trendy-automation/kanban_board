#include "kanbanApp.h"
#include "message_handler.h"
#include "single_apprun.h"
//#include "watchdog.h"
#include "plc_station.h"
#include "udpreceiver.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QQmlContext>
#include <QSettings>

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QStringList args = app.arguments();
    SingleAppRun singleApp(args.contains(APP_OPTION_FORCE),&app);
    if(singleApp.isToQuit()){
        app.quit();
        return 0;
    }
    app.setOrganizationName("Faurecia");
    app.setOrganizationDomain("Dryer");
    MessageHandler *msgHandler = new MessageHandler;
    bool ok;
    QString FileName("settings.ini");
    QSettings settings(FileName, QSettings::IniFormat);
    QByteArray LocalAddress  = settings.value("LocalAddress",PARTNER_IP).toByteArray();
    QByteArray RemoteAddress = settings.value("RemoteAddress",LOCAL_IP).toByteArray();
    int LocTsap = settings.value("LocTsap",QString(PARTNER_TASP).toInt(&ok,16)).toInt();
    int RemTsap = settings.value("RemTsap",QString(LOCAL_TASP).toInt(&ok,16)).toInt();
    settings.setValue("LocalAddress", LocalAddress);
    settings.setValue("RemoteAddress", RemoteAddress);
    settings.setValue("LocTsap", LocTsap);
    settings.setValue("RemTsap", RemTsap);


    QFontDatabase::addApplicationFont(":/fonts/fontello.ttf");

    QQmlApplicationEngine engine;
    KanbanApp kanbanApp;
    Plc_station * plcPartner = new Plc_station;
    UdpReceiver * udpReceiver = new UdpReceiver;
//    QObject::connect(plcPartner, &Plc_station::dataReceived, kanbanApp, &KanbanApp::kanbanProdused,Qt::QueuedConnection);
    plcPartner->setObjectName("DP_4B45X");
    plcPartner->setIdDevice(13);
    plcPartner->StartTo(LocalAddress,RemoteAddress,static_cast<word>(LocTsap),static_cast<word>(RemTsap));
    QStringList plcStatusList;
    plcStatusList<<"stopped"<<"running and active connecting"<<"running and waiting for a connection"
                 <<"running and connected : linked"<<"sending data"<<"receiving data"
                 <<"error starting passive server";
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("isDebug", QGuiApplication::applicationDirPath().contains("build"));
    context->setContextProperty("kanbanApp", &kanbanApp);
    context->setContextProperty("plcPartner", plcPartner);
    context->setContextProperty("udpReceiver", udpReceiver);
    context->setContextProperty("kanbanCount", KANBAN_COUNT);
    engine.load(QUrl("qrc:/kanban_board.qml"));
    qDebug()<<"plcPartner status:"<<plcPartner->getStatus()<<plcStatusList.at(plcPartner->getStatus());
    emit kanbanApp.kanbanProduced(14);
    emit kanbanApp.kanbanProduced(14);
    emit kanbanApp.kanbanProduced(14);
    emit kanbanApp.kanbanProduced(13);
    emit kanbanApp.kanbanProduced(13);
    emit kanbanApp.kanbanProduced(15);
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
