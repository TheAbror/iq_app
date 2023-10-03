import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_app/core/bloc_progress.dart';
import 'package:iq_app/ui/home_page/tabs/question_modesl.dart';

part 'questions_state.dart';

class QuestionsBloc extends Cubit<QuestionsState> {
  QuestionsBloc() : super(QuestionsState.initial());

  void getQuestions() async {
    emit(state.copyWith(blocProgress: BlocProgress.IS_LOADING));

    try {
      final jsonString = await rootBundle.loadString('assets/questions.json');
      final jsonList = json.decode(jsonString);
      final questions = jsonList.map((json) => Question.fromJson(json)).toList();

      if (jsonList != null) {
        emit(
          state.copyWith(
            questions: questions,
            blocProgress: BlocProgress.LOADED,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(
        blocProgress: BlocProgress.FAILED,
        failureMessage: 'Error',
      ));
    }
  }
}
