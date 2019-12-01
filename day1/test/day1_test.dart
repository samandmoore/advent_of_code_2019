import 'package:day1/day1.dart';
import 'package:test/test.dart';

void main() {
  group("calculateTotalFuelRequired", () {
    test('calculate fuel for mass of 14', () {
      var module = Module(mass: 14);
      expect(module.calculateTotalFuelRequired(), 2);
    });

    test('calculate fuel for mass of 1969', () {
      var module = Module(mass: 1969);
      expect(module.calculateTotalFuelRequired(), 966);
    });

    test('calculate total fuel required', () async {
      var modules = await loadModules("data/day1.input.txt");
      var totalFuel = modules.map((m) {
        return m.calculateTotalFuelRequired();
      }).reduce((a, b) {
        return a + b;
      });
      expect(totalFuel, 5088037);
    });
  });

  group("calculateInitialFuelRequired", () {
    test('calculate fuel for mass of 12', () {
      var module = Module(mass: 12);
      expect(module.calculateInitialFuelRequired(), 2);
    });

    test('calculate fuel for mass of 14', () {
      var module = Module(mass: 14);
      expect(module.calculateInitialFuelRequired(), 2);
    });

    test('calculate fuel for mass of 1969', () {
      var module = Module(mass: 1969);
      expect(module.calculateInitialFuelRequired(), 654);
    });

    test('calculate fuel for mass of 100756', () {
      var module = Module(mass: 100756);
      expect(module.calculateInitialFuelRequired(), 33583);
    });

    test('calculate total fuel required', () async {
      var modules = await loadModules("data/day1.input.txt");
      var totalFuel = modules.map((m) {
        return m.calculateInitialFuelRequired();
      }).reduce((a, b) {
        return a + b;
      });
      expect(totalFuel, 3393938);
    });
  });
}
