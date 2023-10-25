// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/bloc/questions_bloc.dart';

class OptionsText extends StatefulWidget {
  final int counter;
  final QuestionsState state;

  const OptionsText({
    super.key,
    required this.counter,
    required this.state,
  });

  @override
  State<OptionsText> createState() => _OptionsTextState();
}

class _OptionsTextState extends State<OptionsText> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.state.questions[widget.counter].options.length,
      itemBuilder: (context, optionIndex) {
        int? selectedOptionIndex;
        return Builder(
          builder: (context) {
            var questionCounter = widget.state.questions.length;
            return GestureDetector(
              onTap: () {
                context.read<QuestionsBloc>().increaseCounter(widget.counter, questionCounter);
                setState(() {
                  selectedOptionIndex = optionIndex;
                });
                var abc = widget.state.questions[widget.counter].options[selectedOptionIndex ?? 0].option;
                var abcBool = widget.state.questions[widget.counter].options[selectedOptionIndex ?? 0].isCorrect;
                print('Selected value: $abc');
                print('$abcBool');
                if (abcBool) {
                  context.read<QuestionsBloc>().isCorrect(widget.counter, questionCounter);
                } else {
                  context.read<QuestionsBloc>().isInCorrect(widget.counter, questionCounter);
                }
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
                  widget.state.questions[widget.counter].options[optionIndex].option,
                  style: const TextStyle(
                    color: AppColors.emirald,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
