#include <LiquidCrystal.h>
char mtlb_data; //MATLAB Data 
int LED1 = A2;
int IR1 = 2;
int LED2 = A3;
int IR2 = 3;
int LED3 = A4;
int IR3 = 4;
int LED4 = A5;
int IR4 =  5;
int sensorOut[]={HIGH,HIGH,HIGH,HIGH};
int check0 = HIGH;
int check1 = HIGH;
int check2 = HIGH;
int check3 = HIGH;
int currentSlot=1;
int LED;
LiquidCrystal lcd(13, 12, 11, 10, 9, 8);

//syntax :- lcd(RS,Enable,D4,D5,D6,D7);
void setup() { 
pinMode(LED1,OUTPUT);
pinMode(IR1,INPUT);
pinMode(LED2,OUTPUT);
pinMode(IR2,INPUT);
pinMode(LED3,OUTPUT);
pinMode(IR3,INPUT);
pinMode(LED4,OUTPUT);
pinMode(IR4,INPUT);
lcd.begin(16,2); 
lcd.blink(); 
Serial.begin(115200);
lcd.print("1=open  2=open");
lcd.setCursor(0,1);
lcd.print("3=open  4=open");
digitalWrite(LED1, HIGH);
digitalWrite(LED2, HIGH);
digitalWrite(LED3, HIGH);
digitalWrite(LED4, HIGH);
}
void ChangeLCD(bool occupied,int currentSlot)
{
  if(occupied==true){
    ChangeLCD(currentSlot);
    lcd.print("close");
    Serial.println("clos"+String(currentSlot));
    }
  else{
    ChangeLCD(currentSlot);
    lcd.print("open ");
    Serial.println("open"+String(currentSlot));
    }

}

void ChangeLCD(int currentSlot)
{
 switch (currentSlot)
 {
  case 1:
          lcd.setCursor(2,0);
          break;
  case 2:
          lcd.setCursor(10,0);
          break;
  case 3:
          lcd.setCursor(2,1);
          break;
  case 4:
          lcd.setCursor(10,1);
          break;
  default:
          break;
 }
  
}
void loop() { 

 switch (currentSlot)
 {
  case 1:
          sensorOut[0] = digitalRead(IR1);
          LED = LED1;
          break;
  case 2:
          sensorOut[1]= digitalRead(IR2);
          LED = LED2;
          break;
  case 3:
          sensorOut[2] = digitalRead(IR3);
          LED = LED3;
          break;
  case 4:
          sensorOut[3] = digitalRead(IR4);
          LED = LED4;
          break;
  default:
          break;
 }

 if(sensorOut[0] != check0 ||sensorOut[1]!=check1||sensorOut[2]!=check2||sensorOut[3]!=check3){
  if (sensorOut[currentSlot-1]==LOW)
  {
    digitalWrite(LED, LOW);

      ChangeLCD(true,currentSlot);
    
   
  }

  else
  {
    digitalWrite(LED, HIGH);
   
      ChangeLCD(false,currentSlot);
    
  
  }
 }


  
  if(currentSlot==4){
    currentSlot=1;
    }
    else{
    currentSlot++;
      }
check0=sensorOut[0];
 check1=sensorOut[1];
 check2=sensorOut[2];
 check3=sensorOut[3];
delay(1500);
}
