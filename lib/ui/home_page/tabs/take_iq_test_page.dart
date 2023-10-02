import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TakeIQTest extends StatefulWidget {
  const TakeIQTest({super.key});

  @override
  State<TakeIQTest> createState() => _TakeIQTestState();
}

class _TakeIQTestState extends State<TakeIQTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black, // <-- SEE HERE
        ),
        title: const Text(
          'Topic: Countries',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Container(
              height: 300,
              width: double.infinity,
              margin: EdgeInsets.only(left: 16.w, right: 16.w),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(),
              ),
            ),
            SizedBox(height: 40.h),
            const AnwerItem(
              letter: 'A) ',
              text: 'Spain',
            ),
            const AnwerItem(
              letter: 'B) ',
              text: 'France',
            ),
            const AnwerItem(
              letter: 'C) ',
              text: 'England',
            ),
            const AnwerItem(
              letter: 'D) ',
              text: 'USA',
            ),
          ],
        ),
      ),
    );
  }
}

class AnwerItem extends StatelessWidget {
  final String letter;
  final String text;

  const AnwerItem({
    Key? key,
    required this.letter,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 15.h),
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          Text(
            letter,
            style: TextStyle(fontSize: 24.sp),
          ),
          Text(
            text,
            style: TextStyle(fontSize: 24.sp),
          ),
        ],
      ),
    );
  }
}
