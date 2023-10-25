// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/preference_services/preference_services.dart';
import 'package:iq_app_mobile/core/preference_services/shpref_keys.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/history_page/clear_history_dialog.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/history_page/history_body_item.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/history_page/widgets/history_page_appbar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Future<List<String>?>? _resultFuture;
  Future<List<String>?>? _resultDateFuture;

  @override
  void initState() {
    super.initState();
    _resultFuture = PreferencesServices().getStringList(ShPrefKeys.resultList);
    _resultDateFuture = PreferencesServices().getDatesList(ShPrefKeys.dateList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: historyPageAppBar(context),
      body: FutureBuilder<List<String>?>(
        future: _resultFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.data?.length == 0) {
            return Center(
              child: Text('No Records Found'),
            );
          } else {
            List<String>? result = snapshot.data;
            return ListView.builder(
              itemCount: result?.length ?? 0,
              itemBuilder: (context, index) {
                return FutureBuilder<List<String>?>(
                  future: _resultDateFuture,
                  builder: (context, dateSnapshot) {
                    if (dateSnapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (dateSnapshot.hasError) {
                      return Text('Error: ${dateSnapshot.error}');
                    } else {
                      List<String>? dates = dateSnapshot.data;
                      return HistoryBodyItem(
                        index: '1',
                        date: dates?[index] ?? '',
                        time: '\n 12:00 pm',
                        score: result![index],
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
