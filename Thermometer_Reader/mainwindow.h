#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileDialog>
#include <QList>
#include "dataparser.h"

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    bool GetMyApp();
    QString* GetUrlFile();
    void setDp(DataParser* _dp);
    void ErrorMessage();
    void Xaxis();


private slots:
    void Close_Window();
    void Open_File_Ui();
    void Minimize();
    void PassNumCh( );
    void TimeScaleMode(int mode);


private:

    Ui::MainWindow *ui;
    bool myApp;
    int timeStatus=0 ;

    QString *urlFile = new QString;
    DataParser* dp ;

    bool StartUpMessage();
    void OpenFile();



};
#endif // MAINWINDOW_H