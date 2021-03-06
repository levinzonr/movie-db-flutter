


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/common/app_colors.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/common/wigets/app_bar.dart';
import 'package:what_and_where/presentation/screens/settings/components/settings_button.dart';
import 'package:what_and_where/presentation/screens/settings/settings_bloc.dart';
import 'package:what_and_where/presentation/screens/settings/settings_event.dart';
import 'package:what_and_where/presentation/screens/settings/settings_state.dart';
import 'package:what_and_where/presentation/translations/translations.dart';
import 'package:what_and_where/utils/logger.dart';

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
  void initState() {
    super.initState();
    SettingsBloc bloc = context.bloc();
    bloc.add(Init());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (c, s) => _buildContent(s),
    );
  }


  Widget _buildContent(SettingsState state) {
    logger.d("Settings State: ${state.country}");
    return Scaffold(
      appBar: MyAppBar(context),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SettingsButton(
              text: "About",
              icon: Icons.info_outline,
              onTap: () => showAboutDialog(context: context, applicationIcon: Icon( Icons.movie_filter)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SettingsButton(
              text: "Current Locale",
              icon: Icons.language,
              onTap: () => {},
              value: state.country?.displayName,
            ),
          )
        ],
      ),
    );
  }
}
