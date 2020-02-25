#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <qquickitem.h>

#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtCharts/QDateTimeAxis>
#include <QtCharts/QChartView>
#include <QtCharts/QValueAxis>
#include <QtGui/QFontDatabase>
#include <QtCore/QDateTime>
#include <QtCharts/QLineSeries>
#include <QtQuick/QQuickImageProvider>
#include <QDebug>
#include <QMessageBox>
#include <QCoreApplication>
#include <fstream>
#include <iostream>
#include <QMetaObject>

QT_CHARTS_USE_NAMESPACE


MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    if( MainWindow::StartUpMessage()==false)
    {
        qDebug()<<myApp ;
        QCoreApplication::exit();
    }

    else
    {
        ui->setupUi(this);
        ui->quickWidget->setSource(QUrl("qrc:/Qml/main_Ui.qml"));
        ui->quickWidget->show();

        //     Signal and Slot

        connect(ui->quickWidget->rootObject(),SIGNAL(open()),
                this,SLOT(Open_File_Ui()));

        connect(ui->quickWidget->rootObject(),SIGNAL(close_mainwindow()),
                this,SLOT(Close_Window()));

        connect(ui->quickWidget->rootObject(),SIGNAL(channel_selected(int)),
                this,SLOT(ChannelCheckbox(int)));

        connect(ui->quickWidget->rootObject(),SIGNAL(minimize_mainwindow()),
                this,SLOT(Minimize()));

        connect(ui->quickWidget->rootObject(),SIGNAL(viewMode(int)),
                this,SLOT(TimeScaleMode(int)));


//        for (int i = 0; i < 10; ++i)
//        {
//            QMetaObject::invokeMethod(ui->quickWidget->rootObject(), "set_channel_data",
//                                      Q_ARG(QVariant,i),
//                                      Q_ARG(QVariant,Yaxis(i)));

//        }

    }
}

bool MainWindow::StartUpMessage()
{
    int status = QMessageBox::information(this, tr("Thermometer Reader"),
                                          tr("Please Open Device Report File"),
                                          QMessageBox::Ok| QMessageBox::Cancel);

    switch (status) {
    case QMessageBox::Ok:
    {
        OpenFile();
        return true;

    }
    case QMessageBox::Cancel:
    {
        myApp=false ;
        return false;

    }
    default:
    {
        OpenFile();
        return true ;
    }
    }
}

MainWindow::~MainWindow()
{
    delete ui;
}

bool MainWindow::GetMyApp()
{
    return myApp;
}

QString* MainWindow::GetUrlFile()
{
    return urlFile ;
}

void MainWindow::Close_Window() //signal-slot-Ui
{
    close();
}

void MainWindow::Open_File_Ui() //signal-slot-Ui
{
    urlFile->clear();

    *urlFile =  QFileDialog::getOpenFileName(this,
                                             tr("Open csv File"),"", tr("CSV Files (*.csv)"));
    QFileDialog dialog(this);
    dialog.setNameFilter("*.csv");
    dialog.setDefaultSuffix("csv");
    dialog.setViewMode(QFileDialog::Detail);

    if(!urlFile->isEmpty() && !urlFile->isNull())
    {
        myApp=true ;
    }
    else
    {
        myApp=false ;
    }

}

void MainWindow::Minimize()//Ui
{
    QWidget::setWindowState(Qt::WindowMinimized);
}

void MainWindow::OpenFile()
{
    urlFile->clear();

    qDebug()<<urlFile ;
    *urlFile =  QFileDialog::getOpenFileName(this,
                                             tr("Open csv File"),"", tr("CSV Files (*.csv)"));
    qDebug()<<urlFile ;

    QFileDialog dialog(this);
    dialog.setNameFilter("*.csv");
    dialog.setDefaultSuffix("csv");
    dialog.setViewMode(QFileDialog::Detail);


    if(!urlFile->isEmpty() && !urlFile->isNull())
    {
        myApp=true ;
    }
    else
    {
        myApp=false ;
    }
}

void MainWindow::ErrorMessage()
{
    urlFile->clear();

    int error = QMessageBox::critical(this, tr("Thermometer Reader"),
                                      tr("The file is corrupted."
                                         "Please select another file"),
                                      QMessageBox::Ok| QMessageBox::Cancel);

    switch (error) {
    case QMessageBox::Ok:
    {
        OpenFile();
        break ;

    }
    case QMessageBox::Cancel:
    {
        myApp=false ;
        break ;
    }

    }
}

void MainWindow::TimeScaleMode(int mode)//slot
{
    timeStatus = mode ;
    QMetaObject::invokeMethod(ui->quickWidget->rootObject(), "readTimeList",

                              Q_ARG(QVariant,dp->ConvertTime(timeStatus)));
}

void MainWindow::ChannelCheckbox(int num)// slot
{
    chNum = num ;

    QMetaObject::invokeMethod(ui->quickWidget->rootObject(), "readValueList",
                              Q_ARG(QVariant, this->Yaxis(chNum)));

    // QList<double> rowValues = Yaxis(chNumber,chStatus);

}

void MainWindow::PassNumCh( )//not working yet
{
    QMetaObject::invokeMethod(ui->quickWidget->rootObject(), "numberOfchannels",
                              Q_ARG(QVariant,dp->getNumberOfChannel()));
}

QList<QVariant> MainWindow::Yaxis(int chn)
{
    rowValue = dp->getValueList()[chn-1] ;

    return rowValue;

}

void MainWindow::setDp(DataParser* _dp)
{
    dp = _dp;
}


