import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
  //
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;
  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  // BuildContext is a special object type provided by Flutter in the material.dart file and this context object is of that type.
  // Build Method returns Widget.
  // MaterialApp accepts named argument..
  // Material App is class
  Widget build(BuildContext context) {
    //const == Compile time constant + Run time constant
    // final == Run time Constant
    // questions = const [], we can later change questions to another object
    // const questions = [], we can't later change questions to another object

    const questions = [
      {
        'questionText': 'What\'s your favorite color? ',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 9},
          {'text': 'Black', 'score': 8},
          {'text': 'VIOLET', 'score': 1},
        ]
      },
      {
        'questionText': 'What\'s your favourite animal? ',
        'answers': [
          {'text': 'Rabbit', 'score': 10},
          {'text': 'DOG', 'score': 9},
          {'text': 'COW', 'score': 8},
          {'text': 'MOUSE', 'score': 1},
        ]
      },
      {
        'questionText': 'What\'s your favourite instructor? ',
        'answers': [
          {'text': 'Black2', 'score': 10},
          {'text': 'Red2', 'score': 9},
          {'text': 'Black2', 'score': 8},
          {'text': 'VIOLET2', 'score': 1},
        ]
      }
    ];
    void answerQuestion(int score) {
      totalScore += score;
      setState(() {
        questionIndex = questionIndex + 1;
      });
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("My APP"),
          ),
          body: questionIndex < questions.length
              ? Quiz(
                  answerQuestion: answerQuestion,
                  questionIndex: questionIndex,
                  questions: questions,
                )
              : Result(
                  resultScore: totalScore,
                  resetHandler: resetQuiz,
                )),
    );
  }
}
