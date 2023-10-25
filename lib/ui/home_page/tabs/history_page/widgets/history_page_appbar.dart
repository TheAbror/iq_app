import 'package:flutter/material.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/history_page/clear_history_dialog.dart';

AppBar historyPageAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.historyPageColor,
    elevation: 1,
    title: const Text(
      'History',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.delete,
        ),
        onPressed: () {
          clearHistory(context);
        },
      )
    ],
  );
}
