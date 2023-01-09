#ifndef GAMEENGINE_H
#define GAMEENGINE_H

#include <QObject>

class gameEngine : public QObject
{

    Q_OBJECT
    public:
    //pointers to QObjects to allow property modifying
    QObject* messageLabel;
    QObject* scoreLabel;
    QObject* crossingLine;
    QObject* generalMouseArea;
    //passing this class to QML
    explicit gameEngine(QObject *parent = 0);

    //variables to be read by QML
    Q_PROPERTY(bool turnX MEMBER turnX NOTIFY turnXChanged);
    Q_PROPERTY(int scoreX MEMBER scoreX NOTIFY scoreXChanged);
    Q_PROPERTY(int scoreO MEMBER scoreO NOTIFY scoreOChanged);

    //functions to be called by QML
    Q_INVOKABLE void placeX(int position);
    Q_INVOKABLE void placeO(int position);
    Q_INVOKABLE void toggleTurnX();
    Q_INVOKABLE int  checkForGameEnd();
    Q_INVOKABLE void processGameEnd(int result);
    Q_INVOKABLE void prepareNextGame();

    //setting pointers to QObjects
    Q_INVOKABLE void setMessageLabel(QObject* obj);
    Q_INVOKABLE void setScoreLabel(QObject* obj);
    Q_INVOKABLE void setCrossingLine(QObject* obj);
    Q_INVOKABLE void setGeneralMouseArea(QObject* obj);

    void resetBoard();
    void enableCrossingLine(int result);
    //Q_INVOKABLE void printBoard();                    //for debugging purposes


    signals:
    void turnXChanged();
    void scoreOChanged();
    void scoreXChanged();

    public slots:

    private:
    char board[9] = {'0', '0', '0', '0', '0', '0', '0', '0', '0'};
    bool turnX = true;
    bool didXstart = true;
    int scoreX = 0;
    int scoreO = 0;

    };


#endif // GAMEENGINE_H
