#include "kanbanApp.h"

KanbanApp::KanbanApp(QObject *parent) : QObject(parent)
{
}

void KanbanApp::newKanbanReady(int kanbanIndex)
{
    qDebug()<<"kanbanIndex"<<kanbanIndex;
//    int index = kanbanIndex+1;
//    if (index>17) index=2;
//    kanbanProduced(index);
}
