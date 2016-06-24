//Adding requied libraries
#include <Servo.h>
#include <NewPing.h>
#include <Wire.h>

#define fromLow 1000
#define frommid 1400
#define fromHigh 1900

#define toLow 0
#define tomid 127
#define toHigh 254

#define esc_pin 6
#define servo_pin 5

#define low_mid 170
#define high_mid 175
#define bottom 2

#define dead_zone 178

#define esc_high 180
#define esc_mid 90
#define esc_low 0

#define servo_high 180
#define servo_mid 90
#define servo_low 0

#define sample_num 5

byte last_channel_1, last_channel_2, last_channel_3, last_channel_4, last_channel_5, last_channel_6;
int receiver_input_channel_1, receiver_input_channel_2, receiver_input_channel_3, receiver_input_channel_4, receiver_input_channel_5, receiver_input_channel_6;
int channel_1, channel_2, channel_3, channel_4, channel_5, channel_6;
int esc, servo;
unsigned long timer_channel_1, timer_channel_2, timer_channel_3, timer_channel_4, timer_channel_5, timer_channel_6;
unsigned long timer_1, timer_2, timer_3, timer_4, timer_5, timer_6, current_time;

Servo ESC;
Servo SERVO;
 
 
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

  //pin connection to servo objects
  SERVO.attach(servo_pin);
  ESC.attach(esc_pin);

  Serial.begin(115200);
}

void loop ()
{
  //Two variables to keep track of SERVO and ESC  
  int x, z;
  //map the values
  for(int i= 0; i < sample_num; i++)
  {
  	channel_1 = channel_1 + map(receiver_input_channel_1, fromLow, fromHigh, toLow, toHigh);
  	channel_2 = channel_2 + map(receiver_input_channel_2, fromLow, fromHigh, toLow, toHigh);
  	channel_3 = channel_3 + map(receiver_input_channel_3, fromLow, fromHigh, toLow, toHigh);
  	channel_4 = channel_4 + map(receiver_input_channel_4, fromLow, fromHigh, toLow, toHigh);
  	channel_5 = channel_5 + map(receiver_input_channel_5, fromLow, fromHigh, toLow, toHigh);
  	channel_6 = channel_6 + map(receiver_input_channel_6, fromLow, fromHigh, toLow, toHigh);      
  }
  channel_1 = channel_1 / sample_num;
  channel_2 = channel_2 / sample_num;
  channel_3 = channel_3 / sample_num;
  channel_4 = channel_4 / sample_num;
  channel_5 = channel_5 / sample_num;
  channel_6 = channel_6 / sample_num;
  //set low point
  if (channel_1 < toLow) channel_1 = toLow;
  if (channel_2 < toLow) channel_2 = toLow;
  if (channel_3 < toLow) channel_3 = toLow;
  if (channel_4 < toLow) channel_4 = toLow;
  if (channel_5 < toLow) channel_5 = toLow;
  if (channel_6 < toLow) channel_6 = toLow;
  //set high point
  if (channel_1 > toHigh) channel_1 = toHigh;
  if (channel_2 > toHigh) channel_2 = toHigh;
  if (channel_3 > toHigh) channel_3 = toHigh;
  if (channel_4 > toHigh) channel_4 = toHigh;
  if (channel_5 > toHigh) channel_5 = toHigh;
  if (channel_6 > toHigh) channel_6 = toHigh;
  //if the trasmitter is off turn esc off and ceter the servo
  if(channel_1 <= toLow && channel_2 <= toLow && channel_3 <= toLow && channel_4 <= toLow && channel_5 <= toLow && channel_6 <= toLow)
  {
      ESC.write(esc_mid);
      SERVO.write(servo_mid);
  }
  //else do the noraml routine
  else 
  {
    //write the throttle value to esc 
    if(channel_3 >= bottom && channel_5 < dead_zone) //forward
    {
      x = map(channel_3, toLow, toHigh, esc_mid, esc_high);
      ESC.write(x);     
    }
    else if(channel_3 >= bottom && channel_5 > dead_zone) //reverse
    {
      x = map(channel_3, toLow, toHigh, esc_low, esc_mid);
      ESC.write(x);
    }  
    //write the steering value to servo
    if(channel_1 > low_mid && channel_1 < high_mid)
    {
        z = servo_mid;
        SERVO.write(z);
    }
    if(channel_1 > high_mid ) // Left
    {
      z = map(channel_1, tomid, toHigh, servo_mid, servo_high);
      SERVO.write(z);
    }
    if(channel_1 < low_mid) // Rght
    {
      z = map(channel_1, toLow, tomid, servo_low, servo_mid);
      SERVO.write(z);  
    }

  }
   
// debug

  //Serial.print("Channel 1 = ");
  Serial.print(channel_1);
  Serial.print('\t');
  //Serial.print("Channel 2 = ");
  Serial.print(channel_2);
  Serial.print('\t');
  //Serial.print("Channel 3 = ");
  Serial.print(channel_3);
  Serial.print('\t');
  //Serial.print("Channel 4 = ");
  Serial.print(channel_4);
  Serial.print('\t');
  //Serial.print("Channel 5 = ");
  Serial.print(channel_5);
  Serial.print('\t');
  //Serial.print("Channel 6 = ");
  Serial.print(channel_6);
  Serial.print('\t');
  //Serial.print("x = ");
  Serial.print(x);
  Serial.print('\t');
  //Serial.print("z = ");
  Serial.print(z);
  Serial.print('\n');
  


}





