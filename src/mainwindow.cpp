
#include <iostream>
#include <QPushButton>

#include "mainwindow.h"

MainWindow::MainWindow()
{
    setMinimumSize(600, 400);
    setWindowTitle("Cmake CI Test");
    auto train_button = new QPushButton(this);
    train_button->setText(tr("something"));
    setCentralWidget(train_button);
}

MainWindow::~MainWindow()
{

}
