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
