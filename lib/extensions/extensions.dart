import 'dart:math';

extension RandomExtensions on Random {
  int next(int min, int max) => min + nextInt(max - min);
}

extension StringExtensions on String {
  bool get isNullOrEmpty => this == null || this.isEmpty;
}