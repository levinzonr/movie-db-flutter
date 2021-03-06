import 'package:flutter/material.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/screens/home/home_page.dart';
import 'package:what_and_where/presentation/screens/splash/splash_page.dart';
import 'package:what_and_where/presentation/translations/translations.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: Translation.appName,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.darkGrey,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashPage.init(context),
    );
  }
}