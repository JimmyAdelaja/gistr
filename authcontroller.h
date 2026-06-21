#ifndef AUTHCONTROLLER_H
#define AUTHCONTROLLER_H

#include <QObject>
#include <QString>
#include <QDebug>

class AuthController : public QObject
{
    Q_OBJECT
public:
    explicit AuthController(QObject *parent = nullptr) : QObject(parent) {}

    // Q_INVOKABLE makes this method visible to the QML engine
    Q_INVOKABLE void login(const QString &username, const QString &password) {
        qDebug() << "C++ Backend received login attempt!";
        qDebug() << "Username:" << username;
        // In reality, do not print passwords to debug logs!

        // Execute your business logic here (e.g., database lookup, API call)
        if (username == "admin" && password == "secret") {
            emit loginSuccess();
        } else {
            emit loginFailure("Invalid credentials");
        }
    }

signals:
    void loginSuccess();
    void loginFailure(const QString &errorReason);
};

#endif // AUTHCONTROLLER_H
