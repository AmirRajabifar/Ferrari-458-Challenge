
// variables for colour selection
float r = 0;
float g = 0;
float b = 0;

// a character for car stat
String stat = "A"; 

float speed = 0;

PFont myFont;


void setup(){
// canvas si ze  
  size (2000, 900);
// back ground colour  
  background(18, 28, 28);
  
  rectMode(CENTER);
  myFont = createFont("Times New Roman", 32);
  textFont(myFont);
   
  smooth();
}


void draw()
{
//Import Serial data and process data


//Selects the colour for the back gound panel based on the car stat
 switch (stat)
 {
   case ("A"):
     r = 0;
     g = 255;
     b = 0;
     break;
   case ("B"):
     r = 255;
     g = 243;
     b = 3;
     break;
   case ("C"):
     r = 255;
     g = 0;
     b = 0;
     break; 
 }
 /*
 
// 1st arc: Colour band 
  strokeWeight(3);
  stroke(0);
  fill(255,0,0);
  arc(750, 700, 750,750, (PI+(HALF_PI-PI/2)), TWO_PI);
  
// Lines
  for (int i = 0; i <= 180; i += 1){
    strokeWeight(1);
    stroke(40);
    lineAngle(750, 700, radians(i), 370);
  }
// 2nd arc: To cover the mid lines so it looks more real
  noStroke();
  fill(255,0,0);
  arc(750, 700, 720,720, (PI+(HALF_PI-PI/2)), TWO_PI); 

//Second Set of Liens <It is drwon on top of the 2nd arc>
  for (int i = 0; i <= 180; i += 10){
    strokeWeight(2);
    stroke(0);
    lineAngle(750, 700, radians(i), 373);
  }
  
// 3rd arc: 
  strokeWeight(1);
  stroke(0);
  fill(255,252,3);
  arc(750, 700, 700,700, (PI+(HALF_PI-PI/2)), TWO_PI);  
  
  fill(255,252,3,54);
  arc(750, 700, 700,700, (PI+(HALF_PI-PI/2)), TWO_PI);

// Middle nidle
  strokeWeight(5);
  stroke(252,0,6,120);
  lineAngle(750,700, radians(speed), 370); //"speed" is a variable that will get updates via serial converssion to KpH might be required 
*/
//********left panel********\\
 stroke(0);
 strokeWeight(1.5);
 fill(255,255,255);
 rect(width/2 - 565 , height/2 + 75, 700, 500);


 
//********main panel********\\
  stroke(0,0,0);
  strokeWeight(3);  
  fill(255,255,255);
  ellipse(width/2, height/2, 650, 650);
//Over speed indicator 
  fill(255,0,0);
  arc(width/2, height/2, 650, 650, PI+radians(125), PI+QUARTER_PI+radians(115));
 
//1st angle devisions for speed indication 
  for (float i = 257.5; i >= 10; i -= 25){
    strokeWeight(3);
    stroke(255,0,0, 200);
    lineAngle(width/2, height/2, radians(i), 322.5);
  }
//An ellipes to cover the excess lines
  noStroke();
  fill(255,255,255);
  ellipse(width/2, height/2, 625, 625);  
  
//2nd angle devisions for speed indication 
  for (int i = 265; i >= 250; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 240; i >= 225; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 215; i >= 200; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 190; i >= 175; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 165; i >= 150; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 140; i >= 125; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 115; i >= 100; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 90; i >= 75; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 65; i >= 50; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  for (int i = 40; i >= 25; i -= 5){
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(i), 325);
  }
  
//An ellipes to cover the excess lines
 fill(255,255,255);
 //ellipse(width/2, height/2, 600, 600);
 arc(width/2, height/2, 600, 600, HALF_PI, TWO_PI-radians(20));
 
//3rd angle devisions for speed indication 
  for (int i = 270; i >= 10; i -= 25){
    strokeWeight(5);
    stroke(0, 200);
    lineAngle(width/2, height/2, radians(i), 312);
  } 
//An ellipes to cover the excess lines
  noStroke();
  fill(255,255,255);
  ellipse(width/2, height/2, 570, 570);
  
//Middle nidle - speed
  stroke(255,0,0);
  strokeWeight(2);
  fill(255,0,0);
  rTriangle(width/2, height/2, 320, 15, speed, true);
 
//********Right side panel********\\
  //main ellips
  noStroke();
  fill(255,255,255);
  ellipse(width/2 + 572, height/2 + 75, 500, 500);
  // lines
  for (int i = 270; i >= 20 ; i -= 10) 
  {
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2 + 572, height/2 + 75, radians(i), 250);    
  }
  //an arc and an ellipse to cover the excesslines
  stroke(1); 
  fill(255, 255, 255); 
  arc(width/2 + 572, height/2 + 75, 450, 450, HALF_PI, TWO_PI-radians(20));
  noStroke();
  ellipse(width/2 + 572, height/2 + 75, 448, 448);
  //

  //Middle nidle - speed
  stroke(0, 255, 0);
  strokeWeight(1);
  fill(0, 255, 0);
  rTriangle(width/2 + 572, height/2 + 75, 235, 8, speed, false);
//*****************************tests*****************************\\ 
  speed++;
  
//*****************************alignment*****************************\\ 
 stroke(0,255,0);
 strokeWeight(2);
 line (0 , 775, 2000, 775);

//*****************************Test and debuging*****************************\\
  
  println (speed);
  
}
//*****************************Functions*****************************\\

// this function is used to plot a line on an angle 
void lineAngle(int x, int y, float angle, float length){
/* x       = x Co-ordinate of the first point
   y       = y Co-ordinate of the first point
   angle   = the angle that the line is going to be ploted in rads
   length  = the length of the line
*/
  line(x, y, (x+cos(angle)*length), (y-sin(angle)*length));
}

void rTriangle (int x, int y, int HIGHT, int BASE , float angle , boolean line){
/*
  This function is working hand in hand with lineAngle() to draw
  a triangle that can be rotated.
  x       = x Co-ordinate of the first point
  y       = y Co-ordinate of the first point
  HIGHT   = lenght of the trianle hight
  BASE    = lenght of the triangle base
  angle   = angle that triangle is going to be ploted in degrees
  line    = a boolean to show/hide the HIGHT line
  
*/
//calculating the coordiantes of each corner 
  float x1 = (x+cos(radians(angle))*HIGHT);
  float y1 = (y-sin(radians(angle))*HIGHT);
  float x2 = (x+cos(radians(angle + 90))*(BASE/2));
  float y2 = (y-sin(radians(angle + 90))*(BASE/2));
  float x3 = (x+cos(radians(angle - 90))*(BASE/2));
  float y3 = (y-sin(radians(angle - 90))*(BASE/2));
//Two sides of the triangle  
 // line(x1, y1, x2, y2);
 // line(x1, y1, x3, y3);
  triangle (x1, y1, x2, y2, x3, y3);
//translating a new matrix  
  pushMatrix();
  translate(x, y);
//BASE of the triangle  
  //lineAngle(0,0, radians(angle + 90), BASE/2);
  //lineAngle(0,0, radians(angle - 90), BASE/2);
  
//an option for the HIGHT (show/hide)
  if (line){
    strokeWeight(.5);    
  }else if(!line){
    noStroke();  
  }
//HIGHT of the triangle  
  lineAngle(0,0, radians(angle), HIGHT); 
  popMatrix(); 
}