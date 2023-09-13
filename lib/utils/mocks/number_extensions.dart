extension IntExtensions on int {
    int daysToMillis() {
      return this * 24 * 60 * 60 * 1000;
    }
}

extension DoubleExtensions on double {
    double daysToMillis() {
      return this * 24 * 60 * 60 * 1000;
    }
}