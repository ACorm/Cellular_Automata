//void check(cell This) {
//  switch(This.type) {
//  case plant:
//    checkPlant(This);
//    break;
//  case animal:
//    checkAnimal(This);
//    break;
//  case empty:
//    checkEmpty(This);
//    break;
//  }
//}

////alivePlant
////deadPlant
////diseasedAlivePlant
////diseasedDeadPlant
////hungryPlant
////aliveAnimal
////deadAnimal
////diseasedAliveAnimal
////diseasedDeadAnimal
////hungryAnimal
////aliveEmpty
////deadEmpty
////diseasedAliveEmpty
////diseasedDeadEmpty
////hungryEmpty

//void checkPlant(cell This) {
//  neighbouringCells around=new neighbouringCells(This);
//  switch(This.properties) {
//  case alive:

//    //deadPlant <- eaten <- aliveAnimal
//    //diseasedAlivePlant <- infected <- overcrowding || deadAnimal <- diseasedAlivePlant || diseasedDeadPlant || diseasedDeadAnimal
//    //diseasedDeadPlant <- eaten + infected <- diseasedAliveAnimal
//    //Empty <- over eaten<- hungryAnimal
//    if (around.aliveAnimal>2 && around.food>3) {
//      This.nextProperties=state.alive;
//      This.nextType=Type.animal;
//    } else if (around.aliveAnimal>3) {
//      This.nextProperties=state.dead;
//    } else if (around.diseasedAlivePlant>4 || around.diseasedDeadPlant>6 || around.diseasedDeadAnimal>3) {
//      This.nextProperties=state.sick;
//    } else if (around.diseasedAliveAnimal>4) {
//      This.nextProperties=state.diseasedDead;
//    } else if (around.hungryAnimal>2) {
//      This.nextType=Type.empty;
//    }

//    break;
//  case dead:

//    //alivePlant <- regrow <- alivePlant >4
//    //diseasedAlivePlant <- infected <- overcrowding || deadAnimal <- diseasedAlivePlant || diseasedDeadPlant || diseasedDeadAnimal
//    //diseasedDeadPlant <- eaten + infected <- diseasedAliveAnimal
//    //Empty <- over eaten<- hungryAnimal
//    if (around.alivePlant>2) {
//      This.nextProperties=state.alive;
//    } else if (around.diseasedAlivePlant>4 || around.diseasedDeadPlant>6 || around.diseasedDeadAnimal>3) {
//      This.nextProperties=state.diseasedDead;
//    } else if (around.diseasedAliveAnimal>4) {
//      This.nextProperties=state.diseasedDead;
//    } else if (around.hungryAnimal>2) {
//      This.nextType=Type.empty;
//    }

//    break;
//  case sick:

//    //diseasedDeadPlant <- eaten <- aliveAnimal
//    //diseasedDeadPlant <- eaten + infected <- diseasedAliveAnimal
//    //Empty <- over eaten<- hungryAnimal
//    //Empty <- Plague <- age
//    if (around.aliveAnimal>3) {
//      This.nextProperties=state.diseasedDead;
//    } else if (around.diseasedAliveAnimal>4) {
//      This.nextProperties=state.diseasedDead;
//    } else if (This.age>10) {
//      This.nextProperties=state.diseasedDead;
//    } else if (around.hungryAnimal>2) {
//      This.nextType=Type.empty;
//    } else if (around.alivePlant>3) {
//      This.nextProperties=state.alive;
//    }

//    break;
//  case diseasedDead:

//    //diseasedAlivePlant <- regrow <- alivePlant >4    
//    //Empty <- over eaten<- hungryAnimal
//    //Empty <- Plague <- age
//    if (around.alivePlant>2) {
//      This.nextProperties=state.sick;
//    } else if (around.hungryAnimal>2 || This.age>5) {
//      This.nextType=Type.empty;
//    }

//    break;
//  case hungry:

//    //Illogical act as alive
//    This.properties=state.alive;
    
//    break;
//    default:
    
//    println("null");
//    This.properties=state.alive;
    
//    break;
//  }
//}

//void checkAnimal(cell This) {
//  neighbouringCells around=new neighbouringCells(This);
//  switch(This.properties) {
//  case alive:

//    //deadAnimal <-age
//    //diseasedAliveAnimal <- overpopulation + old< age && AliveAnimal || diseasedAliveAnimal || diseasedDeadAnimal
//    //hungryAnimal <- lack of food <- food cancelled by society not being hungry || in a society hungry
//    if (This.age>10) {
//      This.nextProperties=state.dead;
//    } else if (around.disease>3) {
//      This.nextProperties=state.sick;
//    } else if ((around.food<2 || (around.hungryAnimal+around.diseasedAliveAnimal)>3) && around.aliveAnimal<1) {
//      This.nextProperties=state.hungry;
//    }
//    if (around.diseasedAlivePlant>around.alivePlant) {
//      This.nextProperties=state.sick;
//    }

