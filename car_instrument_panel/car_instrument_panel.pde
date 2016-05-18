
// variables for colour selection
float r = 0;
float g = 0;
float b = 0;

//
float batterylevel = 0;
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
 
//1st angle divisions for speed indication 
  for (float i = 257.5; i >= 10; i -= 25){
    strokeWeight(3);
    stroke(255,0,0, 200);
    lineAngle(width/2, height/2, radians(i), 322.5);
  }
//An ellipes to cover the excess lines
  noStroke();
  fill(255,255,255);
  ellipse(width/2, height/2, 625, 625);  
  
//2nd angle divisions for speed indication 
for (int i = 265; i >= 25; i -= 25) {
  for (int j = i - 15; j <= i ; j += 5) {
    strokeWeight(2);
    stroke(0, 110);
    lineAngle(width/2, height/2, radians(j), 325); 
  }
}
//An ellipes to cover the excess lines
 fill(255,255,255);
 //ellipse(width/2, height/2, 600, 600);
 arc(width/2, height/2, 600, 600, HALF_PI, TWO_PI-radians(20));
 
//3rd angle divisions for speed indication 
  for (int i = 270; i >= 10; i -= 25){
    strokeWeight(5);
    stroke(0, 200);
    lineAngle(width/2, height/2, radians(i), 312);
  } 
//An ellipes to cover the excess lines
  noStroke();
  fill(255,255,255);
  ellipse(width/2, height/2, 570, 570);

//********Battery level indicator********\\
  //outline
  strokeWeight(2);
  stroke(0);
  noFill();
  rect(width/2, height/2 + 85, 450, 50);
  //status
  batterylevel = 50;
  if (batterylevel >= 70) 
  {
    stat = "A";
  }
  else if (batterylevel >= 30)
  {
    stat = "B";
  }
  else if (batterylevel >= 0)
  {
    stat = "C";
  }
  batterylevel = map(batterylevel, 0, 100, 0, 450);
  //rect to fill the outline
  noStroke();
  fill(r, g, b);
  rectMode(CORNER);
  rect(width/2 - 225 , height/2 + 60, batterylevel, 50);

  rectMode(CENTER);
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
  triangle (x1, y1, x2, y2, x3, y3);
//translating a new matrix  
  pushMatrix();
  translate(x, y); 
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