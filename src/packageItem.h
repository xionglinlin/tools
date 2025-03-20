#pragma once

#include <QObject>

enum PgkVerType{
    VT_AUTO,    // crp 自动
    VT_CUSTOM   // 自定义版本
};

// a task item
class PackageItem : public QObject
{
    Q_OBJECT
public:
    

private:
    QString m_name;
    QString m_version;
    PgkVerType m_verType;
    QString m_branchName;
    QStringList m_archs;
    QString m_topCommitMsg;
    QString m_topCommitHash;

    QStringList m_supportArchs;
    QStringList m_supportVersions;
    QStringList m_supportBranchs;
};