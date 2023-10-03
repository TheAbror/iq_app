import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TakeIQTest extends StatefulWidget {
  const TakeIQTest({super.key});

  @override
  State<TakeIQTest> createState() => _TakeIQTestState();
}

List<String> myQuestionsList = [
  'What is the square root of 144',
  'What is the next number in the sequence: 1, 4, 9, 16, 25, ___?',
  'What is the capital city of Australia?',
  'If a train travels at a speed of 60 mph for 2 hours, how far has it traveled?',
  'What is the chemical symbol for gold?',
  'Which planet in our solar system is known as the “Red Planet”?',
  'What is the largest mammal in the world?',
  'What is the smallest country in the world by land area?',
  'Who wrote the novel “To Kill a Mockingbird”?',
  'Which year did World War II end?',
];

List<String> myAnswersList = [
  '12',
  '36',
  'Canberra',
  '120 miles',
  'Au',
  'Mars',
  'Blue Whale',
  'Vatican City',
  'Harper Lee',
  '1945',
];
// List<String> myOptionsList = [
//    {
//     ''
//   }
//   '36',
//   'Canberra',
//   '120 miles',
//   'Au',
//   'Mars',
//   'Blue Whale',
//   'Vatican City',
//   'Harper Lee',
//   '1945',
//   }
// ];

int counter = 0;

class _TakeIQTestState extends State<TakeIQTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
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
              child: Center(
                child: Text(
                  myQuestionsList[counter],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            AnwerItem(
              letter: 'A) ',
              text: myAnswersList[counter],
              onTap: () {
                if (counter + 1 < myQuestionsList.length) {
                  setState(() {
                    counter++;
                  });
                }
              },
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
  final VoidCallback? onTap;

  const AnwerItem({
    Key? key,
    required this.letter,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
