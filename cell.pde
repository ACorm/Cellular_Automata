class Cell {
  Type type;
  ArrayList <state> properties;
  Cell(Type _type, state [] _properties) {
    type=_type;
    for (state item : _properties) {
      properties.add(item);
    }
  }
}

class operator {
  /*function*/
  Type outcomeT;
  state outcomeS;
  boolean remove;
  boolean attribute=false;
  operator(/*function,*/Type _outcomeT, state _outcomeS, boolean _remove) {
    if (_outcomeT!=null) {
      outcomeT=_outcomeT;
    }
    if (_outcomeS!=null) {
      outcomeS=_outcomeS;
      remove=_remove;
      attribute=true;
    }
  }

  void operate(cell temp) {
    if (/*function*/true) {
      if (attribute) {
        if (remove) {
          temp.properties.remove(outcomeS);
        } else {
          temp.properties.add(outcomeS);
        }
      } else {
        temp.type=outcomeT;
      }
    }
  }
}
