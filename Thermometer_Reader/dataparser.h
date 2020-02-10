#ifndef DATAPARSER_H
#define DATAPARSER_H
#include <QObject>
#include <QDateTime>

class DataParser: public QObject
{

public:

    DataParser();

    void ParseCsvFile(QString* url);
    QStringList ConvertTime(int numViewMode);

    QVariant getChannelList() const;
    QList<long> getTimeList() const;
    QList<QList<QVariant>>  getValueList() const ;


    double getNumberOfChannel() const;
    double getNumberOfSampling() const;

    void CheckFileIsFit () ;
    bool getCheckData() const;

private:

    double numberOfChannel =0 ;
    double numberOfSampling = 0 ;
    double numberOfPoints = 0 ;
    double numberOfTime=0 ;
    bool checkData ;


    QStringList channelList ;
    QList<long> timeList ;
    QList<QList<QVariant>> valueList;

    QStringList humanTime_HHmm ;
    QStringList humanTime_ddMM ;
    QStringList humanTime_MMyyyy ;

    //QList<QDateTime> humanTime ;

};

#endif // DATAPARSER_H
