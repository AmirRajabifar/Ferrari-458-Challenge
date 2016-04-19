#define CH1Pin 3
#define CH2Pin 5
#define CH3Pin 6
#define CH4Pin 9
#define CH5Pin 10
#define CH6Pin 11

float CH1;
float CH2;
float CH3;
float CH4;
float CH5;
float CH6;

float roundCH (float CH) 
{
  float result;
  result = CH / 100;
  result = round (CH);
  result = result * 100;
  return result;  
}

void setup() 
{
  // put your setup code here, to run once:
  pinMode (CH1Pin, INPUT);
  pinMode (CH2Pin, INPUT);
  pinMode (CH3Pin, INPUT);
  pinMode (CH4Pin, INPUT);
  pinMode (CH5Pin, INPUT);
  pinMode (CH6Pin, INPUT);
  Serial.begin(250000);
}

void loop() 
{
  // put your main code here, to run repeatedly:
  CH1 = pulseIn (CH1Pin, HIGH);
  CH2 = pulseIn (CH2Pin, HIGH);
  CH3 = pulseIn (CH3Pin, HIGH);
  CH4 = pulseIn (CH4Pin, HIGH);
  CH5 = pulseIn (CH5Pin, HIGH);
  CH6 = pulseIn (CH6Pin, HIGH);
  CH1 = roundCH (CH1);
  CH2 = roundCH (CH2);
  CH3 = roundCH (CH3);
  CH4 = roundCH (CH4);
  CH5 = roundCH (CH5);
  CH6 = roundCH (CH6);
  Serial.print ("U*"); //A Header
  Serial.print ("A");  //A token to indicate the message payload 
  Serial.print (CH1);
  Serial.println("");
  Serial.print ("U*"); //A Header
  Serial.print ("B");  //A token to indicate the message payload 
  Serial.print (CH2);
  Serial.println("");
  Serial.print ("U*"); //A Header
  Serial.print ("C");  //A token to indicate the message payload 
  Serial.print (CH3);
  Serial.println(""); 
  Serial.print ("U*"); //A Header
  Serial.print ("D");  //A token to indicate the message payload 
  Serial.print (CH4);
  Serial.println(""); 
  Serial.print ("U*"); //A Header
  Serial.print ("E");  //A token to indicate the message payload 
  Serial.print (CH5);
  Serial.println(""); 
  Serial.print ("U*"); //A Header
  Serial.print ("F");  //A token to indicate the message payload 
  Serial.print (CH6);
  Serial.println(""); 
  //delay (100);   
}
