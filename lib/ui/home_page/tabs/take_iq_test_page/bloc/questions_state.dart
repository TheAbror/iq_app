part of 'questions_bloc.dart';

class QuestionsState extends Equatable {
  final int counter;
  final List<Icon> icons;
  final List<QuestionsResponse> questions;
  final List<Options> options;
  final BlocProgress blocProgress;
  final String failureMessage;

  const QuestionsState({
    required this.icons,
    required this.counter,
    required this.questions,
    required this.options,
    required this.blocProgress,
    required this.failureMessage,
  });

  factory QuestionsState.initial() {
    return QuestionsState(
      counter: 0,
      icons: const [],
      questions: [
        QuestionsResponse(
          question: '',
          options: [],
        ),
      ],
      options: const [],
      blocProgress: BlocProgress.IS_LOADING,
      failureMessage: '',
    );
  }

  QuestionsState copyWith({
    int? counter,
    List<Icon>? icons,
    List<QuestionsResponse>? questions,
    List<Options>? options,
    BlocProgress? blocProgress,
    String? failureMessage,
  }) {
    return QuestionsState(
      counter: counter ?? this.counter,
      icons: icons ?? this.icons,
      questions: questions ?? this.questions,
      options: options ?? this.options,
      blocProgress: blocProgress ?? this.blocProgress,
      failureMessage: failureMessage ?? this.failureMessage,
    );
  }

  @override
  List<Object?> get props => [
        counter,
        icons,
        questions,
        options,
        blocProgress,
        failureMessage,
      ];
}
