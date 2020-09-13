float sizeX=1366/3;
float sizeY=768/3;
float cellWidth;
float cellHeight;
ArrayList <cell> grid = new ArrayList();
boolean run=false;
boolean keyReleased;
float zoom=1;
float noiseScale=30;
PVector offsetType = new PVector(random(0,10000),random(0,10000));
PVector offsetState = new PVector(random(0,10000),random(0,10000));

void setup() {
  frameRate(60);
  fullScreen();
  //size(1000, 500);
  for (int y=0; y<sizeY; y++) {
    for (int x=0; x<sizeX; x++) {
      grid.add(new cell(x, y));
    }
  }
  for (cell square : grid) {
    square.neighbour();
  }
  cellWidth=width/sizeX*zoom;
  cellHeight=height/sizeY*zoom;
}
int day=0;
void draw() {
  for (int r=0; r<1; r++) {
      background(0);
      //print("square");
      rectMode(CORNER);
      for (cell block : grid) {
        block.drawSelf();
      }
    if (keyReleased) {
      //background(0);
      keyReleased=false;
      keyRe();
    }
    if (run) {
      day++;
      println(day);
      for (cell block : grid) {
        check(block);
      }
      for (cell block : grid) {
        block.change();
      }
    }
  }
}

void keyReleased() {
  keyReleased=true;
}
void mouseClicked() {
  //changes the value in the cell you clicked on
  cell temp= grid.get(int(int(mouseX/cellWidth)+int(mouseY/cellHeight)*sizeX));
  if (mouseButton==LEFT) {
    if (mouseX/cellWidth+mouseY/cellHeight*sizeX<=sizeX*sizeX) {
      //temp.properties=state.values() [(temp.properties.ordinal()+1)%state.values().length];
    }
  } else if (mouseButton==RIGHT) {
    temp.type=Type.values() [(temp.type.ordinal()+1)%Type.values().length];
  }
  temp.nextProperties=temp.properties;
  temp.nextType=temp.type;
  temp.age=0;
}
