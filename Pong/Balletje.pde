class Balletje
{
  
  void balletje()
  {
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
  }
  
  void randomSpeed()
  {
    xspeed = random(3,10);
    yspeed = random(3,10);
  }
  
  void draw()
  {
    ellipse(xpos, ypos, rad, rad);
  }
}