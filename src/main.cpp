
#include <iostream>
#include <QApplication>

#include "mainwindow.h"

int main(int argc, char *argv[])
{
    std::cout << "App works!\n";
    QApplication app(argc, argv);
    
    MainWindow mainWin;
    mainWin.show();
    return QApplication::exec();
}
