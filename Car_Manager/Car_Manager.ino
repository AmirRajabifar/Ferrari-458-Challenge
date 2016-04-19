//Adding Servo & NewPing libraries
  #include <Servo.h>
  #include <NewPing.h>

//Pin connection to Ultrasonic sensor and the range
  #define TRIGGER_PIN  4
  #define ECHO_PIN     5
  #define MAX_DISTANCE 200
//Variables to store middle position of joysticks
  int deadzoneA= 0;
  int deadzoneB= 0;
//Á variable to hold the range 
int autonomous; 
//micro seconds from trig
  int uS;
//variable to hold distance in cm
  int distance;
// creating  servo objects
  Servo servo;
  Servo ESC;
//creating sonar object
  NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);
  
String sCH1, sCH2, sCH3, sCH4, sCH5, sCH6;
float CH1, CH2, CH3, CH4, CH5, CH6;
String data;

int x, y;

void setup() 
{
// attach() is used to assign relevant pins to relevant servos
     servo.attach(2);
     ESC.attach(3);
// begining the serial communication  
  Serial.begin(250000);
  Serial1.begin(250000);
  Serial1.flush();
  data = Serial1.readStringUntil('\n');
  data = "0";  
}

void loop() 
{
  if (Serial1.available() > 0)
  {
    data = Serial1.readStringUntil('\n');
  }
  String payload = "";
  if (data != "0")
  {
    int offset = data.indexOf("U*");
    if (offset >= 0)
    {
      payload = data.substring(offset + 3, data.indexOf('\n'));
      char value = data.charAt(offset+2);
      switch (value)
      {
        case 'A':
          sCH1 = payload;
          break;
        case 'B':
          sCH2 = payload;
          break;
        case 'C':
          sCH3 = payload;
          break;
        case 'D':
          sCH4 = payload;
          break;
        case 'E':
          sCH5 =payload;
          break;
        case 'F':
          sCH6 = payload;
          break;
      }
    }
  }
// Converting strings to float  
  CH1 = sCH1.toFloat();
  CH2 = sCH2.toFloat();
  CH3 = sCH3.toFloat();
  CH4 = sCH4.toFloat();
  CH5 = sCH5.toFloat();
  CH6 = sCH6.toFloat();
//reading from ultrasonic
  uS = sonar.ping_median();
  distance = uS / US_ROUNDTRIP_CM;  //converts the readings to CM
// assigning values to dead zones     
  deadzoneA = 900;
  deadzoneB = 1400; 
  autonomous = 1800;

//*************** Debug ****************\\  
  Serial.print("CH1 = ");
  Serial.print(CH1);
  Serial.print('\t');
  Serial.print("CH2 = ");
  Serial.print(CH2);
  Serial.print('\t');
  Serial.print("CH3 = ");
  Serial.print(CH3);
  Serial.print('\t');
  Serial.print("CH4 = ");
  Serial.print(CH4);
  Serial.print('\t');
  Serial.print("CH5 = ");
  Serial.print(CH5);
  Serial.print('\t');
  Serial.print("CH6 = ");
  Serial.print(CH6);
  Serial.println("");
  Serial.print("Distance = ");
  Serial.println(distance);   
  
   

//********** DO STUFF **********\\     

/*
 * Safety feature: When transmitter is off DON'T freak out!
 */
  if (CH1 == 0 && CH2 == 0 && CH3 == 0 && CH4 == 0 && CH5 == 0 && CH6 == 0)
  {
    ESC.write(108);
    servo.write(94);
  }
  else
  {

  // Drive    
     if (CH3 != deadzoneA)
     {
      DRIVE();
     }
     else
     {
      ESC.write(108);
     }

  // Turn 
     if (CH1 != deadzoneB)
     {
      TURN();
     }
     else
     {
      servo.write(94);
     }
  
  //Autonomous drive
    if (CH6 >= autonomous)
    {
      AUTONOMOUS();
    }
  }
 //************* 
}


void DRIVE()
{
//"x" is a variable tha stores the angle  
    if (CH3 != deadzoneA && CH5 == deadzoneA)
    {
      x = map(CH3, 900, 1900, 108, 180);
      ESC.write(x);      
    }
    else if (CH3 != deadzoneA && CH5 != deadzoneA)
    {
      x = map(CH3, 900, 1900, 108, 0);
      ESC.write(x);        
    }
}


void TURN(){
//"y" is a variable tha stores the angle   
    y = map(CH1, 900, 1900, 0, 180);
    servo.write(y);
}


void AUTONOMOUS(){
/*
 * This function will drive the car Autonomously
 */
//Break
  int lastDistance = 0;
  int distanceDifference = lastDistance - distance ;


  if (distanceDifference >= 10) {
    ESC.write(0);
    lastDistance = distance;
  }
  // Drive
    /* Makes use of one Ultrasonic sensor. 
     */
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
  /*Makes use of two IR sensors. The sensors are placed on both sides of the car.
   *Are monitoring the set distance within the range specified.
   */
   
}



