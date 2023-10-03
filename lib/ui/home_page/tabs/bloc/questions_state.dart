part of 'questions_bloc.dart';

class QuestionsState extends Equatable {
  final Question questions;
  final BlocProgress blocProgress;
  final String failureMessage;

  const QuestionsState({
    required this.questions,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory QuestionsState.initial() {
    return QuestionsState(
      questions: Question(question: 'question', options: [], answer: 'answer'),
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  QuestionsState copyWith({
    Question? questions,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return QuestionsState(
      questions: questions ?? this.questions,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        questions,
        blocProgress,
        failureMessage,
      ];
}
