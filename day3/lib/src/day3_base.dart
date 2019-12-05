import 'dart:io';

class Point {
  final int x;
  final int y;

  Point({this.x, this.y});

  Point moveBy({int x = 0, int y = 0}) {
    return Point(x: this.x + x, y: this.y + y);
  }

  factory Point.origin() {
    return Point(x: 0, y: 0);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;
}

extension IntString on String {
  int toInt() {
    return int.parse(this);
  }
}

class WireTracer {
  final List<String> steps;
  WireTracer({this.steps});

  Set<Point> toSet() {
    var result = Set<Point>();
    var current = Point.origin();

    for (var step in steps) {
      var direction = step[0];
      var distance = step.substring(1).toInt();
      Point next;
      switch (direction) {
        case "U":
          next = current.moveBy(y: distance);
          break;
        case "D":
          next = current.moveBy(y: -distance);
          break;
        case "L":
          next = current.moveBy(x: -distance);
          break;
        case "R":
          next = current.moveBy(x: distance);
          break;
        default:
          throw "lolwut";
      }

      result.add(next);
      current = next;
    }

    return result;
  }
}

int calculateManhattanDistanceFromOrigin(Point point) {
  return point.x.abs() + point.y.abs();
}

class WireSolver {
  final WireTracer wireOne;
  final WireTracer wireTwo;

  WireSolver({this.wireOne, this.wireTwo});

  factory WireSolver.fromFilePath(String filePath) {
    var lines = File(filePath).readAsLinesSync();
    return WireSolver.fromString(lines);
  }

  factory WireSolver.fromString(List<String> lines) {
    var linesAsSetOfPoints = lines.map((l) {
      return WireTracer(steps: l.split(','));
    });
    var wireOne = linesAsSetOfPoints.elementAt(0);
    var wireTwo = linesAsSetOfPoints.elementAt(1);

    return WireSolver(wireOne: wireOne, wireTwo: wireTwo);
  }

  int findDistanceOfNearestIntersectionToOrigin() {
    var intersection = wireOne.toSet().intersection(wireTwo.toSet());
    var distances = intersection.map((p) {
      return calculateManhattanDistanceFromOrigin(p);
    }).toList(growable: false);

    distances.sort();

    return distances.first;
  }
}
