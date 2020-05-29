

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';

class ShimmerTextPlaceHolder extends StatelessWidget {

  final double width;
  ShimmerTextPlaceHolder({this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.almostBlack,
      highlightColor: AppColors.blackish,
      child: Container(
        height: 10,
        width: width,
        color: AppColors.almostBlack
      ),
    );
  }
}