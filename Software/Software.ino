#include "definitions.h"
#include "Car.h"

byte last_channel[6];
int receiver_input_channel[6], channel[6];
unsigned long timer_channel[6], timer[6], current_time;

byte BITS[] = {
	B00000001,
	B00000010,
	B00000100,
	B00001000,
	B00010000,
	B00100000
};

Car car(esc_pin, servo_pin);

void setup() 
{
	PCICR  |= (1 << PCIE1);   //Set PCIE0 to enable PCMSK1 scan.
	PCMSK1 |= (1 << PCINT8);  //Set PCINT8  (Analog input A0) to trigger an interrupt on state change.
	PCMSK1 |= (1 << PCINT9);  //Set PCINT9  (Analog input A1) to trigger an interrupt on state change.
	PCMSK1 |= (1 << PCINT10); //Set PCINT10 (Analog input A2) to trigger an interrupt on state change.
	PCMSK1 |= (1 << PCINT11); //Set PCINT11 (Analog input A3) to trigger an interrupt on state change.
	PCMSK1 |= (1 << PCINT12); //Set PCINT12 (Analog input A4) to trigger an interrupt on state change.
	PCMSK1 |= (1 << PCINT13); //Set PCINT13 (Analog input A5) to trigger an interrupt on state change.

	Serial.begin(115200);
}

void loop() 
{
	int j = 0;
	while(j < sample_num) //Sample the readings from each channel
	{
		for(int i = 0; i < channel_numbers; i++) //Read from each channel and "add"
		{
			channel[i] = channel[i] + map(receiver_input_channel[i], fromLow, fromHigh, toLow, toHigh) ;
		}
		j++;
	}
	for(int i = 0; i < channel_numbers; i++) 
	{
		channel[i] = channel[i] / sample_num; 			 // Take average
		if(channel[i] < toLow)  channel[i] = toLow;  // set low point
		if(channel[i] > toHigh) channel[i] = toHigh; // set high point
  	}
	car.writeThrottle(channel[2]);
	car.writeSteering(channel[0]);
	// Debug
	/*
	for(int i = 0; i < channel_numbers; i++)
	{
	Serial.print(channel[i]);
	Serial.print('\t');
	}
	Serial.print('\n');
	*/
}

ISR(PCINT1_vect)
{
	for(int i=0; i<channel_numbers; i++)
	{
		current_time = micros();
		if(PINC & BITS[i])
		{
			if(last_channel[i] == 0)
			{
				last_channel[i] = 1;
				timer[i] = current_time;
			}	      
		}
		else if(last_channel[i] == 1)
		{
			last_channel[i] = 0;
			receiver_input_channel[i] = current_time - timer[i];
		} 
	}
}