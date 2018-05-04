


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

int xPalletLinks = 25;
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


  switch(gameMode)
  {
  case StartScreen:
    showInstructions();
    tekenStartScreen();
    tekenStartPos();
    break;
  
  case Single:    
    tekenLijnen();
    plaatsTeller();
    updateBal();
    beweegPallet1();
    beweegPalletPC();
    berekenBotsDetectie();
    drawEllipse();
    drawPalletjes();
    berekenPunten();
    berekenWinner();
  break;

  case Multi:
    tekenLijnen();
    plaatsTeller();
    updateBal();
    beweegPallet1();
    beweegPallet2();
    berekenBotsDetectie();
    drawEllipse();pen 
    drawPalletjes();
    berekenPunten();
    berekenWinner();
    break;
    
  case WinScreen:
    tekenWinScreen();
    break;
  }
}

void startNewGame() {
  xpos = width / 2;
  ypos = random(rad, height-rad);
  
  xspeed = 3;
  yspeed = 3;
}

void showInstructions()
{
  textSize(20);
  fill(255,0,0);
  text("Bestuur links met 'a' en 'q'.", 20,580);
  text("Bestuur rechts met muis links en rechts te klikken.", 700,580);
}

void tekenStartScreen()
{  
  fill(0, 255, 0);
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

void drawEllipse()
{
  noStroke();
  fill(255);
  ellipse(xpos, ypos, rad, rad);
}

void drawPalletjes()
{
  fill(0,255,0);
  stroke(0,255,0);
  rect(xPalletLinks,yPalletLinks,breedtePallet,lengtePallet);
  rect(xPalletRechts,yPalletRechts,breedtePallet,lengtePallet);
}

void plaatsTeller()
{
  textSize(20);
  fill(1);
  text(tellerLinks, 70, 50);
  text(tellerRechts, width - 70, 50);
}


void tekenWinScreen()
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

void berekenWinner()
{
  if (tellerLinks == 5)
  { 
    gameMode = GameMode.WinScreen;
  } else if (tellerRechts == 5)
  {
    gameMode = GameMode.WinScreen;
  }
}

void berekenPunten()
{
  if (xpos > width-rad) 
  {
      tellerLinks += 1;
      startNewGame();
  }

  if (xpos < rad) 
  {
      tellerRechts += 1;
      startNewGame();
  }
}

void updateBal()
{
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
}

void beweegPallet1()
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

void beweegPallet2()
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

void beweegPalletPC()
{
  yPalletLinks = int(ypos-lengtePallet/2);
  //yPalletRechts = int(ypos-(lengtePallet/2));
}
void berekenBotsDetectie()
{
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  if (xpos > xPalletLinks + rad  - 10
    && xpos < xPalletLinks + (rad+breedtePallet) 
    && ypos > yPalletLinks + 10
    && ypos < yPalletLinks + lengtePallet)
  {
    xdirection *= -1;
    berekenRandomSpeed();
  }
  if (xpos > xPalletRechts -rad -5
    && xpos < xPalletRechts - (rad-breedtePallet)
    && ypos > yPalletRechts +5
    && ypos < yPalletRechts + lengtePallet)
  {
    xdirection *= -1;
    berekenRandomSpeed();
  }
}

void tekenLijnen()
{
  for (int i = 0; i<width; i = i +5)
  {
    line(width/2, i, width/2, i );
  }
}

void berekenRandomSpeed()
{
  xspeed = random(3,10);
  yspeed = random(3,10);
}
void tekenStartPos()
{
   xPalletLinks = 25;
   xPalletRechts = 1160;
   yPalletLinks = height/2;
   yPalletRechts = height/2;
}

enum GameMode
{
  StartScreen,
  Single,
  Multi,
  WinScreen
}