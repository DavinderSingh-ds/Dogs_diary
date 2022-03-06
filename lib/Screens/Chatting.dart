import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dog_app/Widgets/Language_picker_widget.dart';

class MessageBox extends StatefulWidget {
  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LanguageWidget(),
            const SizedBox(height: 32),
            Text(
              AppLocalizations.of(context).toString(),
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            MaterialButton(
              color: Colors.amber,
              minWidth: 200,
              height: 50,
              onPressed: () {},
              child: Text('Click'),
            ),
          ],
        ),
      ),
    );
  }
}
