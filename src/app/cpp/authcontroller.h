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


// #ifndef AUTHCONTROLLER_H
// #define AUTHCONTROLLER_H

// #include <QObject>
// #include <QString>
// #include <QDebug>
// #include <QSqlDatabase>
// #include <QSqlQuery>
// #include <QSqlError>
// #include <QStandardPaths>
// #include <QDir>

// class AuthController : public QObject
// {
//     Q_OBJECT
// public:
//     explicit AuthController(QObject *parent = nullptr) : QObject(parent) {
//         initDatabase();
//     }

//     Q_INVOKABLE void login(const QString &username, const QString &password) {
//         qDebug() << "C++ Backend validating login for:" << username;

//         QSqlQuery query;
//         // Query to check matching credentials
//         query.prepare("SELECT password FROM users WHERE username = :username");
//         query.bindValue(":username", username);

//         if (!query.exec()) {
//             qDebug() << "Database query failed:" << query.lastError().text();
//             emit loginFailure("Database tracking error occurred.");
//             return;
//         }

//         if (query.next()) {
//             QString dbPassword = query.value(0).toString();
            
//             // NOTE: For absolute security, store and compare hashed passwords (e.g., using QCryptographicHash)
//             if (dbPassword == password) {
//                 emit loginSuccess();
//             } else {
//                 emit loginFailure("Invalid credentials");
//             }
//         } else {
//             emit loginFailure("Invalid credentials");
//         }
//     }

// signals:
//     void loginSuccess();
//     void loginFailure(const QString &errorReason);

// private:
//     void initDatabase() {
//         // AppDataLocation provides write access across platform layers (Windows, Linux, macOS, iOS/Android)
//         QString dataPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
//         QDir().mkpath(dataPath);
//         QString dbPath = dataPath + "/gistr_database.sqlite";

//         QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
//         db.setDatabaseName(dbPath);

//         if (!db.open()) {
//             qDebug() << "Error: Connection to database failed:" << db.lastError().text();
//             return;
//         }
//         qDebug() << "Database successfully assigned & loaded at:" << dbPath;

//         // Initialize user schema table if it's a fresh initialization
//         QSqlQuery query;
//         QString createTable = "CREATE TABLE IF NOT EXISTS users ("
//                               "id INTEGER PRIMARY KEY AUTOINCREMENT, "
//                               "username TEXT UNIQUE, "
//                               "password TEXT)";
        
//         if (!query.exec(createTable)) {
//             qDebug() << "Failed to create core schema:" << query.lastError().text();
//         } else {
//             // Check if database needs an initial record for local testing
//             query.exec("SELECT COUNT(*) FROM users");
//             if (query.next() && query.value(0).toInt() == 0) {
//                 // Let's seed your default admin user
//                 query.prepare("INSERT INTO users (username, password) VALUES (:user, :pass)");
//                 query.bindValue(":user", "admin");
//                 query.bindValue(":pass", "secret");
//                 query.exec();
//                 qDebug() << "Seeded mock admin credentials!";
//             }
//         }
//     }
// };

// #endif // AUTHCONTROLLER_H