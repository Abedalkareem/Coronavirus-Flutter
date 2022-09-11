import 'dart:math';

extension Radians on num {
  double toRadians() {
    return this * pi / 180.0;
  }
}
