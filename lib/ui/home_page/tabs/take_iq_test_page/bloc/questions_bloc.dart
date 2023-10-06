// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_app/core/api/api_provider.dart';
import 'package:iq_app/core/app_strings.dart';
import 'package:iq_app/core/bloc_progress/error.dart';
import 'package:iq_app/ui/home_page/tabs/take_iq_test_page/model/questions_model.dart';

part 'questions_state.dart';

class QuestionsBloc extends Cubit<QuestionsState> {
  QuestionsBloc() : super(QuestionsState.initial());

  // void getQuestions() async {
  //   emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

  //   try {
  //     final jsonString = await rootBundle.loadString('assets/questions.json');
  //     final jsonList = json.decode(jsonString);
  //     final questions = jsonList.map((json) => QuestionsResponse.fromJson(json)).toList();

  //     if (jsonList != null) {
  //       emit(
  //         state.copyWith(
  //           questions: questions,
  //           blocProgress: BlocProgress.LOADED,
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     emit(state.copyWith(
  //       blocProgress: BlocProgress.FAILED,
  //       failureMessage: 'Error',
  //     ));
  //   }
  // }

  void getQuestions() async {
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
}

enum BlocProgress { NOT_STARTED, IS_LOADING, LOADED, FAILED, IS_SUCCESS }
