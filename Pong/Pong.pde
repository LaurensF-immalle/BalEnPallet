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

Balletje bal = new Balletje();
Palletje pallet = new Palletje();
Modes mode = new Modes();
Punten punten = new Punten();

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
  bal.draw();

  textSize(20);
  fill(1);
  text(tellerLinks, 70, 50);
  text(tellerRechts, width - 70, 50);

  fill(0, 255, 0);
  stroke(0, 255, 0);
  
  pallet.draw();
  switch(gameMode)
    {
    case StartScreen:
      mode.StartScreen();
      break;
    
    case Single:
      bal.balletje();
      pallet.pallet1();
      pallet.palletPC();
      pallet.botsDetectie();
      punten.puntenTeller();
      punten.Winner();
    break;
  
    case Multi:
      bal.balletje();
      pallet.pallet1();
      pallet.pallet2();
      pallet.botsDetectie();
      punten.puntenTeller();
      punten.Winner();
      break;
      
    case WinScreen:
      mode.WinScreen();
      break;
    }
    
  tekenLijnen();
   
}
void tekenLijnen()
{
  for (int i = 0; i<width; i = i +5)
  {
    line(width/2, i, width/2, i );
  }
}