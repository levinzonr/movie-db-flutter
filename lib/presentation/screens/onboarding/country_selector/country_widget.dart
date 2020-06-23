import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/country.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';

class CountryWidget extends StatelessWidget {
  final Country country;
  final bool isHighlighted;

  CountryWidget({@required this.country, @required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Text(country.displayName, style: _textStyle ,));
  }

  TextStyle get _textStyle {
    return isHighlighted ? TextStyles.header2 : TextStyles.body2;
  }
}
