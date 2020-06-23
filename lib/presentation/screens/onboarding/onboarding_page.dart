import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/country.dart';
import 'package:what_and_where/presentation/screens/home/home_page.dart';
import 'package:what_and_where/presentation/screens/onboarding/country_selector/country_selector.dart';
import 'package:what_and_where/presentation/screens/onboarding/onobarding_item.dart';

class OnboardingPage extends StatelessWidget {

  final pageController = PageController();
  final cs = [Country("USA", "UK"), Country("Russia", "RU"), Country("USA", "UK"), Country("Russia", "RU")];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: _pageView(context),
        ),
      ),
    );
  }

  PageView _pageView(BuildContext context) {
    return PageView(
          controller: pageController,
          pageSnapping: true,
          children: <Widget>[
            OnboardingItem(title: "Hello", message: "sadsad sd asd sad ads das", child: Icon(Icons.access_time),),
            OnboardingItem(title: "Hello", message: "sadsad sd asd sad ads das", child: Icon(Icons.access_time),),
            CountrySelector(countries: cs, onSelected: (c) => {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomePage.init(c)))
            },)
          ],
        );
  }

}
