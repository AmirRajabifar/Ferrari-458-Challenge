//Adding requied libraries
  #include <Servo.h>
  #include <NewPing.h>
//  #include <Wire.h>
//Pin connection to Ultrasonic sensor and the range
  #define TRIGGER_PIN  26
  #define ECHO_PIN     4
  #define MAX_DISTANCE 200
//Pin connection to RC receiver
  int CH_PIN[6] = {7, 8, 9, 10, 11, 12};
//array to store CH  
  float CH[6];
//
  int x, y;  
//Variables to store middle position of joysticks
  int deadzoneA = 1000;
  int deadzoneB = 1400;
//Á variable to hold the range 
  int autonomous = 1800; 
//micro seconds from trig
  int uS;
//variable to hold distance in cm
  int distance;
// creating  servo objects
  Servo servo;
  Servo ESC;
//creating sonar object
  NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);

//a function to round the read numbers
float roundCH (float CH)
{
  float result;
  result = CH / 100.0;
  result = round (CH);
  result = result * 100.0;
  return result;
}
void setup() 
{
//set the pin state for receiver  
  for (int i = 0; i < 6; i++)
  {
    pinMode (CH_PIN[i], INPUT);
  }
// attach() is used to assign relevant pins to relevant servos
  servo.attach(5);
  ESC.attach(6);
// begining the serial communication  
  Serial.begin(9600);
 // Wire.begin();
}

void loop() 
{
//using pulseIn() to read from receiver
  for (int i = 0; i < 6; i++)
  {
    CH[i] = pulseIn(CH_PIN[i], HIGH); 
    CH[i] = roundCH (CH[i]);
    CH[i] = map (CH[i], 98500, 197000, 900, 1900);
  }
//reading from ultrasonic
  uS = sonar.ping_median();
  distance = uS / US_ROUNDTRIP_CM;  //converts the readings to CM


//*************** Debug ****************\\ 

 for (int i = 0; i < 6; i++)
 {
  Serial.print(CH[i]);
  Serial.print('\t');
 }
  Serial.print("Distance = ");
  Serial.println(distance);   
  Serial.print("X = ");
  Serial.print(x);
  Serial.print('\t');
  Serial.print("Y = ");
  Serial.print(y);
  Serial.print('\n');
   

//********** DO STUFF **********\\     

/*
 * Safety feature: When transmitter is off DON'T freak out!
 */
  if (CH[0] == 0 && CH[1] == 0 && CH[2] == 0 && CH[3] == 0 && CH[4] == 0 && CH[5] == 0)
  {
    ESC.write(108);
    servo.write(94);
  }
  else
  {
  // Drive    
     if (CH[2] != deadzoneA)
     {
      DRIVE();
     }
     else
     {
      ESC.write(108);
     }

  // Turn 
     if (CH[0] != deadzoneB)
     {
      TURN();
     }
     else
     {
      servo.write(94);
     }
  
  //Autonomous drive
    if (CH[5] >= autonomous)
    {
   //   AUTONOMOUS();
    }
  }
  
 //************* 
}


void DRIVE()
{
//"x" is a variable tha stores the angle  
    if (CH[2] != deadzoneA && CH[4] <= deadzoneA)
    {
      x = map(CH[2], 900, 1900, 108, 180);
      ESC.write(x);      
    }
    else if (CH[2] != deadzoneA && CH[4] >= deadzoneA)
    {
      x = map(CH[2], 900, 1900, 108, 0);
      ESC.write(x);        
    }
   
}


void TURN(){
//"y" is a variable tha stores the angle   
    y = map(CH[0], 900, 1900, 0, 180);
    servo.write(y);
}

/*
void AUTONOMOUS(){

 // This function will drive the car Autonomously
 
//Break
  int lastDistance = 0;
  int distanceDifference = lastDistance - distance ;


  if (distanceDifference >= 10) {
    ESC.write(0);
    lastDistance = distance;
  }
  // Drive
    // Makes use of one Ultrasonic sensor. 
     
    else if (CH6 >= autonomous && distance <= 200 && distance > 100){
      ESC.write(180);     // 100% Throttle 
    }else if (CH6 >= autonomous && distance <= 100 && distance > 50){
      x = map(distance, 50, 100, 144, 162); 
      ESC.write(x);       // 75% Throttle
    }else if(CH6 >= autonomous && distance <= 50 && distance > 25){
      x = map(distance, 25, 50, 126, 144);
      ESC.write(x);       // 50% Throttle
    }else if (CH6 >= autonomous && distance <= 25 && distance > 10) {
      x = map(distance, 10, 25, 115, 126);
      ESC.write(x);       // 25% Throttle
    }else if (CH6 >= autonomous && distance <= 10 && distance > 5) {
      x = map(distance, 5, 10, 108, 119);
      ESC.write(x);       // 15% Throttle
    }else{
    ESC.write(108);       // 0% Throttle
    }
  
  lastDistance = distance;

// Turn
  //Makes use of two IR sensors. The sensors are placed on both sides of the car.
   //Are monitoring the set distance within the range specified.
   
   
}
*/


