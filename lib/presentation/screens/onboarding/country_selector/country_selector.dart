import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:what_and_where/domain/models/country.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/app_button.dart';
import 'package:what_and_where/presentation/screens/onboarding/country_selector/country_widget.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class CountrySelector extends StatefulWidget {

  final List<Country> countries;
  final Function(Country) onSelected;

  CountrySelector({@required this.countries, this.onSelected});

  @override
  CountrySelectorState createState() => CountrySelectorState();
}

class CountrySelectorState extends State<CountrySelector> {

  final PageController pageController = PageController();
  Country selectedCountry;
  CountrySelectorState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(flex: 2,child: _laeblView),
        Flexible(flex: 4,child: countriesListView),
        Flexible(flex: 1,child: _confirmButton),
      ]
    );
  }

  Widget get _confirmButton {
    return Container(
        alignment: Alignment.topCenter,
        child: AppButton(Translation.confirm,
          onPressed: () => widget.onSelected(selectedCountry)));

  }

  Widget get _laeblView {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Flexible(flex: 4,child: Text(Translation.countrySelectorTitle, style: TextStyles.header2,)),
        SizedBox(height: 16,),
        Flexible(flex: 4,child: Text(Translation.countrySelectorMessage, style: TextStyles.body2, textAlign: TextAlign.center,)),

      ],
    );
  }

  ListWheelScrollView get countriesListView {
    final countries = widget.countries;
    return ListWheelScrollView.useDelegate(
          physics: FixedExtentScrollPhysics(parent: BouncingScrollPhysics()),
            itemExtent: 100,
            onSelectedItemChanged: (i) => _onItemChanged(countries[i]),
            diameterRatio: 0.5,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (c, i) => CountryWidget(country: countries[i], isHighlighted: selectedCountry == countries[i],),
              childCount: countries.length
            )
        );
  }
  
  _onItemChanged(country) {
    setState(() {
      selectedCountry = country;
    });
  }
}
