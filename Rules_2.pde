public enum Type {
  plant, animal, empty
};

public enum state {
  dead, sick, hungry
};

public final Object [] Rules= new Object []{
  new Object []{new Cell(Type.plant, new state [] {}), 
/*functions that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead}), 
/*functions that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.sick}), 
/*functions that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead, state.sick}), 
/*functions that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.hungry}), 
/*functions that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead, state.hungry}), 
/*functions that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.sick, state.hungry}), 
/*functions that returns a state given an input of around*/  new Object []{
  /*function*/
  
  
  
}}, 
  new Object []{new Cell(Type.plant, new state [] {state.dead, state.sick, state.hungry}), 
/*functions that returns a state given an input of around*/  }, 
};
