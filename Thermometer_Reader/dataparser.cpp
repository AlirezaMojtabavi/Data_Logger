#include "dataparser.h"
#include <QFile>
#include <QDebug>
#include <iostream>




DataParser::DataParser()
{

}

void DataParser::ParseCsvFile(QString* url)
{
    QFile myFile(*url);
    myFile.open(QIODevice::ReadOnly);
    while (!myFile.atEnd())
    {
        QByteArray line = myFile.readLine();
        auto myLine = line.split(',');
        int lineSize = myLine.size(); // return number of every char
        numberOfChannel = (lineSize-1)/2 ; // return number of channel
        QList<double> tempListValue ;

        if(channelList.isEmpty())
        {
            for (int i = 0 ;i<numberOfChannel ;i++ )
            {
                try {
                    channelList.append(myLine[2*i]);
                    tempListValue.append(myLine[2*i+1].toDouble());
                    numberOfPoints ++ ;

                } catch (int e) {
                    std::cout << "An exception occurred. Exception Nr. " << e << '\n';
                    checkData = false ;
                }

            }
            valueList.append(tempListValue);
            timeList.append(myLine[lineSize-1].simplified().toLong()); // simplified : remove "\r\n"
            numberOfTime++ ;
            numberOfSampling++ ;
        }
        else // after first line
        {
            for (int i = 0 ;i<numberOfChannel ;i++ )
            {
                try {
                    tempListValue.append(myLine[2*i+1].toDouble());
                    numberOfPoints++ ;

                } catch (int e) {
                    std::cout << "An exception occurred. Exception Nr. " << e << '\n';
                    checkData = false ;
                }

            }
            try {
                valueList.append(tempListValue);
                timeList.append(myLine[lineSize-1].simplified().toLong());
                numberOfTime ++ ;

            } catch (int e) {
                std::cout << "An exception occurred. Exception Nr. " << e << '\n';
                checkData = false ;
            }

            numberOfSampling++ ;
        }
    }
    //qDebug()<<channelList ;
    //qDebug()<<valueList ;
    //qDebug()<<numberOfPoints ;
    // qDebug()<<numberOfSampling;
    //qDebug()<<numberOfChannel;
    //qDebug()<<timeList.size() ;


}

QStringList DataParser::ConvertTime(int numViewMode)
{
    if (humanTime_HHmm.size()!= 0 || humanTime_ddMM.size()!=0 || humanTime_MMyyyy.size()!=0){
        humanTime_HHmm.clear();
        humanTime_ddMM.clear();
        humanTime_MMyyyy.clear();
    }

    for (int i = 0  ; i<numberOfTime ;i++ )
    {
        QDateTime tempTime;
        tempTime.setTime_t(timeList[i]);

        humanTime_HHmm.append(tempTime.toString("HH:mm"));
        humanTime_ddMM.append(tempTime.toString("dd-MM"));
        humanTime_MMyyyy.append(tempTime.toString("MM-yyyy"));
    }
    switch (numViewMode) {
    case 1:
    {
        qDebug() <<humanTime_HHmm;
        return humanTime_HHmm;
    }
    case 2:
    {
        qDebug() <<humanTime_ddMM;
        return humanTime_ddMM;
    }
    case 3:
    {
        qDebug() <<humanTime_MMyyyy;
        return humanTime_MMyyyy;
    }
    }
}

QStringList DataParser::getChannelList() const
{
    return channelList;
}

QList<long> DataParser::getTimeList() const
{
    return timeList;
}

QList<QList<double>> DataParser::getValueList() const
{
    return valueList;
}

double DataParser::getNumberOfChannel() const
{
    return numberOfChannel;
}

double DataParser::getNumberOfSampling() const
{
    return numberOfSampling;
}

void DataParser::CheckFileIsFit()
{
    if(numberOfTime != numberOfPoints / numberOfChannel)
    {
        checkData = false ;

        // qDebug()<<channelList.size() ;
        // qDebug()<<valueList.size() ;
        // qDebug()<<timeList.size() ;
    }
    else
        checkData=true ;

}

bool DataParser::getCheckData() const
{
    return checkData;
}






