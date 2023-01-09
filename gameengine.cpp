#include "gameengine.h"
#include <QDebug>
#include <QVariant>


gameEngine::gameEngine(QObject *parent) :
QObject(parent)
{
}

//functions for placing X and O
void gameEngine::placeX(int position)
{
    board[position] = 'X';
}

void gameEngine::placeO(int position)
{
    board[position] = 'O';
}


//function for toggling between X's and O's turn
void gameEngine::toggleTurnX()
{
    if(turnX)
    {
        turnX = false;
        messageLabel->setProperty("text", QVariant("O's turn!"));
    }
    else
    {
        turnX = true;
        messageLabel->setProperty("text", QVariant("X's turn!"));

    }
}


//checks for draw or victory conditions
int gameEngine::checkForGameEnd()
{
    /*
    function returns:
    no victory nor draw - 0
    X's victory - 1x
    O's victory - 2x
    draw - 3

    */

    //rows for X
    if (board[0] == 'X' && board[1] == 'X' && board[2] == 'X') return 11;
    if (board[3] == 'X' && board[4] == 'X' && board[5] == 'X') return 12;
    if (board[6] == 'X' && board[7] == 'X' && board[8] == 'X') return 13;
    //columns for X
    if (board[0] == 'X' && board[3] == 'X' && board[6] == 'X') return 14;
    if (board[1] == 'X' && board[4] == 'X' && board[7] == 'X') return 15;
    if (board[2] == 'X' && board[5] == 'X' && board[8] == 'X') return 16;
    //diagonals for X
    if (board[0] == 'X' && board[4] == 'X' && board[8] == 'X') return 17;
    if (board[2] == 'X' && board[4] == 'X' && board[6] == 'X') return 18;


    //rows for O
    if (board[0] == 'O' && board[1] == 'O' && board[2] == 'O') return 21;
    if (board[3] == 'O' && board[4] == 'O' && board[5] == 'O') return 22;
    if (board[6] == 'O' && board[7] == 'O' && board[8] == 'O') return 23;
    //columns for O
    if (board[0] == 'O' && board[3] == 'O' && board[6] == 'O') return 24;
    if (board[1] == 'O' && board[4] == 'O' && board[7] == 'O') return 25;
    if (board[2] == 'O' && board[5] == 'O' && board[8] == 'O') return 26;
    //diagonals for O
    if (board[0] == 'O' && board[4] == 'O' && board[8] == 'O') return 27;
    if (board[2] == 'O' && board[4] == 'O' && board[6] == 'O') return 28;

    for(int x = 0; x < 9; x++)
        if (board[x] == '0') return 0;
    return 3;
}


//process result of checking victory conditions
void gameEngine::processGameEnd(int result)
{
    if (result > 10 && result < 20)
    {
        messageLabel->setProperty("text", QVariant("X's won!\nClick anywhere to play again"));
        enableCrossingLine(result);
        scoreX++;
        scoreLabel->setProperty("scoreX", scoreX);
        generalMouseArea->setProperty("enabled", true);
    }
    else if (result > 20)
    {
        messageLabel->setProperty("text", QVariant("O's won!\nClick anywhere to play again"));
        enableCrossingLine(result);
        scoreO++;
        scoreLabel->setProperty("scoreO", scoreO);
        generalMouseArea->setProperty("enabled", true);
    }
    else if (result == 3)
    {
        messageLabel->setProperty("text", QVariant("It's a draw!\nClick anywhere to play again"));
        generalMouseArea->setProperty("enabled", true);
    }
}



//board reset, toggle player's turn
void gameEngine::prepareNextGame()
{
    resetBoard();
    if (didXstart)
    {
        turnX = false;
        messageLabel->setProperty("text", QVariant("O's turn!"));
        didXstart = false;
    } else {
        turnX = true;
        messageLabel->setProperty("text", QVariant("X's turn!"));
        didXstart = true;
    }
}


//function for filling board with '0's
void gameEngine::resetBoard()
{
    for (int x = 0; x < 9; x++)
    {
        board[x] = '0';
    }
}



//function for displaying crossing line
void gameEngine::enableCrossingLine(int result)
{
    switch(result)
    {
    case 11:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 0);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", -1);
        break;
    case 12:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 0);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 13:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 0);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 1);
        break;
    case 14:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 90);
        crossingLine->setProperty("offsetX", -1);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 15:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 90);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 16:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 90);
        crossingLine->setProperty("offsetX", 1);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 17:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 45);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 18:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 135);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 21:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 0);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", -1);
        break;
    case 22:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 0);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 23:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 0);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 1);
        break;
    case 24:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 90);
        crossingLine->setProperty("offsetX", -1);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 25:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 90);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 26:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 90);
        crossingLine->setProperty("offsetX", 1);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 27:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 45);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    case 28:
        crossingLine->setProperty("visible", true);
        crossingLine->setProperty("angle", 135);
        crossingLine->setProperty("offsetX", 0);
        crossingLine->setProperty("offsetY", 0);
        break;
    default:
        return;
    }

}



//functions for setting QObject pointers
void gameEngine::setMessageLabel(QObject* obj)
{
  messageLabel = obj;
}

void gameEngine::setScoreLabel(QObject* obj)
{
  scoreLabel = obj;
}

void gameEngine::setCrossingLine(QObject* obj)
{
  crossingLine = obj;
}
void gameEngine::setGeneralMouseArea(QObject* obj)
{
  generalMouseArea = obj;
}


/*
void gameEngine::printBoard()
{
    qDebug() << board[0] << board[1] << board[2] << '\n' << board[3] << board[4] << board[5] << '\n' << board[6] << board[7] << board[8];
}
*/
