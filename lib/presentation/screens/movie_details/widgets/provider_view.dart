

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:what_and_where/domain/models/provider.dart';
import 'package:what_and_where/presentation/extensions/extensions.dart';

class ProviderView extends StatelessWidget {

  final Provider provider;

  ProviderView({@required this.provider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: 90,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(flex: 3,child: ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset(provider.type.logo),)),
              Padding(padding: EdgeInsets.only(top: 4),),
              Flexible(flex: 1,child: Text(provider.type.name))
            ],
          )
      ),
    );
  }

  Future<void> onTap() async {
    if (await canLaunch(provider.link)) {
      await launch(provider.link);
    }
  }

}
