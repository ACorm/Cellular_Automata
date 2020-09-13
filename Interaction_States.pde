class InteractionStates {
  Cell lookFor;
  Cell change;
  ArrayList <Comparer> comparisons;
  InteractionStates(Cell _lookFor, Cell _change, Comparer... _comparisons) {
    lookFor=_lookFor;
    change=_change;
    for (Comparer item : _comparisons) {
      comparisons.add(item);
    }
  }
}

class Cell {
  Type type;
  ArrayList <propLook> properties;
  Cell(Type _type, propLook ..._properties) {
    type=_type;
    for (propLook item : _properties) {
      properties.add(item);
    }
  }
}

class propLook {
  boolean Is;
  state property;
  propLook( boolean _Is, state _property) {
    Is=_Is;
    property=_property;
  }
}

class Comparer {
  int valueBeforeComparator;
  boolean greaterThan;
  ArrayList <Conditions> allConditions;
  Comparer(int _valueBeforeComparator, boolean _comparator, Conditions..._allConditions) {
    valueBeforeComparator=_valueBeforeComparator;
    greaterThan=_comparator;
    for (Conditions item : _allConditions) {
      allConditions.add(item);
    }
  }
}

class Conditions {
  float value;
  Cell find;
  Conditions(Cell _find, float _value) {
    value=_value;
    find=_find;
  }
}

void test() {
  InteractionStates Test=new InteractionStates(
    new Cell(Type.animal, new propLook (true, state.hungry)), 
    new Cell(Type.animal, new propLook (true, state.dead), new propLook (false, state.hungry) ),
    new Comparer(3, true, new Conditions(new Cell(Type.plant, new propLook (false, state.dead)), 1),new Conditions(new Cell(Type.plant,new propLook (true, state.dead)), 0.5))
    );
}
