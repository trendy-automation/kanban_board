#ifndef KANBANAPP_H
#define KANBANAPP_H



#include <QObject>
#include <QDebug>
#include <QSettings>

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
    void setValue(const QString &key, const QVariant &value) ;
    QVariant value(const QString &key, const QVariant &defaultValue = QString("{}")) const;

private:
    QSettings *settings;

};

#endif // KANBANAPP_H
