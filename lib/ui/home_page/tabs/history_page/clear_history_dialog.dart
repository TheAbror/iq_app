import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

Future<dynamic> clearHistory(BuildContext context) {
  return showPlatformDialog(
    context: context,
    builder: (context) => BasicDialogAlert(
      title: const Text('Clear History?'),
      content: const Text('Do you want to delete all records permanently'),
      actions: <Widget>[
        BasicDialogAction(
          title: const Text('Yes'),
          onPressed: () {
            //todo clear only history
            // PreferencesServices.clearAll().then((value) {
            //   if (value) {
            //     Navigator.pushNamed(context, AppRoutes.splashPage);
            //   }
            // });
          },
        ),
        BasicDialogAction(
          title: const Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
