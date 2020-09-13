class cell { //<>//
  ArrayList <state> properties=new ArrayList();
  ArrayList <state> nextProperties;
  //state nextProperties;
  float age=0;
  PVector position=new PVector();
  Type type;
  Type nextType;
  ArrayList <cell> neighbours=new ArrayList(); 
  cell(int _x, int _y) {
    //type=Type.values() [floor(noise(noiseScale*_x/sizeX+offsetType.x, noiseScale*_y/sizeY+offsetType.y)*Type.values().length)];
    //status=state.values() [floor(noise(noiseScale*_x/sizeX+offsetState.x, noiseScale*_y/sizeY+offsetState.y)*state.values().length)];
    type=Type.values() [floor(random(0, 1)*Type.values().length)];
    properties.add(state.values() [floor(random(0, 1)*state.values().length)]);    
    position.x=_x;
    position.y=_y;      
    age=floor(noise(-10000+_x, -10000+_y)*5);
    if (type==Type.plant && properties.contains(state.hungry)) {
      properties.remove(state.hungry);
    }
    nextType=type;
    nextProperties=properties;
  }
  void neighbour() {
    for (int i=-1; i<2; i++) {
      for (int I=-1; I<2; I++) {
        if (I!=0 || i!=0) {
          neighbours.add(grid.get(int(((position.x+i+10*sizeX)%sizeX)+((position.y+I+10*sizeY)%sizeY)*sizeX)));
        }
      }
    }
  }
  void drawSelf() {
    noStroke();
    color tint=color(0, 0, 0);
    switch (type) {
    case plant:
      tint=color(0, 200, 0);
      //for (int i=0; i<=properties.size(); i++) {
      //  if (properties.get(i)==state.dead) {
      //    lerpColor(tint, color(300, 0, 0), 0.5);
      //  } else if (properties.get(i)==state.sick) {
      //    lerpColor(tint, color(0, 0, 0), 0.5);
      //  }
      //}
      break;
    case animal:
      tint=color(255, 0, 0);
      //for (int i=0; i<=properties.size(); i++) {
      //  if (properties.get(i)==state.dead) {
      //    lerpColor(tint, color(300, 0, 0), 0.5);
      //  } else if (properties.get(i)==state.sick) {
      //    lerpColor(tint, color(0, 0, 0), 0.5);
      //  }
      //}
      //if (properties==state.alive) {
      //  fill(255, 0, 0);
      //} else if (properties==state.dead) {
      //  fill(180, 45, 45);
      //} else if (properties==state.sick) {
      //  fill(127.5, 0, 0);
      //} else if (properties==state.diseasedDead) {
      //  fill(90, 22.5, 22.5);
      //} else if (properties==state.hungry) {
      //  fill(200, 0, 0);
      //} else {
      //  fill(255, 255, 255);
      //}
      break;
    case empty:
      fill(0, 0, 0);
      break;
    default:
      //fill(255,255,255);
      break;
    }
    for (int i=0; i<properties.size(); i++) {
      if (properties.get(i)==state.dead) {
        lerpColor(tint, color(300, 0, 0), 0.5);
      } else if (properties.get(i)==state.sick) {
        lerpColor(tint, color(0, 0, 0), 0.5);
      }
    }
    if (type!=Type.empty) {
      fill(tint);
    }
    rect(position.x*cellWidth, position.y*cellHeight, cellWidth, cellHeight);
  }



  int count(Type species, Object []...statuses ) {
    int counter=0;
    for (cell neigh : neighbours) {
      if (neigh.properties.contains(statuses) && neigh.type==species) {
        counter++;
      }
    }
    return(counter);
  }


  void change() {
    if (random(0, 20)>1) {
      if (nextProperties==properties && nextType==type) {
        age+=1;
      } else {
        age=0;
      }
    }
    if (random(0, 57)>1) {
      properties=nextProperties;
      type=nextType;
    }
  }
}
