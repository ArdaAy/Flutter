main(){
  PowerGrid grid = new PowerGrid();
  
  NuclearPlant nuclear = new NuclearPlant();
  SolarPlant solar = new SolarPlant();
  
  grid.addPlant(nuclear);
  grid.addPlant(solar);
}

class PowerGrid {
  List<PowerPlant> connectedPlants = [];
  
  addPlant(PowerPlant plant){
    bool confirmation = plant.turnOn('5 hours');
    connectedPlants.add(NuclearPlant());
  }
}

abstract class PowerPlant {
  int costIfEnergy;
  
  
  bool turnOn(String duration);
}

class NuclearPlant implements PowerPlant {
  int costIfEnergy;
  bool turnOn(String timeToStayOn){
    print('Im a nuclear plant turning on');
    return true;
  }
}

class SolarPlant implements PowerPlant {
  int costIfEnergy;
  bool turnOn(String howLongOn){
    print('Im a solar plant turning on');
    return true;
  }
}