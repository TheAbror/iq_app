// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:iq_app/core/app_colors.dart';
import 'package:iq_app/ui/home_page/tabs/model/questions_model.dart';

class TakeIQTest extends StatefulWidget {
  const TakeIQTest({super.key});

  @override
  State<TakeIQTest> createState() => _TakeIQTestState();
}

int counter = 0;

class _TakeIQTestState extends State<TakeIQTest> {
  List<QuestionsResponse> questions = [];
  List<Icon> icons = [];

  // Future<List<QuestionsResponse>> loadData() async {
  //   String jsonString = await rootBundle.loadString('assets/json_question.json');
  //   return QuestionsResponse.fromJsonList(jsonString);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.float,
      appBar: AppBar(
        backgroundColor: AppColors.float,
        elevation: 1,
        leading: const BackButton(color: AppColors.textMain),
        title: const Text(
          'Topic: Countries',
          style: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // body: SafeArea(
      //     child: BlocBuilder<>(
      //   builder: (context, state) {},
      // )),
    );
  }
}




// Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Column(
//                 children: [
//                   SizedBox(height: 30.h),
//                   Container(
//                     height: 300,
//                     width: double.infinity,
//                     padding: EdgeInsets.all(8.w),
//                     decoration: BoxDecoration(
//                       color: AppColors.textMain,
//                       borderRadius: BorderRadius.circular(8.r),
//                       border: Border.all(),
//                     ),
//                     child: Center(
//                       child: Text(
//                         questions[counter].question,
//                         style: const TextStyle(
//                           color: AppColors.float,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 24,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 40.h),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     padding: EdgeInsets.zero,
//                     itemCount: questions[0].options.length,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         contentPadding: EdgeInsets.zero,
//                         title: AnwerItem(
//                           letter: '',
//                           text: questions[counter].options[index],
//                         ),
//                         onTap: () {
//                           if (questions[counter].options[index] == questions[counter].answer) {
//                             print('correct');
//                             icons.add(
//                               Icon(
//                                 Icons.done,
//                                 color: Colors.green.shade800,
//                               ),
//                             );
//                           } else {
//                             print('wrong');
//                             icons.add(
//                               Icon(
//                                 Icons.exposure_minus_1_outlined,
//                                 color: Colors.red.shade800,
//                               ),
//                             );
//                           }
//                           if (counter + 1 < questions.length) {
//                             setState(() {
//                               counter++;
//                             });
//                           }
//                         },
//                       );
//                     },
//                   ),
//                   SizedBox(height: 40.h),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: icons,
//                   ),
//                   if (icons.length == questions.length) const Text('Your result: ')
//                 ],
//               ),
//             );