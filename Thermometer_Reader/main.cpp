#include "mainwindow.h"
#include <dataparser.h>

#include <QApplication>
#include <Windows.h>
#include <QWidget>
#include <QStyle>
#include <QDesktopWidget>
#include<QDebug>




int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    MainWindow w;
    DataParser *parseData = new DataParser ;
    w.setDp(parseData);

    w.setWindowFlags(Qt::Window | Qt::FramelessWindowHint /*| Qt::WindowStaysOnTopHint*/ );

    QRect screenGeometry = QApplication::desktop()->screenGeometry(); // center of screen
    int x = (screenGeometry.width()-w.width()) / 2;
    int y = (screenGeometry.height()-w.height()) / 2;
    w.move(x, y);

    parseData->ParseCsvFile(w.GetUrlFile());
    parseData->CheckFileIsFit();

    while(parseData->getCheckData()==false && w.GetMyApp()==true)
    {
        w.ErrorMessage();
        parseData->destroyed();
        DataParser *parseData = new DataParser ;
        w.setDp(parseData);
        parseData->ParseCsvFile(w.GetUrlFile());
        parseData->CheckFileIsFit();
        if(parseData->getCheckData()==true && w.GetMyApp()==true)
        {
            //parseData->ConvertTime(3);
            break;
        }
    }

    //parseData->ConvertTime(3);

    qDebug()<<w.GetMyApp() ;

   // qDebug()<<parseData->getValueList()[1];

    if (w.GetMyApp()==false)
        return 0;

    else
        w.show();


    return a.exec();
}


