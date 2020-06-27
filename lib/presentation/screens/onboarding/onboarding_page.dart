import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/domain/models/country.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/home/home_page.dart';
import 'package:what_and_where/presentation/screens/onboarding/country_selector/country_selector.dart';
import 'package:what_and_where/presentation/screens/onboarding/onboarding_bloc.dart';
import 'package:what_and_where/presentation/screens/onboarding/onboarding_extras.dart';
import 'package:what_and_where/presentation/screens/onboarding/onobarding_item.dart';

class OnboardingPage extends StatelessWidget {

  final pageController = PageController();
  final cs = [Country("USA", "UK"), Country("Russia", "RU"), Country("USA", "UK"), Country("Russia", "RU")];


  static Widget init(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (_) => injector<OnboardingBloc>(),
      child: OnboardingPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    OnboardingBloc bloc = context.bloc();
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (c, state) {
        return BlocListener(
          bloc: bloc,
          listener: (context, state) => onStateChanged(state, context),
          child: _buildPage(context, state),
        );
      },
    );
  }

  Widget _buildPage(BuildContext context, OnboardingState state) {
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
            CountrySelector(countries: cs, onSelected: (c) {
              OnboardingBloc bloc = context.bloc();
              bloc.add(CountrySelected(c));
            },)
          ],
        );
  }


  void onStateChanged(OnboardingState state, BuildContext context) {
    if (state.countrySelected) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomePage.init(c)));
    }
  }

}
