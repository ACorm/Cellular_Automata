public enum Type {
  plant, animal, empty
};

public enum state {
  dead, sick, hungry
};

public final Object [] Rules= new Object []{
  new Object []{new Cell(Type.plant, new state [] {}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.sick}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead, state.sick}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.hungry}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead, state.hungry}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.sick, state.hungry}), 
/*function that returns a state given an input of around*/  }, 
  new Object []{new Cell(Type.plant, new state [] {state.dead, state.sick, state.hungry}), 
/*function that returns a state given an input of around*/  }, 
};
