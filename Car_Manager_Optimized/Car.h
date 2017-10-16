#ifndef Cars_h
#define Cars_h 

#include <Arduino.h>

class Car
{
private:
	float throttleVal = 0;
	float steeringVal = 90;

public:
	//Car();
	float throttle(float a);  // set Throttle lvl
	float steering(float a);  // set steering lvl
	
};

#endif