import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/provider.dart';
import 'package:what_and_where/presentation/common/text_styles.dart';
import 'package:what_and_where/presentation/screens/movie_details/widgets/provider_view.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

class ProvidersSection extends StatelessWidget {

  final List<Provider> providers;

  ProvidersSection({@required this.providers});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(padding: EdgeInsets.only(left: 16), child: Text(Translation.availableOn, style: TextStyles.header2,), width: double.infinity,),
          Padding(padding: EdgeInsets.only(top: 16)),
          Container(child: providersContainer, width: double.infinity,),
        ],
      )
    );
  }

  Container get providersContainer {
    final widgets = providers.map((e) => ProviderView(provider: e,)).toList();
    return Container (
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: widgets
        )
    );
  }

  GridView get _providersGridView =>
      GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: providers.map((e) => ProviderView(provider: e,)).toList(),
      );

}