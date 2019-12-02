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

int recursiveFuelCalc(int mass) {
  var fuelNeeded = fuelCalc(mass);
  if (fuelNeeded < 0) {
    return 0;
  } else {
    return fuelNeeded + recursiveFuelCalc(fuelNeeded);
  }
}

Future<Iterable<Module>> loadModules(final String filePath) async {
  var lines = await File(filePath).readAsLines(encoding: utf8);
  var modules = lines.map((line) {
    return Module(mass: int.parse(line));
  });
  return Future.value(modules);
}
