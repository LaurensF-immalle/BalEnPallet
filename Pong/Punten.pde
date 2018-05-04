class Punten
{
 void Winner()
  {
    if (tellerLinks == 5)
    { 
      gameMode = GameMode.WinScreen;
    } else if (tellerRechts == 5)
    {
      gameMode = GameMode.WinScreen;
    }
  }
  
   void puntenTeller()
  {
    if (xpos > width-rad) 
    {
        tellerLinks += 1;
        mode.newGame();
    }
  
    if (xpos < rad) 
    {
        tellerRechts += 1;
        mode.newGame();
    }
  }
}