class InteractionStates {
  Cell lookFor;
  Cell change;
  int valueBeforeComparator;
  boolean comparator;
  ArrayList <Conditions> allConditions;

  InteractionStates(Cell _lookFor, Cell _change, int _valueBeforeComparator, boolean _comparator, Conditions..._allConditions) {
    lookFor=_lookFor;
    change=_change;
    valueBeforeComparator=_valueBeforeComparator;
    comparator=_comparator;
    for (Conditions item : _allConditions) {
      allConditions.add(item);
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

class Conditions {
  float value;
  Cell find;
  Conditions(Cell _find, float _value) {
    value=_value;
    find=_find;
  }
}

void test() {
  InteractionStates Test=new InteractionStates(new Cell(Type.animal, new propLook (true, state.hungry)), 

    new Cell(Type.animal, new propLook (true, state.dead), new propLook (false, state.hungry) ));
}
