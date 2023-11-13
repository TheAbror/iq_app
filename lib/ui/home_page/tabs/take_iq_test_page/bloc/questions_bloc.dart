// ignore_for_file: constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iq_app_mobile/core/app_colors.dart';

part 'questions_state.dart';

class QuestionsBloc extends Cubit<QuestionsState> {
  QuestionsBloc() : super(QuestionsState.initial());

  void toNextQuestion() {
    emit(state.copyWith(questionCounter: state.questionCounter + 1));
  }

  void isCorrect(int counter, int questionCounter) {
    var stateIcons = List<Icon>.from(state.icons);
    var stateResults = state.result;
    if ((counter + 1) < questionCounter) {
      stateIcons.add(
        Icon(
          Icons.done,
          color: AppColors.success,
          size: 40.sp,
        ),
      );
    }
    var result = stateResults + 1;

    emit(state.copyWith(icons: stateIcons, result: result));
  }

  void isInCorrect(int counter, int questionCounter) {
    var stateIcons = List<Icon>.from(state.icons);
    if ((counter + 1) < questionCounter) {
      stateIcons.add(
        Icon(
          Icons.error,
          color: AppColors.error,
          size: 40.sp,
        ),
      );
    }
    emit(state.copyWith(icons: stateIcons));
  }
}
