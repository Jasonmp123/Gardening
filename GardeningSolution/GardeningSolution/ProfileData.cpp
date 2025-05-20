#include "ProfileData.h"

#include "ProfileData.h"
#include <QStandardPaths>
#include <QDir>

ProfileData::ProfileData(const QString& username)
    : m_username(username),
    m_group(QString("User/%1").arg(username))
{
    QString configDir = QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation);
    QDir().mkpath(configDir);  // Ensure the directory exists
    m_configPath = configDir + "/profiles.ini";

    initSettings();
}

void ProfileData::initSettings() {
    m_settings = new QSettings(m_configPath, QSettings::IniFormat);
}

void ProfileData::setName(const QString& name) {
    m_settings->beginGroup(m_group);
    m_settings->setValue("name", name);
    m_settings->endGroup();
}

void ProfileData::setAge(int age) {
    m_settings->beginGroup(m_group);
    m_settings->setValue("age", age);
    m_settings->endGroup();
}

void ProfileData::setPreference(const QString& key, const QString& value) {
    m_settings->beginGroup(m_group);
    m_settings->setValue(key, value);
    m_settings->endGroup();
}

QString ProfileData::getName() const {
    m_settings->beginGroup(m_group);
    QString name = m_settings->value("name", "").toString();
    m_settings->endGroup();
    return name;
}

int ProfileData::getAge() const {
    m_settings->beginGroup(m_group);
    int age = m_settings->value("age", 0).toInt();
    m_settings->endGroup();
    return age;
}

QString ProfileData::getPreference(const QString& key) const {
    m_settings->beginGroup(m_group);
    QString value = m_settings->value(key, "").toString();
    m_settings->endGroup();
    return value;
}

void ProfileData::setEmail(const QString& email) {
    m_settings->beginGroup(m_group);
    m_settings->setValue("email", email);
    m_settings->endGroup();
    m_settings->sync();
}

void ProfileData::setLocation(const QString& location) {
    m_settings->beginGroup(m_group);
    m_settings->setValue("location", location);
    m_settings->endGroup();
    m_settings->sync();
}

void ProfileData::setDateTime(const QString& date, const QString& time) {
    m_settings->beginGroup(m_group);
    m_settings->setValue("date", date);
    m_settings->setValue("time", time);
    m_settings->endGroup();
    m_settings->sync();
}

void ProfileData::save() {
    m_settings->sync();
}

void ProfileData::load() {
    // Nothing needed unless you use explicit deserialization
}