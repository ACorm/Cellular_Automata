class CellSpreadType {
  Type type;
  boolean is;
  int rate;
  ArrayList <state> properties;
  CellSpreadType(Type _type, boolean Is, int Rate, state ..._properties) {
    is=Is;
    rate=Rate;
    type=_type;
    for (state item : _properties) {
      properties.add(item);
    }
  }
}

class CellSpreadProperties {
  boolean is;
  int rate;
  ArrayList <state> properties;
  CellSpreadProperties(boolean Is, int Rate, state ..._properties) {
    is=Is;
    rate=Rate;
    for (state item : _properties) {
      properties.add(item);
    }
  }
}

class Transition{
  Transition(){
    
    
    
  }
  
  
  
  
}
