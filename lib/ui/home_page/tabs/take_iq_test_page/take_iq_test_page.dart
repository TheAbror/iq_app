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
      appBar: AppBar(
        backgroundColor: AppColors.textMain,
        title: Text(
          'IQ Test',
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
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
                              OptionsText(
                                counter: counter,
                                state: state,
                              ),
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

class OptionsText extends StatelessWidget {
  final int counter;
  final QuestionsState state;

  const OptionsText({
    super.key,
    required this.counter,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: state.questions[counter].options.length,
      itemBuilder: (context, optionIndex) {
        return Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              context.read<QuestionsBloc>().increaseCounter();
              context.read<QuestionsBloc>().isCorrect(optionIndex);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.textMain,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(),
              ),
              child: Text(
                state.questions[counter].options[optionIndex].option,
                style: const TextStyle(
                  color: AppColors.emirald,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
      },
    );
  }
}

class QuestionText extends StatelessWidget {
  final int counter;
  final QuestionsState state;

  const QuestionText({
    super.key,
    required this.counter,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.textMain,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(),
      ),
      child: Center(
        child: Text(
          state.questions[counter].question,
          style: const TextStyle(
            color: AppColors.float,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
