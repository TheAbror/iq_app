import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';

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
          style: TextStyle(
            color: AppColors.float,
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
