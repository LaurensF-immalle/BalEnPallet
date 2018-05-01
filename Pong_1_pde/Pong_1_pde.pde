GameMode gameMode = GameMode.StartScreen;
int rad = 5;        
float xpos, ypos;

float xspeed = 4.9;  
float yspeed = 4.9;  

int xdirection = 1;  
int ydirection = 1;  

int tellerRechts = 0;
int tellerLinks = 0;

int breedtePallet = 10;
int lengtePallet = 50;

int xPalletinks = 25;
int xPalletRechts = 1175;
int yPalletLinks = 250;
int yPalletRechts = 250;

int beweegSnelheidPallet = 10;

void setup() 
{
  size(1200, 600);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  xpos = width/2;
  ypos = height/2;
}

void draw() 
{
  background(120);

  noStroke();
  fill(255);
  ellipse(xpos, ypos, rad, rad);

  textSize(20);
  fill(1);
  text(tellerLinks, 70, 50);
  text(tellerRechts, width - 70, 50);

  fill(0, 255, 0);
  stroke(0, 255, 0);

  tekenLijnen();

  switch(gameMode)
  {
  case StartScreen:
    StartScreen();
    break;

  case Playing:
    balletje();
    palletje();
    botsDetectie();
    puntenTeller();
    Winner();
    break;
    
  case WinScreen:
    WinScreen();
    break;
  }
}

void newGame() {
  xpos = width / 2;
  ypos = random(rad, height-rad);
  
  xspeed = 3;
  yspeed = 3;
}

void StartScreen()
{  
  text("Druk 'g' voor te starten", width/2 -100, height/2-50);

  if (keyPressed && key == 'g')
  {
    gameMode = GameMode.Playing;
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
      newGame();
  }

  if (xpos < rad) 
  {
      tellerRechts += 1;
      newGame();
  }
}

void balletje()
{
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
}

void palletje()
{
  rect(xPalletinks, yPalletLinks, breedtePallet, lengtePallet);
  rect(xPalletRechts, yPalletRechts, breedtePallet, lengtePallet);

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


void botsDetectie()
{
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  if (xpos > xPalletinks + rad 
    && xpos < xPalletinks + (rad+breedtePallet) 
    && ypos > yPalletLinks 
    && ypos < yPalletLinks + lengtePallet)
  {
    xdirection *= -1;
    randomSpeed();
  }
  if (xpos > xPalletRechts -rad 
    && xpos < xPalletRechts - (rad-breedtePallet)
    && ypos > yPalletRechts 
    && ypos < yPalletRechts + lengtePallet)
  {
    xdirection *= -1;
    randomSpeed();
  }
}

void tekenLijnen()
{
  for (int i = 0; i<width; i = i +5)
  {
    line(width/2, i, width/2, i );
  }
}

void randomSpeed()
{
  xspeed = random(3,10);
  yspeed = random(3,10);
}