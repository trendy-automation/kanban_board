#include "kanbanApp.h"

KanbanApp::KanbanApp(QObject *parent) : QObject(parent)
{
    QString FileName("shopstock.ini");
    settings=new QSettings(FileName, QSettings::IniFormat);
}

void KanbanApp::newKanbanReady(int kanbanIndex)
{
    qDebug()<<"kanbanIndex"<<kanbanIndex;
//    int index = kanbanIndex+1;
//    if (index>17) index=2;
//    kanbanProduced(index);
}

void KanbanApp::setValue(const QString &key, const QVariant &value) {
    settings->setValue(key, value);
}
QVariant KanbanApp::value(const QString &key, const QVariant &defaultValue) const {
//    qDebug()<<"defaultValue"<<defaultValue;
    return settings->value(key, defaultValue);
}

//void KanbanApp::setQLFilter(const QString & field, int value){
//  QString tempString = field + QString::number(value);
//  setFilter(tempString);
//}
//QVariant KanbanApp::data(int row, int role) const {
//    QModelIndex qmi;
//    qmi = index(row, role, qmi);
//    return data(qmi, role);
//}
