#include "crpcontroller.h"
#include <qobject.h>

CrpPackageHelper::CrpPackageHelper(QObject *parent)
    : QObject(parent)
{

}

void CrpPackageHelper::doPack(const PackageItem *item)
{
    emit packStart(item);
    // TODO
    emit packEnd(item);
}

void CrpPackageHelper::handleTasks(const QList<PackageItem *> items)
{

}

CrpController::CrpController(QObject *parent)
{

}

bool CrpController::pushTasks(QList<PackageItem *> items)
{
    return true;
}