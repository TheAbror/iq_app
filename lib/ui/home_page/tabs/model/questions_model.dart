import 'package:json_annotation/json_annotation.dart';

part 'questions_model.g.dart';

@JsonSerializable(includeIfNull: true, explicitToJson: true)
class QuestionsResponse {
  @JsonKey(defaultValue: '')
  final String question;
  @JsonKey(defaultValue: [])
  final List<String> options;
  @JsonKey(defaultValue: '')
  final String answer;

  QuestionsResponse({
    required this.question,
    required this.options,
    required this.answer,
  });

  factory QuestionsResponse.fromJson(Map<String, dynamic> jsonData) => _$QuestionsResponseFromJson(jsonData);
  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
}
























// class Question {
//   String question;
//   List<String> options;
//   String answer;

//   Question({required this.question, required this.options, required this.answer});

//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       question: json['question'],
//       options: List<String>.from(json['options']),
//       answer: json['answer'],
//     );
//   }

//   static List<Question> fromJsonList(String jsonString) {
//     Iterable list = json.decode(jsonString);
//     return list.map((model) => Question.fromJson(model)).toList();
//   }
// }
