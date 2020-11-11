import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  num questionIndex = 0;

  var questions = [
    {
      "questionText": 'What\'s your favorite color?',
      'answers': ['Black', 'Red', 'Blue', 'White']
    },
    {
      "questionText": 'What\'s your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      "questionText": 'Who\'s president of USA',
      'answers': ['Donald', 'George', 'Bill', 'Barack']
    },
  ];

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
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
        body: Column(
          children: [
            Question(questions[questionIndex]["questionText"]),
            ...((questions[questionIndex]['answers'] as List).map((answer) {
              return Answer(answerQuestion, answer);
            })).toList()
          ],
        ),
      ),
    );
  }
}
