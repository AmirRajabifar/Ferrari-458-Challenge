#include "Car.h"

float Car::throttle(float a)
{
	this->throttleVal = a;
	//debug
	Serial.print(this->throttleVal);
	Serial.print('\t');
}


float Car::steering(float a)
{
	this->steeringVal = a;
	//debug
	Serial.print(this->steeringVal);
	Serial.print('\n');
}