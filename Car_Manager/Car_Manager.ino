//Adding requied libraries
#include <Servo.h>
#include <NewPing.h>
#include <Wire.h>

#define fromLow 900
#define fromHigh 1900
#define toLow 1000
#define toHigh 2000

#define esc_pin 6
#define servo_pin 5

byte last_channel_1, last_channel_2, last_channel_3, last_channel_4, last_channel_5, last_channel_6;
int receiver_input_channel_1, receiver_input_channel_2, receiver_input_channel_3, receiver_input_channel_4, receiver_input_channel_5, receiver_input_channel_6;
int channel_1, channel_2, channel_3, channel_4, channel_5, channel_6;
int esc, servo;
unsigned long timer_channel_1, timer_channel_2, timer_channel_3, timer_channel_4, timer_channel_5, timer_channel_6;
unsigned long timer_1, timer_2, timer_3, timer_4, timer_5, timer_6, current_time;

 
void setup ()
{
  pinMode(esc_pin, OUTPUT);
  pinMode(servo_pin, OUTPUT);
  
  //Set PCIE0 to enable PCMSK2 scan.
  PCICR |= (1 << PCIE2);
  
  PCMSK2 |= (1 << PCINT16); //Set PCINT16 (Analog input A8) to trigger an interrupt on state change.
  PCMSK2 |= (1 << PCINT17); //Set PCINT17 (Analog input A9) to trigger an interrupt on state change.
  PCMSK2 |= (1 << PCINT18); //Set PCINT18 (Analog input A10) to trigger an interrupt on state change.
  PCMSK2 |= (1 << PCINT19); //Set PCINT19 (Analog input A11) to trigger an interrupt on state change.
  PCMSK2 |= (1 << PCINT20); //Set PCINT20 (Analog input A12) to trigger an interrupt on state change.
  PCMSK2 |= (1 << PCINT21); //Set PCINT21 (Analog input A13) to trigger an interrupt on state change.

  Serial.begin(115200);
}

void loop ()
{
  channel_1 = map(receiver_input_channel_1, fromLow, fromHigh, toLow, toHigh);
  channel_2 = map(receiver_input_channel_2, fromLow, fromHigh, toLow, toHigh);
  channel_3 = map(receiver_input_channel_3, fromLow, fromHigh, toLow, toHigh);
  channel_4 = map(receiver_input_channel_4, fromLow, fromHigh, toLow, toHigh);
  channel_5 = map(receiver_input_channel_5, fromLow, fromHigh, toLow, toHigh);
  channel_6 = map(receiver_input_channel_6, fromLow, fromHigh, toLow, toHigh);

// debug
  Serial.print("Channel 1 = ");
  Serial.print(channel_1);
  Serial.print('\t');
  Serial.print("Channel 2 = ");
  Serial.print(channel_2);
  Serial.print('\t');
  Serial.print("Channel 3 = ");
  Serial.print(channel_3);
  Serial.print('\t');
  Serial.print("Channel 4 = ");
  Serial.print(channel_4);
  Serial.print('\t');
  Serial.print("Channel 5 = ");
  Serial.print(channel_5);
  Serial.print('\t');
  Serial.print("Channel 6 = ");
  Serial.print(channel_6);
  Serial.print('\n');

}


ISR(PCINT2_vect)
{
  current_time = micros();
  //Channel 1=========================================
  if(PINK & B00000001)
  {                                        //Is input 8 high?
  if(last_channel_1 == 0)
  {                                   //Input 8 changed from 0 to 1
    last_channel_1 = 1;                                      //Remember current input state
    timer_1 = current_time;                                  //Set timer_1 to current_time
  }
  }
  else if(last_channel_1 == 1)
  {                                //Input 8 is not high and changed from 1 to 0
    last_channel_1 = 0;                                        //Remember current input state
    receiver_input_channel_1 = current_time - timer_1;         //Channel 1 is current_time - timer_1
  }
  //Channel 2=========================================
  if(PINK & B00000010 )
  {                                       //Is input 9 high?
    if(last_channel_2 == 0)
    {                                   //Input 9 changed from 0 to 1
      last_channel_2 = 1;                                      //Remember current input state
      timer_2 = current_time;                                  //Set timer_2 to current_time
    }
  }
  else if(last_channel_2 == 1)
  {                                //Input 9 is not high and changed from 1 to 0
    last_channel_2 = 0;                                        //Remember current input state
    receiver_input_channel_2 = current_time - timer_2;         //Channel 2 is current_time - timer_2
  }
  //Channel 3=========================================
  if(PINK & B00000100 )
  {                                       //Is input 10 high?
    if(last_channel_3 == 0)
    {                                   //Input 10 changed from 0 to 1
      last_channel_3 = 1;                                      //Remember current input state
      timer_3 = current_time;                                  //Set timer_3 to current_time
    }
  }
  else if(last_channel_3 == 1)
  {                                //Input 10 is not high and changed from 1 to 0
    last_channel_3 = 0;                                        //Remember current input state
    receiver_input_channel_3 = current_time - timer_3;         //Channel 3 is current_time - timer_3

  }
  //Channel 4=========================================
  if(PINK & B00001000 )
  {                                       //Is input 11 high?
    if(last_channel_4 == 0)
    {                                   //Input 11 changed from 0 to 1
      last_channel_4 = 1;                                      //Remember current input state
      timer_4 = current_time;                                  //Set timer_4 to current_time
    }
  }
  else if(last_channel_4 == 1)
  {                                //Input 11 is not high and changed from 1 to 0
    last_channel_4 = 0;                                        //Remember current input state
    receiver_input_channel_4 = current_time - timer_4;         //Channel 4 is current_time - timer_4
  }
  //Channel 5=========================================
  if(PINK & B00010000)
  {
    if(last_channel_5 == 0)
    {
      last_channel_5 = 1;
      timer_5 = current_time;        
    }    
  }
  else if(last_channel_5 == 1)
  {
      last_channel_5 = 0;
      receiver_input_channel_5 = current_time - timer_5;
  }
  //Channel 6=========================================
  if(PINK & B00100000)
  {
    if(last_channel_6 == 0)
    {
      last_channel_6 = 1;
      timer_6 = current_time;
    }    
  }
  else if(last_channel_6 == 1)
  {
    last_channel_6 = 0;
    receiver_input_channel_6 = current_time - timer_6;    
  }
}

