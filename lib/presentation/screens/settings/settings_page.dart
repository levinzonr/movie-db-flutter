


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/app_bar.dart';
import 'package:what_and_where/presentation/screens/settings/components/settings_button.dart';
import 'package:what_and_where/presentation/screens/settings/settings_bloc.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class SettingsPage extends StatefulWidget {

  static Widget init(BuildContext context) => BlocProvider<SettingsBloc>(
    create: (_) => injector<SettingsBloc>(),
    child: SettingsPage(),
  );


  @override
  State createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context),
      body: Column(
        children: <Widget>[
          SettingsButton(
            text: "About",
            onTap: () => showAboutDialog(context: context, applicationIcon: Icon( Icons.movie_filter)),
          )
        ],
      ),
    );
  }
}
