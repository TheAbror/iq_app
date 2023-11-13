part of 'questions_bloc.dart';

class QuestionsState extends Equatable {
  final int questionCounter;
  final List<Icon> icons;
  final int result;
  final BlocProgress blocProgress;
  final String failureMessage;

  const QuestionsState({
    required this.questionCounter,
    required this.icons,
    required this.result,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory QuestionsState.initial() {
    return QuestionsState(
      questionCounter: 0,
      icons: const [],
      result: 0,
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  QuestionsState copyWith({
    int? questionCounter,
    List<Icon>? icons,
    int? result,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return QuestionsState(
      questionCounter: questionCounter ?? this.questionCounter,
      icons: icons ?? this.icons,
      result: result ?? this.result,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        questionCounter,
        icons,
        result,
        blocProgress,
        failureMessage,
      ];
}