//This routine is called every time input A8, A9, A10, A11, A12 or A13 changed state
ISR(PCINT2_vect)
{
  current_time = micros();
  //Channel 1=========================================
  if(PINK & B00000001)
  {                                                            //Is input A8 high?
  if(last_channel_1 == 0)
  {                                                            //Input A8 changed from 0 to 1
    last_channel_1 = 1;                                        //Remember current input state
    timer_1 = current_time;                                    //Set timer_1 to current_time
  }
  }
  else if(last_channel_1 == 1)
  {                                                            //Input A8 is not high and changed from 1 to 0
    last_channel_1 = 0;                                        //Remember current input state
    receiver_input_channel_1 = current_time - timer_1;         //Channel 1 is current_time - timer_1
  }
  //Channel 2=========================================
  if(PINK & B00000010 )
  {                                                            //Is input A9 high?
    if(last_channel_2 == 0)
    {                                                          //Input A9 changed from 0 to 1
      last_channel_2 = 1;                                      //Remember current input state
      timer_2 = current_time;                                  //Set timer_2 to current_time
    }
  }
  else if(last_channel_2 == 1)
  {                                                            //Input A9 is not high and changed from 1 to 0
    last_channel_2 = 0;                                        //Remember current input state
    receiver_input_channel_2 = current_time - timer_2;         //Channel 2 is current_time - timer_2
  }
  //Channel 3=========================================
  if(PINK & B00000100 )
  {                                                            //Is input A10 high?
    if(last_channel_3 == 0)
    {                                                          //Input A10 changed from 0 to 1
      last_channel_3 = 1;                                      //Remember current input state
      timer_3 = current_time;                                  //Set timer_3 to current_time
    }
  }
  else if(last_channel_3 == 1)
  {                                                            //Input A10 is not high and changed from 1 to 0
    last_channel_3 = 0;                                        //Remember current input state
    receiver_input_channel_3 = current_time - timer_3;         //Channel 3 is current_time - timer_3

  }
  //Channel 4=========================================
  if(PINK & B00001000 )
  {                                                            //Is input A11 high?
    if(last_channel_4 == 0)
    {                                                          //Input A11 changed from 0 to 1
      last_channel_4 = 1;                                      //Remember current input state
      timer_4 = current_time;                                  //Set timer_4 to current_time
    }
  }
  else if(last_channel_4 == 1)
  {                                                            //Input A11 is not high and changed from 1 to 0
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

