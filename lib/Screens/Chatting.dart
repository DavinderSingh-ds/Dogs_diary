import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../Widgets/Language_picker_widget.dart';

class MessageBox extends StatefulWidget {
  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LanguageWidget(),
              const SizedBox(height: 32),
              Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.hello('Davinder Singh'),
                style: TextStyle(fontSize: 36),
              ),
            ],
          ),
        ),
      );
}
