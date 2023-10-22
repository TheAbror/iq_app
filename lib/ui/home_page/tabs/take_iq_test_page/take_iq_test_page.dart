// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/bloc_progress/bloc_progress.dart';
import 'package:iq_app_mobile/core/primary_loader.dart';
import 'package:iq_app_mobile/core/something_went_wrong.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';

class TakeIQTest extends StatelessWidget {
  const TakeIQTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocProvider(
          create: (context) => QuestionsBloc()..getQuestions(),
          child: BlocBuilder<QuestionsBloc, QuestionsState>(
            builder: (context, state) {
              if (state.blocProgress == BlocProgress.IS_LOADING) {
                return const PrimaryLoader();
              }

              if (state.blocProgress == BlocProgress.FAILED) {
                return const SomethingWentWrong();
              }
              return Column(
                children: [
                  SizedBox(height: 30.h),
                  Container(
                    height: 300,
                    width: double.infinity,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.textMain,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        'questions[counter].question',
                        style: const TextStyle(
                          color: AppColors.float,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.zero,
                  //   itemCount: questions[0].options.length,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //       contentPadding: EdgeInsets.zero,
                  //       title: AnwerItem(
                  //         letter: '',
                  //         text: questions[counter].options[index],
                  //       ),
                  //       onTap: () {
                  //         if (questions[counter].options[index] == questions[counter].answer) {
                  //           print('correct');
                  //           icons.add(
                  //             Icon(
                  //               Icons.done,
                  //               color: Colors.green.shade800,
                  //             ),
                  //           );
                  //         } else {
                  //           print('wrong');
                  //           icons.add(
                  //             Icon(
                  //               Icons.exposure_minus_1_outlined,
                  //               color: Colors.red.shade800,
                  //             ),
                  //           );
                  //         }
                  //         if (counter + 1 < questions.length) {
                  //           setState(() {
                  //             counter++;
                  //           });
                  //         }
                  //       },
                  //     );
                  //   },
                  // ),
                  SizedBox(height: 40.h),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: icons,
                  // ),
                  // if (icons.length == questions.length) const Text('Your result: ')
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
