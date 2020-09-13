public final InteractionStates [] Rules=new InteractionStates []{
  new InteractionStates(
    /*the cell you are looking for*/ new Cell(Type.animal, new propLook (true, state.hungry)),
    /*the cell you will become*/ new Cell(Type.animal, new propLook (true, state.dead), new propLook (false, state.hungry)),
    /*the comparison you will make*/ new Comparer(3, true, new Conditions(new Cell(Type.plant, new propLook (false, state.dead)), 1), new Conditions(new Cell(Type.plant, new propLook (true, state.dead)), 0.5))
    )
  
  
};
