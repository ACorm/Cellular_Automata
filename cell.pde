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
