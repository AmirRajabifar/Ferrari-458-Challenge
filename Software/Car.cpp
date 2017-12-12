#include "Car.h"


Car::Car(int __ESC_pin, int __Servo_pin)
{
	pinMode(__ESC_pin, OUTPUT);
	pinMode(__Servo_pin, OUTPUT);

	SERVO.attach(__Servo_pin);
	ESC.attach(__ESC_pin);
}


float Car::writeThrottle(float a)
{
	this->throttleVal = a;
	//debug
	Serial.print(this->throttleVal);
	Serial.print('\t');
	//debug
	ESC.write(throttleVal);
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