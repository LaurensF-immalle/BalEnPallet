GameMode gameMode = GameMode.StartScreen;
int rad = 5;        
float xpos, ypos;

float xspeed = 4.9;  
float yspeed = 4.9;  

int xdirection = 1;  
int ydirection = 1;  

boolean teller = false;
int tellerRechts = 0;
int tellerLinks = 0;

int breedtePallet = 5;
int lengtePallet = 50;

int xPalletinks = 25;
int xPalletRechts = 775;
int yPalletLinks = 200;
int yPalletRechts = 200;

int beweegSnelheidPallet = 6;

void setup() 
{
  size(800, 500);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  xpos = 400;
  ypos = 200;
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
  text(tellerRechts, 710, 50);

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
    Win();
    break;
  case WinScreen:
    WinScreen();
    break;
  }
}

void newGame() {
  text("Druk a of linker muisknop om verder te gaan", width/2 -100, height/2);
  xpos = width / 2;
  ypos = random(rad, height-rad);

  if (keyPressed && key =='a'|| mousePressed && mouseButton == LEFT)
  {
    xpos = width / 2;
    ypos = random(rad, height-rad);
    teller = true;
  }
}

void StartScreen()
{  
  text("Druk 'g' voor te starten", width/2 -100, height/2);

  if (keyPressed && key == 'g')
  {
    gameMode = GameMode.Playing;
  }
}

void WinScreen()
{  
  text("Druk 'x' om naar starscherm te gaan", width/2 - 200, height/2);

  if (keyPressed && key == 'x')
  {
    gameMode = GameMode.StartScreen;
    tellerLinks = 0;
    tellerRechts = 0;
  }
}

void Win()
{
  if (tellerLinks == 20)
  { 
    gameMode = GameMode.WinScreen;
  } else if (tellerRechts == 20)
  {
    gameMode = GameMode.WinScreen;
  }
}

void puntenTeller()
{
  if (xpos > width-rad) 
  {
    if (teller == true)
    {
      tellerLinks += 1;
      teller = false;
    }
    newGame();
  }

  if (xpos < rad) 
  {
    if (teller == true)
    {
      tellerRechts += 1;
      teller = false;
    }
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
    yPalletLinks -= beweegSnelheidPallet;
  } else if (keyPressed && key  == 'q')
  {
    if (yPalletLinks<500-lengtePallet) {
      yPalletLinks += beweegSnelheidPallet;
    }
  }

  if (mousePressed && mouseButton == LEFT  )
  {
    yPalletRechts -= beweegSnelheidPallet;
  } else if (mousePressed && mouseButton == RIGHT)
  {
    yPalletRechts += beweegSnelheidPallet;
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
  }
  if (xpos > xPalletRechts -rad 
    && xpos < xPalletRechts - (rad-breedtePallet)
    && ypos > yPalletRechts 
    && ypos < yPalletRechts + lengtePallet)
  {
    xdirection *= -1;
  }
}

void tekenLijnen()
{
  for (int i = 0; i<500; i = i +5)
  {
    line(width/2, i, width/2, i );
  }
}