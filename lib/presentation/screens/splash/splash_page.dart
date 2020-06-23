import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/wigets/bottom_loading_indicator.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';
import 'package:what_and_where/presentation/screens/home/home_page.dart';
import 'package:what_and_where/presentation/screens/onboarding/onboarding_page.dart';
import 'package:what_and_where/presentation/screens/splash/splash_extras.dart';
import 'package:what_and_where/utils/logger.dart';
import 'splash_bloc.dart';

class SplashPage extends StatefulWidget {

  static Widget init(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (_) => injector<SplashBloc>(),
      child: SplashPage(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {

  SplashBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.bloc();
    _bloc.add(Init());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (bloc, state) {
        return BlocListener(
          bloc: _bloc,
          listener: (context, state) {
            _onStateChanged(state);
          },
          child: _buildContent(state),
        );
      },
    );
  }


  _onStateChanged(SplashState state) {
    if (state is Loaded) {
      if (state.shouldNavigateToOnboarding) {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (c) => HomePage.init(c)
        ));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (c) => OnboardingPage()
        ));
      }
    }
  }


  Widget _buildContent(SplashState state) {
    logger.d("State $state");
    final isLoading = state is Loading;
    return Scaffold(
      body: isLoading ? _loadingState : Placeholder(color: Colors.red,),
    );
  }

  Widget get _loadingState =>
      Container(
        child: CenteredLoadingIndicator(),
      );

}