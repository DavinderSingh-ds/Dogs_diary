import 'package:flutter/material.dart';
import 'package:dog_app/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocale(Locale loc) {
    if (!L10n.all.contains(loc)) return;

    _locale = loc;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
