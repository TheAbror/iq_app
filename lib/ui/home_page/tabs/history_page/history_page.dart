import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app/ui/home_page/tabs/history_page/clear_history_dialog.dart';

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

class HistoryBodyItem extends StatelessWidget {
  final String index;
  final String score;
  final String date;
  final String time;

  const HistoryBodyItem({
    Key? key,
    required this.index,
    required this.score,
    required this.date,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          index,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        'Score: $score',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        date + time,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
