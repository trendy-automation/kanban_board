#ifndef KANBANAPP_H
#define KANBANAPP_H



#include <QObject>
#include <QDebug>

class KanbanApp : public QObject
{
    Q_OBJECT
public:
    explicit KanbanApp(QObject *parent = 0);
//    void setQLFilter(const QString & field, int value);
//    QVariant data(int row, int role) ;

signals:
    void kanbanProduced(int kanbanIndex);

public slots:
    void newKanbanReady(int kanbanIndex);

//private:

};

#endif // KANBANAPP_H
