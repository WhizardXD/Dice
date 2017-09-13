int diceSize = 20;
int numDice = 1;
int[] totals = new int[10000];
int sumTotals = 0;
void setup()
{
  noLoop();
  size(1200, 1000);
}
void draw()
{
  background(200);
  int total = 0;
  for (int x = diceSize;x<=1000-diceSize;x+=diceSize){
  	for (int y = diceSize; y<=1000-diceSize;y+=diceSize){
  		Die d = new Die(x,y);
  		d.roll();
  		d.show();
  		total += d.getNum();
  	}
  }
  System.out.println(total);
  fill(255,255,255);
  text("Total: " + total, 1000, 100);
}
void mousePressed()
{
  redraw();
}
class Die //models one single dice cube
{
  int x, y, num = (int)(Math.random()*6)+1;
  Die(int x1, int y1) //constructor
  {
    x=x1;
    y=y1;
  }
  void roll()
  {
    num = (int)(Math.random()*6)+1;
  }
  void show()
  {
    fill(#FFF2D1);
    rectMode(CENTER);
    rect(x, y, diceSize, diceSize);
    if (num == 1 || num == 3 || num == 5)
      ellipse(x, y, diceSize/5, diceSize/5); 
    if (num == 2 || num == 3 || num == 4 || num == 5 || num == 6) { 
      ellipse(x - diceSize/4, y - diceSize/4, diceSize/5, diceSize/5);
      ellipse(x + diceSize/4, y + diceSize/4, diceSize/5, diceSize/5);
    }
    if (num == 4 || num == 5 || num == 6) {
      ellipse(x - diceSize/4, y + diceSize/4, diceSize/5, diceSize/5);
      ellipse(x + diceSize/4, y - diceSize/4, diceSize/5, diceSize/5);
    }
    if (num == 6) {
      ellipse(x, y - diceSize/4, diceSize/5, diceSize/5);
      ellipse(x, y + diceSize/4, diceSize/5, diceSize/5);
    }
  }
  int getNum(){
  	return num;
  }
}