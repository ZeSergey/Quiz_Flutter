import 'package:flutter/material.dart';
import 'result.dart';
import 'quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  num questionIndex = 0;
  num totalScore = 0;

  var questions = [
    {
      "questionText": 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 7},
        {'text': 'Red', 'score': 4},
        {'text': 'Blue', 'score': 7},
        {'text': 'White', 'score': 5}
      ]
    },
    {
      "questionText": 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Snake', 'score': 1},
        {'text': 'Elephant', 'score': 2},
        {'text': 'Lion', 'score': 7}
      ]
    },
    {
      "questionText": 'Who\'s president of USA',
      'answers': [
        {'text': 'Donald', 'score': 9},
        {'text': 'George', 'score': 1},
        {'text': 'Bill', 'score': 3},
        {'text': 'Barack', 'score': 1}
      ]
    },
  ];

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  void restartQuiz() {
    setState(() {
      totalScore = 0;
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz App',
          ),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                questionIndex: questionIndex,
                questions: questions,
                answerQuestion: answerQuestion,
              )
            : Result(totalScore, restartQuiz),
      ),
    );
  }
}
