import 'dart:convert';

class Question {
  String question;
  List<String> options;
  String answer;

  Question({required this.question, required this.options, required this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'],
      options: List<String>.from(json['options']),
      answer: json['answer'],
    );
  }

  static List<Question> fromJsonList(String jsonString) {
    Iterable list = json.decode(jsonString);
    return list.map((model) => Question.fromJson(model)).toList();
  }
}
