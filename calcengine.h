#ifndef CALCENGINE_H
#define CALCENGINE_H

#include <QObject>
#include <QDebug>

//=====================*******==========================================*******=====================
class CalcEngine : public QObject
{
    Q_OBJECT

public:
    explicit CalcEngine(QObject *parent = nullptr);

            ~CalcEngine();

   void connectPPZUDB();
   void setupPPZUDB();
   void writePPZUDB(qint32 ceil, qint32 value);
   void updatePPZUDB(qint32 uceil, qint32 uvalue);
   int readPPZUDB(int ceil);


   void AddDigit(int d);

   void DelDigit();
   double GetRX();

   QString CPrint();

//=====================*******=====================
signals:
    void signal_updateISD();


//=====================*******=====================
public slots:


void slot_btn_F();
void slot_btn_RX_M();
void slot_btn_M_RX();


void slot_btn_B_1();
void slot_btn_B_2();
void slot_btn_B_3();
void slot_btn_B_4();
void slot_btn_B_5();
void slot_btn_B_6();
void slot_btn_B_7();
void slot_btn_B_8();
void slot_btn_B_9();
void slot_btn_B_10();//0


void slot_enter();
void slot_swap();
void slot_sign();

void slot_add();
void slot_sub();
void slot_mul();
void slot_div();

void slot_point();
void slot_clear();

//=====================*******==========================================*******=====================
  void buttonClic(QString button)
    {
        qDebug() << "buttonClic" << button;

        if (button == "btn_A_1") slot_btn_F();

        if (button == "btn_B_1") slot_btn_B_1();
        if (button == "btn_B_2") slot_btn_B_2();
        if (button == "btn_B_3") slot_btn_B_3();
        if (button == "btn_B_4") slot_btn_B_4();
        if (button == "btn_B_5") slot_btn_B_5();
        if (button == "btn_B_6") slot_btn_B_6();
        if (button == "btn_B_7") slot_btn_B_7();
        if (button == "btn_B_8") slot_btn_B_8();
        if (button == "btn_B_9") slot_btn_B_9();
        if (button == "btn_B_10") slot_btn_B_10();

        if (button == "btn_B_11") slot_point();
        if (button == "btn_B_12") slot_sign();
        if (button == "btn_B_13") slot_sub();
        if (button == "btn_B_14") slot_add();
        if (button == "btn_B_15") slot_swap();

        if (button == "btn_B_17") slot_div();
        if (button == "btn_B_18") slot_mul();
        if (button == "btn_B_19") slot_enter();
        if (button == "btn_B_20") slot_clear();

    }
//=====================*******=====================
 QString isdText()
    {
       // return  QString::number(dRX);

          return Current_Value;
    }
//=====================*******=====================
  void slotPrint()
    {
        qDebug()<<"CalcEngine";
    }
//=====================*******==========================================*******=====================
private:

   qint64  RX = 0;  qint16 RX_E = 0;
   qint64  RY = 0;  qint16 RY_E = 0;
   qint64  RZ = 0;  qint16 RZ_E = 0;
   qint64  RT = 0;  qint16 RT_E = 0;

   QString  Current_Value = "";
   QString  Enter_Value = "";


   double  dRX = 0;
   double  dRY = 0;

   bool Point_flag = 0;
   bool isPoint_flag = 0;
   bool Func_flag = 0;

   bool Calc_flag = 0;

   bool Memory_flag = 0;
   bool vmemory_flag = 0;

 //  quint8  R1 = 0;

};
//=====================*******==========================================*******=====================
#endif // CALCENGINE_H
