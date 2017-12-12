#ifndef Cars_h
#define Cars_h 

#include <Arduino.h>
#include <Servo.h>

class Car
{
	Servo ESC;
	Servo SERVO;
private:
	float throttleVal = 0;
	float steeringVal = 90;

public:
	//__ESC_pin, __Servo_pin
	Car(int __ESC_pin, int __Servo_pin);

	float writeThrottle(float a);  // set Throttle lvl
	float writeSteering(float a);  // set steering lvl
	

};

#endif