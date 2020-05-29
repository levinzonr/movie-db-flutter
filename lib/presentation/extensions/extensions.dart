import 'package:flutter/material.dart';
import 'package:what_and_where/domain/models/movie.dart';
import 'package:what_and_where/domain/models/provider_type.dart';
import 'package:what_and_where/presentation/translations/translations.dart';

extension MovieExtension on Movie {
  Color get metascoreColor {
    if (metascore < 50) {
      return Colors.red;
    } else if (metascore < 80) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}

extension Routes on BuildContext {
  pushTo(widget) {
    Navigator.push(
        this,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}

extension ColorExtenstions on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ContentProviderExtensions on ProviderType {
  String get logo {
    switch (this) {
      case ProviderType.amazonPrime:
        {
          return "assets/logo_amazon.png";
        }
      case ProviderType.netflix:
        {
          return "assets/logo_netflix.jpeg";
        }
      case ProviderType.disneyPlus:
        {
          return "assets/logo_disney.png";
        }
      case ProviderType.hbo:
        {
          return "assets/logo_hbo.png";
        }
      default:
        return "assets/logo_disney.png";
    }
  }

  String get name {
    switch (this) {
      case ProviderType.amazonPrime:
        return Translation.providerAmazonPrime;
      case ProviderType.disneyPlus:
        return Translation.providerDisney;
      case ProviderType.hbo:
        return Translation.providerHboGO;
      case ProviderType.netflix:
        return Translation.providerNetflix;
      default:
        return "_Unknown provider";
    }
  }
}
