// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsResponse _$QuestionsResponseFromJson(Map<String, dynamic> json) =>
    QuestionsResponse(
      question: json['question'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      answer: json['answer'] as String? ?? '',
    );

Map<String, dynamic> _$QuestionsResponseToJson(QuestionsResponse instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'answer': instance.answer,
    };
