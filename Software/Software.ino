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

Car car(7, 6);

void setup() 
{
	PCICR  |= (1 << PCIE2); //Set PCIE0 to enable PCMSK2 scan.
	PCMSK2 |= (1 << PCINT16); //Set PCINT16 (Analog input A8) to trigger an interrupt on state change.
	PCMSK2 |= (1 << PCINT17); //Set PCINT17 (Analog input A9) to trigger an interrupt on state change.
	PCMSK2 |= (1 << PCINT18); //Set PCINT18 (Analog input A10) to trigger an interrupt on state change.
	PCMSK2 |= (1 << PCINT19); //Set PCINT19 (Analog input A11) to trigger an interrupt on state change.
	PCMSK2 |= (1 << PCINT20); //Set PCINT20 (Analog input A12) to trigger an interrupt on state change.
	PCMSK2 |= (1 << PCINT21); //Set PCINT21 (Analog input A13) to trigger an interrupt on state change.

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
		channel[i] = channel[i] / sample_num; 		 // Take average
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

ISR(PCINT2_vect)
{
	for(int i=0; i<channel_numbers; i++)
	{
		current_time = micros();
		if(PINK & BITS[i])
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