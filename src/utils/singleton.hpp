#pragma once

#include <QMutex>

#define SINGLETON(className) \
public: \
    static className* instance(QObject *parent = nullptr) { \
        static QMutex mutex; \
        QMutexLocker locker(&mutex); \
        static className* instance = nullptr; \
        if (instance == nullptr) { \
            instance = new className(parent); \
    } \
        return instance; \
} \
private: \
explicit className(QObject *parent = nullptr);
