import 'dart:math';

extension on Random {
  int next(int min, int max) => min + nextInt(max - min);
}