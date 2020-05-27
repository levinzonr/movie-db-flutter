

import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/movie.dart';

extension MovieExtension on Movie {
  Color get metascoreColor {
    if (metascore < 50) {
      return Colors.red;
    } else if (metascore < 80) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}