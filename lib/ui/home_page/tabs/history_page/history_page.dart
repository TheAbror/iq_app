import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app/ui/home_page/tabs/history_page/clear_history_dialog.dart';
import 'package:iq_app/ui/home_page/tabs/history_page/history_body_item.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  //add shared prefernces

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'History',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              clearHistory(context);
            },
          )
        ],
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        const HistoryBodyItem(
          index: '1',
          date: '04 October, 2023',
          time: '\n 12:00 pm',
          score: '90',
        ),
        const HistoryBodyItem(
          index: '2',
          date: '6 October, 2023',
          time: '\n 01:40 pm',
          score: '78',
        ),
        const HistoryBodyItem(
          index: '3',
          date: '8 October, 2023',
          time: '\n 04:40 pm',
          score: '54',
        ),
        const HistoryBodyItem(
          index: '4',
          date: '10 October, 2023',
          time: '\n 06:40 pm',
          score: '102',
        ),
        const HistoryBodyItem(
          index: '5',
          date: '24 October, 2023',
          time: '\n 05:40 pm',
          score: '57',
        ),
      ],
    );
  }
}
