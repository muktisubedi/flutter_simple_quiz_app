import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final void Function(int) answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  const Quiz(
      {required this.answerQuestion,
      required this.questions,
      required this.questionIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
            questionText: questions[questionIndex]['questionText'] as String),

        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              answerText: answer['text'] as String,
              selectHandler: () => answerQuestion(answer['score'] as int));
        }).toList(),
        //deprecated variable
      ],
    );
  }
}