//    break;
//  case dead:

//    //alivePlant <-alivePlant
//    //diseasedDeadAnimal <- overpopulation + old< age && AliveAnimal || diseasedAliveAnimal || diseasedDeadAnimal
//    //diseasedAlivePlant<-diseasedAlivePlant
//    //empty<-age
//    if (around.alivePlant>2) {
//      This.nextProperties=state.alive;
//      This.nextType=Type.plant;
//    } else if (around.disease>3) {
//      This.nextProperties=state.diseasedDead;
//    } else if (around.diseasedAlivePlant>3) {
//      This.nextProperties=state.sick;
//      This.nextType=Type.plant;
//    } else if (This.age>100) {
//      This.nextType=Type.empty;
//    } else if (around.alivePlant>0) {
//      This.nextProperties=state.alive;
//      This.nextType=Type.plant;
//    }

//    break;
//  case sick:

//    //deadAnimal <-age
//    if (This.age>4) {
//      This.nextProperties=state.diseasedDead;
//    }


//    break;
//  case diseasedDead:

//    //diseasedAlivePlant <-alivePlant || diseasedAlivePlant
//    //empty<-age
//    if ((around.diseasedAlivePlant+around.alivePlant)>2) {
//      This.nextProperties=state.sick;
//      This.nextType=Type.plant;
//    } else if (This.age<80) {
//      This.nextType=Type.empty;
//    } else if (around.alivePlant>0) {
//      This.nextProperties=state.alive;
//      This.nextType=Type.plant;
//    }

//    break;
//  case hungry:

//    //deadAnimal <-age
//    //diseasedAliveAnimal <- overpopulation + old< age && AliveAnimal || diseasedAliveAnimal || diseasedDeadAnimal
//    //aliveAnimal <- food <- aliveAnimal
//    if (This.age>30) {
//      This.nextProperties=state.dead;
//    } else if (around.disease>6) {
//      This.nextProperties=state.sick;
//    } else if ((around.food>4 || around.aliveAnimal>3) && (around.hungryAnimal+around.diseasedAliveAnimal)<2) {
//      This.nextProperties=state.alive;
//    }

//    break;
//  }
//}

//void checkEmpty(cell This) {
//  neighbouringCells around=new neighbouringCells(This);

//  //diseasedAlivePlant <- regrowth <- diseasedAlivePlant
//  //aliveAnimal <- birth <- aliveAnimal + alivePlant
//  //diseasedAliveAnimal <- birth <- diseasedAliveAnimal + alivePlant
//  //alivePlant<- regrowth <-alivePlant
//  if (around.diseasedAlivePlant>2) {
//    This.nextProperties=state.sick;
//    This.nextType=Type.plant;
//  } else if (around.aliveAnimal>2 && around.alivePlant>1) {
//    This.nextProperties=state.alive;
//    This.nextType=Type.animal;
//  } else if ((around.diseasedAliveAnimal+around.aliveAnimal)>2 && around.alivePlant>1) {
//    This.nextProperties=state.sick;
//    This.nextType=Type.animal;
//  } else if (around.alivePlant>0) {
//    This.nextProperties=state.alive;
//    This.nextType=Type.plant;
//  }
//}

//int count(state living, Type species, ArrayList <cell> neighbours) {
//  int counter=0;
//  for (cell neigh : neighbours) {
//    if (neigh.properties==living && neigh.type==species) {
//      counter++;
//    }
//  }
//  return(counter);
//}

//public class neighbouringCells {
//  int alivePlant;
//  int deadPlant;
//  int diseasedAlivePlant;
//  int diseasedDeadPlant;
//  int hungryPlant;
//  int aliveAnimal;
//  int deadAnimal;
//  int diseasedAliveAnimal;
//  int diseasedDeadAnimal;
//  int hungryAnimal;
//  int aliveEmpty;
//  int deadEmpty;
//  int diseasedAliveEmpty;
//  int diseasedDeadEmpty;
//  int hungryEmpty;
//  int plants;
//  int animals;
//  int empty;
//  int disease;
//  float food;
//  neighbouringCells(cell This) {
//    alivePlant = count(state.alive, Type.plant, This.neighbours);
//    deadPlant = count(state.dead, Type.plant, This.neighbours);
//    diseasedAlivePlant = count(state.sick, Type.plant, This.neighbours);
//    diseasedDeadPlant = count(state.diseasedDead, Type.plant, This.neighbours);
//    hungryPlant = count(state.hungry, Type.plant, This.neighbours);
//    aliveAnimal = count(state.alive, Type.animal, This.neighbours);
//    deadAnimal = count(state.dead, Type.animal, This.neighbours);
//    diseasedAliveAnimal = count(state.sick, Type.animal, This.neighbours);
//    diseasedDeadAnimal = count(state.diseasedDead, Type.animal, This.neighbours);
//    hungryAnimal = count(state.hungry, Type.animal, This.neighbours);
//    aliveEmpty = count(state.alive, Type.empty, This.neighbours);
//    deadEmpty = count(state.dead, Type.empty, This.neighbours);
//    diseasedAliveEmpty = count(state.sick, Type.empty, This.neighbours);
//    diseasedDeadEmpty = count(state.diseasedDead, Type.empty, This.neighbours);
//    hungryEmpty = count(state.hungry, Type.empty, This.neighbours);
//    plants=alivePlant+deadPlant+diseasedAlivePlant+diseasedDeadPlant+hungryPlant;
//    animals=aliveAnimal+deadAnimal+diseasedAliveAnimal+diseasedDeadAnimal+hungryAnimal;
//    empty=aliveEmpty+deadEmpty+diseasedAliveEmpty+diseasedDeadEmpty+hungryEmpty;
//    disease=diseasedAliveAnimal+diseasedDeadAnimal*6+diseasedAlivePlant+diseasedDeadPlant*4;
//    food=alivePlant+deadPlant*0.5+diseasedAlivePlant*0.5+diseasedDeadPlant*0.25+hungryPlant;
//  }
//}


