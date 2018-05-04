class Palletje
{
  void draw()
  {
     rect(xPalletLinks, yPalletLinks, breedtePallet, lengtePallet);
     rect(xPalletRechts, yPalletRechts, breedtePallet, lengtePallet);
  }
  
  void pallet1()
  {
    if (mousePressed && mouseButton == LEFT  )
    {
      if (yPalletRechts>0) {
      yPalletRechts -= beweegSnelheidPallet;
      }
    } else if (mousePressed && mouseButton == RIGHT)
    {
      if (yPalletRechts<600-lengtePallet) {
      yPalletRechts += beweegSnelheidPallet;
      }
    }
  }
  
  void pallet2()
  {
    if (keyPressed && key == 'a')
    {
      if (yPalletLinks>0) {
      yPalletLinks -= beweegSnelheidPallet;
      }
    } else if (keyPressed && key  == 'q')
    {
      if (yPalletLinks<600-lengtePallet) {
        yPalletLinks += beweegSnelheidPallet;
      }
    }
  }
  
  void palletPC()
  {
    yPalletLinks = int(ypos-lengtePallet/2);
  }
  
  void botsDetectie()
  {
    if (ypos > height-rad || ypos < rad) {
      ydirection *= -1;
    }
  
    if (xpos > xPalletLinks + rad 
      && xpos < xPalletLinks + (rad+breedtePallet) 
      && ypos > yPalletLinks 
      && ypos < yPalletLinks + lengtePallet)
    {
      xdirection *= -1;
      bal.randomSpeed();
    }
    if (xpos > xPalletRechts -rad 
      && xpos < xPalletRechts - (rad-breedtePallet)
      && ypos > yPalletRechts 
      && ypos < yPalletRechts + lengtePallet)
    {
      xdirection *= -1;
      bal.randomSpeed();
    }
  }

}