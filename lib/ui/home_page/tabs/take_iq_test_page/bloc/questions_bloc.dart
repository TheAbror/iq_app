// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_app_mobile/core/api/api_provider.dart';
import 'package:iq_app_mobile/core/app_colors.dart';
import 'package:iq_app_mobile/core/app_strings.dart';
import 'package:iq_app_mobile/core/bloc_progress/bloc_progress.dart';
import 'package:iq_app_mobile/core/bloc_progress/error.dart';
import 'package:iq_app_mobile/ui/home_page/tabs/take_iq_test_page/model/questions_model.dart';

part 'questions_state.dart';

class QuestionsBloc extends Cubit<QuestionsState> {
  QuestionsBloc() : super(QuestionsState.initial());

  void getQuestions() async {
    ApiProvider.create();
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final response = await ApiProvider.questionsService.getQuestions();

      if (response.isSuccessful) {
        final data = response.body;

        if (data != null) {
          emit(
            state.copyWith(
              questions: data,
              blocProgress: BlocProgress.LOADED,
            ),
          );
        }
      } else {
        final error = ErrorResponse.fromJson(json.decode(response.error.toString()));

        emit(state.copyWith(
          blocProgress: BlocProgress.FAILED,
          failureMessage: error.message,
        ));
      }
    } catch (e) {
      debugPrint('Error getting inquiries: $e');
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: AppStrings.internalErrorMessage,
      ));
    }
  }

  void increaseCounter() {
    var stateCounter = state.counter;
    var increaseC = stateCounter + 1;
    emit(state.copyWith(counter: increaseC));
  }

  void isCorrect(int optionIndex) {
    List<Icon> listOfIcons = [];

    if (state.options[optionIndex].isCorrect) {
      listOfIcons.add(
        Icon(
          Icons.done,
          color: AppColors.success,
        ),
      );
    } else {
      listOfIcons.add(
        Icon(
          Icons.error,
          color: AppColors.warning,
        ),
      );
    }

    emit(state.copyWith(icons: listOfIcons));
  }
}
