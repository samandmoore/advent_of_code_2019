import 'dart:convert';
import 'dart:io';

class Module {
  final int mass;
  const Module({this.mass});

  int calculateInitialFuelRequired() {
    return fuelCalc(mass);
  }

  int calculateTotalFuelRequired() {
    return recursiveFuelCalc(mass);
  }
}

int fuelCalc(int mass) {
  return (mass / 3).floor() - 2;
}

int recursiveFuelCalc(int mass, {int carryOverFuel = 0}) {
  var additionalFuel = fuelCalc(mass);
  if (additionalFuel <= 0) {
    return carryOverFuel;
  } else {
    return recursiveFuelCalc(additionalFuel,
        carryOverFuel: carryOverFuel + additionalFuel);
  }
}

Future<Iterable<Module>> loadModules(final String filePath) async {
  var lines = await File(filePath).readAsLines(encoding: utf8);
  var modules = lines.map((line) {
    return Module(mass: int.parse(line));
  });
  return Future.value(modules);
}
