#pragma once

#include <QObject>
#include "packageItem.h"
#include "utils/singleton.hpp"

class CrpPackageHelper : QObject
{
    Q_OBJECT
public:
    explicit CrpPackageHelper(QObject *parent);
    
public slots:
    void handleTasks(const QList<PackageItem *> items);

private:
    void doPack(const PackageItem *item);

signals:
    void packStart(const PackageItem *item);
    void packEnd(const PackageItem *item);
    void packError(const PackageItem *item);
    void tasksFinished();
    void tasksError();
private:
    QList<PackageItem *> unHandleTasks;
};

class CrpController : public QObject
{
    Q_OBJECT
    SINGLETON(CrpController)
public:
    bool pushTasks(QList<PackageItem *>);
};
