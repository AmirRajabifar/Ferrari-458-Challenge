#include "Car.h"


Car::Car(int __ESD_pin, int __Servo_pin)
{
	pinMode(__ESD_pin, OUTPUT);
	pinMode(__Servo_pin, OUTPUT);

	SERVO.attach(__Servo_pin);
	ESD.attach(__ESD_pin);
}


float Car::writeThrottle(float a)
{
	this->throttleVal = a;
	//debug
	Serial.print(this->throttleVal);
	Serial.print('\t');
	//debug
	ESD.write(throttleVal);
}


float Car::writeSteering(float a)
{
	this->steeringVal = a;
	//debug
	Serial.print(this->steeringVal);
	Serial.print('\n');
	//debug
	SERVO.write(steeringVal);
}