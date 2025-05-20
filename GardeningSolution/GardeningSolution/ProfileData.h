#pragma once
#include <QString>
#include <QSettings>

class ProfileData : public QObject {
public:
    ProfileData(const QString& username);

    void setName(const QString& name);
    void setAge(int age);
    void setPreference(const QString& key, const QString& value);

    QString getName() const;
    int getAge() const;
    QString getPreference(const QString& key) const;

    void save();
    void load();

    Q_INVOKABLE void setEmail(const QString& email);
    Q_INVOKABLE void setLocation(const QString& location);
    Q_INVOKABLE void setDateTime(const QString& date, const QString& time);

private:
    QString m_username;
    QString m_configPath;
    QString m_group;
    QSettings* m_settings;

    void initSettings();
};

