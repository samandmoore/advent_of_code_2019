import 'dart:convert';
import 'dart:io';

class Module {
  final int mass;
  const Module({this.mass});

  int calculateFuelRequired() {
    return (mass / 3).floor() - 2;
  }
}

Future<Iterable<Module>> loadModules(final String filePath) async {
  var lines = await File(filePath).readAsLines(encoding: utf8);
  var modules = lines.map((line) {
    return Module(mass: int.parse(line));
  });
  return Future.value(modules);
}
