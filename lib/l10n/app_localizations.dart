import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Merchant App',
      'Profile': 'Profile',
      'fullname': 'Desalegn Birhanu',
      'dashboardTitle': 'Dashboard',
      'companyName': 'Company Name',
      'merchantAccountNumber': 'Merchant Account Number',
      'merchantId': 'Merchant ID',
      'totalEarn': 'Total Earn',
      'more': 'More',
    },
    'am':  {
      'appTitle': 'ንግድ መተግበሪያ',
      'Profile': 'መርጃ',
      'fullname': 'ደሳለኝ ብርሃኑ',
      'dashboardTitle': 'መግቢያ ገጽ',
      'companyName': 'ኩባንያ ስም',
      'merchantAccountNumber': 'ንግድ አካውንት ቁጥር',
      'merchantId': 'ንግድ መታወቂያ',
      'totalEarn': 'ጠቅላላ ትርፍ',
      'more': 'ተጨማሪ',
    },
  };

  String? translate(String key) {
    return _localizedValues[locale.languageCode]?[key];
  }
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'am'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
