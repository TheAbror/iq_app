// ignore_for_file: avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/bloc_progress/bloc_progress.dart';
import 'package:iq_app_mobile/core/primary_loader.dart';
import 'package:iq_app_mobile/core/something_went_wrong.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/widgets/finish_dialog.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/widgets/options_text.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/widgets/question_text.dart';

class TakeIQTest extends StatefulWidget {
  const TakeIQTest({super.key});

  @override
  State<TakeIQTest> createState() => _TakeIQTestState();
}

class _TakeIQTestState extends State<TakeIQTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textMain,
        title: Text(
          'Test',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: BlocProvider(
            create: (context) => QuestionsBloc()..getQuestions(),
            child: BlocConsumer<QuestionsBloc, QuestionsState>(
              listener: (context, state) async {
                if (state.questions.length == (state.counter + 1)) {
                  finishDialog(context, state);
                }
              },
              builder: (context, state) {
                if (state.blocProgress == BlocProgress.IS_LOADING) {
                  return const PrimaryLoader();
                }

                if (state.blocProgress == BlocProgress.FAILED) {
                  return const SomethingWentWrong();
                }

                final counter = state.counter;
                final iconsList = state.icons;

                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    Expanded(
                      flex: 3,
                      child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.questions.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              QuestionText(
                                counter: counter,
                                state: state,
                              ),
                              SizedBox(height: 20.h),
                              Divider(
                                thickness: 1,
                                height: 1,
                              ),
                              SizedBox(height: 10.h),
                              OptionsText(
                                counter: counter,
                                state: state,
                              ),
                              SizedBox(height: 100.h),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: iconsList,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
