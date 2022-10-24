import 'package:equatable/equatable.dart';

class HelpModel extends Equatable {
  final int id;
  final String question, answer;

  const HelpModel(
      {required this.id, required this.question, required this.answer});

  factory HelpModel.fromJson(Map<String, dynamic> json) {
    return HelpModel(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        question,
        answer,
      ];
}
