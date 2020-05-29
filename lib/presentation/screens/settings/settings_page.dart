


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:what_and_where/injection/injector.dart';
import 'package:what_and_where/presentation/screens/settings/settings_bloc.dart';

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
    return Placeholder(color: Colors.green,);gi
  }
}