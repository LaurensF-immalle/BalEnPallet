int rad = 20;        
float xpos, ypos;    

float xspeed = 5.0;  
float yspeed = 5.0;  

int xdirection = 1;  
int ydirection = 1;  

int tellerRechts = 0;
int tellerLinks = 0;


void setup() 
{
  size(800, 400);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  xpos = 400;
  ypos = 200;
}

void draw() 
{
  background(120);
  ScoreTeller();
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }
  noStroke();
  fill(255);
  ellipse(xpos, ypos, rad, rad);
  
  textSize(20);
  fill(1);
  text(tellerLinks, 70,50);
  text(tellerRechts, 710,50);
  
  fill(0,255,0);
  stroke(0,255,0);
  rect(5,mouseY,5,150);
  rect(790,mouseY,5,150);
}

void ScoreTeller()
{
   if (xpos > width-rad && ypos < mouseY) 
   {
    tellerLinks += 1;
   }
  if (xpos < rad && ypos < mouseY && ypos > mouseY + 150) 
   {
    tellerRechts += 1;
   }
}