////void checkRule1(cell This) {
////  switch(This.type) {
////  case plant:
////    if (This.status==state.alive) {
////      if (count(state.alive, Type.animal, This.neighbours)>3) {
////        if (count(state.alive, Type.plant, This.neighbours)>2) {
////          This.nextType=Type.animal;
////        } else {
////          This.nextType=Type.empty;
////        }
////      } else if (count(state.alive, Type.animal, This.neighbours)==1 && This.age>1) {
////        This.nextState=state.dead;
////      }
////    } else {
////      if (count(state.alive, Type.plant, This.neighbours)>2 && This.age>4) {
////        This.nextState=state.alive;
////      }
////      if (count(state.alive, Type.animal, This.neighbours)>1) {
////        if (count(state.alive, Type.plant, This.neighbours)>2) {
////          This.nextType=Type.animal;
////          This.nextState=state.alive;
////        } else {
////          This.nextType=Type.empty;
////        }
////      }
////    }
////    break;
////  case animal:
////    if (This.status==state.alive) {
////      if (count(state.alive, Type.plant, This.neighbours)<1 && This.age>3) {
////        This.nextState=state.dead;
////      }
////      if (count(state.dead, Type.animal, This.neighbours)>20/This.age) {
////        This.nextState=state.dead;
////      }
////    } else {
////      if (count(state.alive, Type.plant, This.neighbours)>0 && This.age>3) {
////        This.nextType=Type.plant;
////        This.nextState=state.alive;
////      } else if (This.age>4) {
////        This.nextType=Type.empty;
////      }
////      //if(eaten){

////      //}
////    }
////    break;
////  case empty:
////    if (count(state.alive, Type.animal, This.neighbours)>1 && count(state.alive, Type.plant, This.neighbours)>2) {
////      This.nextType=Type.animal;
////      This.nextState=state.alive;
////    }
////    if (count(state.alive, Type.plant, This.neighbours)+count(state.dead, Type.plant, This.neighbours)/4>2 && This.age>6) {
////      This.nextType=Type.plant;
////      This.nextState=state.alive;
////    }
////    break;
////  }
////}


////if (count(true, Type.animal)>1 && count(true, Type.plant)>2) {
////  nextType=Type.animal;
////  nextState=true;
////}














////switch(type) {
////case plant:
////  if (alive) {
////    if (count(true, Type.animal)>1 && count(true, Type.plant)>2) {
////      nextType=Type.animal;
////    } else {          
////      if (count(true, Type.animal)!=0) {
////        nextState=false;
////      }
////    }
////  } else {
////    if (count(true, Type.plant)>0) {
////      if(age>0){
////      nextState=true;
////      }
////    } else {
////      nextType=Type.empty;
////    }
////  }
////  break;
////case animal:
////  if (alive) {
////    if (count(true, Type.animal)-count(true, Type.plant)>2) {
////      nextState=false;
////    } else if (count(false, Type.animal)>4) {
////      nextState=false;
////    } else if (count(true, Type.plant)==0) {
////      nextState=false;
////    }else if(age>10){
////      nextState=false;
////    }
////  } else {
////    if (count(true, Type.plant)>1 && age>5) {
////      nextType=Type.plant;
////      nextState=true;
////    } else {
////      if (age>7) {
////        nextType=Type.empty;
////      }
////    }
////  }
////  break;
////case empty:
////  if (count(true, Type.plant)>2) {
////    nextType=Type.plant;
////    nextState=true;
////  } else if (count(true, Type.animal)>4) {
////    nextType=Type.animal;
////    nextState=true;
////  }
////  break;
////}
