#include "calcengine.h"

#include <math.h>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QStandardItemModel>
#include <QStandardItem>

#include <QCoreApplication>
#include <QDebug>
#include <QObject>
#include <QSignalBlocker>
#include <QtMath>

//DataBase=====================*******==========================================*******=====================
void CalcEngine::connectPPZUDB()
{
  auto PPZUconnect = QSqlDatabase::addDatabase("QSQLITE");

  PPZUconnect.setDatabaseName("ppzudb.sqlite");

  if(!PPZUconnect.open())  qDebug()<<PPZUconnect.lastError().text();
   else qDebug()<< "PPZU connected";
}
//=====================*******==========================================*******=====================
void CalcEngine::setupPPZUDB()
{
  QSqlQuery query;

  query.prepare("CREATE TABLE pmemory(ceil INTEGER, value INTEGER DEFAULT 0, rwcikl INTEGER DEFAULT 0)");


  if(!query.exec())
  {
   qDebug()<<query.lastError().text();
   return;
  }
  else qDebug()<< "table pmemory created";


  for(int i=0; i<1024; i++)
    {
       this->writePPZUDB(i, i);
    }


}
//=====================*******==========================================*******=====================
void CalcEngine::writePPZUDB(qint32 ceil, qint32 value)
{
  QSqlQuery query;

  query.prepare("INSERT INTO pmemory(ceil, value, rwcikl) VALUES(:ceil, :value, :rwcikl)");
  query.bindValue(":ceil", ceil);
  query.bindValue(":value", value);
  query.bindValue(":rwcikl", 3000);

  if(!query.exec())
  {
   qDebug()<<query.lastError().text();
   return;
  }
  else qDebug()<< "ceil writed";

}
//=====================*******==========================================*******=====================
void CalcEngine::updatePPZUDB(qint32 uceil, qint32 uvalue)
{
  QSqlQuery query;

  query.prepare("UPDATE pmemory SET value = ? WHERE ceil = ?");
  query.bindValue( 0, uvalue);
  query.bindValue( 1, uceil);

  if(!query.exec())
  {
   qDebug()<<query.lastError().text();
   return;
  }
  else qDebug()<< "ceil "<< uceil <<" updated";

}
//=====================*******==========================================*******=====================
int CalcEngine::readPPZUDB(int rceil)
{
  QSqlQuery query;

  query.prepare("SELECT value FROM pmemory WHERE ceil = ?");
  query.bindValue( 0, rceil);


  if(!query.exec())
  {
   qDebug()<<query.lastError().text();
   return 0;
  }
  else
   {
    query.first();
    qDebug()<< "ceil "<< rceil <<"read"<< query.value(0).toString();

    return query.value(0).toInt();
   }

}
//=====================*******==========================================*******=====================
CalcEngine::CalcEngine(QObject *parent) : QObject(parent)
{

      RX=0;

      qDebug()<<"CalcEngine create";

//=====================*******=====================
      qDebug() << QSqlDatabase::QSqlDatabase::drivers();

      this->connectPPZUDB();

}
//=====================*******==========================================*******=====================
CalcEngine::~CalcEngine()
{

  qDebug()<<"CalcEngine destroy";

}
//=====================*******==========================================*******=====================
void CalcEngine::AddDigit(int d)
{

    if (Point_flag==1 && isPoint_flag==0 && Current_Value.length()>1)
     {Current_Value = Current_Value + ".";
      isPoint_flag = 1;


     }

    Current_Value = Current_Value + QString::number(d);

}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_1()
{
    qDebug()<<"Button 1 pressed";

    AddDigit(1);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_2()
{
    qDebug()<<"Button 2 pressed";

    AddDigit(2);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_3()
{
    qDebug()<<"Button 3 pressed";

    AddDigit(3);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_4()
{
    qDebug()<<"Button 4 pressed";

    AddDigit(4);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_5()
{
    qDebug()<<"Button 5 pressed";

    AddDigit(5);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_6()
{
    qDebug()<<"Button 6 pressed";

    AddDigit(6);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_7()
{
    qDebug()<<"Button 7 pressed";

    AddDigit(7);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_8()
{
    qDebug()<<"Button 8 pressed";

    AddDigit(8);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_9()
{
    qDebug()<<"Button 9 pressed";

    AddDigit(9);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_B_10()
{
    qDebug()<<"Button 0 pressed";

    AddDigit(0);
    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_enter()
{
    qDebug()<<"Button enter pressed";

 /*   RT = RZ;  RT_E = RZ_E;
    RZ = RY;  RZ_E = RY_E;
    RY = RX;  RY_E = RX_E;
    RX = 0;   RX_E = 0; */

    Enter_Value = Current_Value;
    Current_Value = "";


    Point_flag = 0;
    isPoint_flag = 0;

}
//=====================*******==========================================*******=====================
void CalcEngine::slot_swap()
{
    qDebug()<<"Button swap pressed";

  /*    quint64  tmp = 0;  quint16 tmp_E = 0;

    tmp = RY;  tmp_E = RY_E;
    RY = RX;  RY_E = RX_E;
    RX = tmp;  RX_E = tmp_E;
*/
   QString tmp = Current_Value;
   Current_Value = Enter_Value;
   Enter_Value = tmp;


}
//=====================*******==========================================*******=====================
void CalcEngine::slot_sign()
{
    qDebug()<<"Button sign pressed";

   // RX = -RX;

   if (Current_Value[0] != "-" && Current_Value.length()>1)   Current_Value = "-" + Current_Value;

   else if (Current_Value[0] == "-") Current_Value.remove(0, 1);

}
//=====================*******==========================================*******=====================
void CalcEngine::slot_add()
{
    qDebug()<<"Button addition pressed";

   //quint64  tmpRX = 0;  quint16 tmpRX_E = 0;
   // quint64  tmpRY = 0;  quint16 tmpRY_E = 0;


 //  if (RX_E >= RY_E) {RY = RY * pow(10, RX_E - RY_E); RY_E = RX_E;}
 //   else {RX = RX * pow(10, RY_E - RX_E); RX_E = RY_E;}


  if (Current_Value != "" && Enter_Value != ""){

    Current_Value =   QString::number(Enter_Value.toDouble() + Current_Value.toDouble());

   }

    emit signal_updateISD();
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_RX_M()
{
    qDebug()<<"Button X->П pressed";
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_btn_M_RX()
{
    qDebug()<<"Button П->X pressed";
}
//=====================*******==========================================*******=====================
void CalcEngine::slot_clear()
{

     qDebug()<<"Button clear pressed";

  /*  RX = 0; RX_E = 0;
    RY = 0; RY_E = 0;
    RZ = 0;  RZ_E = 0;
    RT = 0;  RT_E = 0;*/

    Current_Value = "";
    Enter_Value = "";


    Point_flag = 0;
    isPoint_flag = 0;
    Func_flag = 0;

    emit signal_updateISD();

}
//=====================*******==========================================*******=====================







//=====================*******==========================================*******=====================

double CalcEngine::GetRX() {

     //return RX / pow(10, RX_E);

     // return dRX;

}
//=====================*******=====================
void CalcEngine::DelDigit()
{
  //  RX = RX / 10; if(RX_E > 0) RX_E--;

  //  dRX = dRX / 10;
}
//=====================*******=====================



//=====================*******=====================
void CalcEngine::slot_btn_F()
{
     qDebug()<<"Button F pressed";

     Func_flag = 1;

     emit signal_updateISD();
}
//=====================*******=====================
void CalcEngine::slot_sub()
{
    qDebug()<<"Button subtraction pressed";

   if (Current_Value != ""){

     if (Func_flag == 0 && Enter_Value != "")  Current_Value =   QString::number(Enter_Value.toDouble() - Current_Value.toDouble());

     if (Func_flag == 1 && (QString::number(Current_Value.toDouble()) > 0) ){
       Current_Value =   QString::number( qSqrt( Current_Value.toDouble()) );
       Func_flag = 0;
     }

   }

    emit signal_updateISD();
}
//=====================*******=====================
void CalcEngine::slot_mul()
{
    qDebug()<<"Button multiply pressed";

   if (Func_flag == 0 && Current_Value != "" && Enter_Value != "")  Current_Value =   QString::number(Enter_Value.toDouble() * Current_Value.toDouble());

   if (Func_flag == 1 && Current_Value != "")  {
      Current_Value =   QString::number(Current_Value.toDouble() * Current_Value.toDouble());
      Func_flag = 0;
   }

    emit signal_updateISD();
}
//=====================*******=====================
void CalcEngine::slot_div()
{
    qDebug()<<"Button division pressed";

   if (Current_Value != "0" && Current_Value != "" ){

   if (Func_flag == 0 && Enter_Value != "")  Current_Value =   QString::number(Enter_Value.toDouble() / Current_Value.toDouble());
    else if (Func_flag == 1){
      Current_Value =   QString::number(1 / Current_Value.toDouble());
      Func_flag = 0;
   }

   }

    emit signal_updateISD();
}
//=====================*******=====================
void CalcEngine::slot_point()
{
    qDebug()<<"Button point pressed";

    Point_flag = 1;

    emit signal_updateISD();
    }
//=====================*******=====================
//=====================*******=====================
QString CPrint(){

return "CalcEngine";
}
//=====================*******=====================
