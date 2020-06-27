

import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class ShimmerProviderSection extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(child: Text(Translation.availableOn, style: TextStyles.header2,), width: double.infinity,),
        Padding(padding: EdgeInsets.only(top: 16)),
        Container(child: _providersContainer, width: double.infinity,),
      ],
    );
  }

  Widget get _providersContainer {
    return AppShimmer.fromAppColors (
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 16,
        spacing: 12,
        children: List.generate(5, (index) {
           return ClipRRect(borderRadius: BorderRadius.circular(12),
           child: Container(width: 80, height: 90, color: AppColors.almostBlack,));
        }),
      ),
    );
  }
}