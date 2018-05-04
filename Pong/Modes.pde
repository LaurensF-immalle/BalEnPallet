class Modes
{
   void newGame()
  {
    xpos = width / 2;
    ypos = random(rad, height-rad);
    
    xspeed = 3;
    yspeed = 3;
  }
  
  void StartScreen()
  {  
    text("Druk 's' voor 1 player", width/2 -100, height/2-50);
    text("Druk 'm' voor 2 players", width/2 -100, height/2-20);
    
    if (keyPressed && key == 's')
    {
      gameMode = GameMode.Single;
    }
  
    if (keyPressed && key == 'm')
    {
      gameMode = GameMode.Multi;
    }
  }
  
  void WinScreen()
  {  
    if (tellerLinks == 5)
    { 
       text("Profciat, Links is gewonnen", width/2 - 200, height/2-50);
    } 
    
     if (tellerRechts == 5)
    {
       text("Profciat, Rechts is gewonnen", width/2 - 200, height/2-70);
    }
    
    text("Druk 'x' om naar starscherm te gaan", width/2 - 200, height/2);
  
    if (keyPressed && key == 'x')
    {
      gameMode = GameMode.StartScreen;
      tellerLinks = 0;
      tellerRechts = 0;
    }
  }

  
}