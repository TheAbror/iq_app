// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$QuestionsService extends QuestionsService {
  _$QuestionsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = QuestionsService;

  @override
  Future<Response<List<QuestionsResponse>>> getQuestions() {
    final $url = 'assets/json_question.json';
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<QuestionsResponse>, QuestionsResponse>($request);
  }
}
