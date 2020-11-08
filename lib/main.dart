import 'package:flutter/material.dart';
import 'question.dart';

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
    'What\'s your favorite color?',
    'What\'s your favorite animal?'
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
            Question(questions[questionIndex]),
            RaisedButton(
              onPressed: () => answerQuestion(),
              child: Text('1'),
            ),
            RaisedButton(
              onPressed: () => print('2'),
              child: Text('2'),
            ),
            RaisedButton(
              onPressed: () => print('3'),
              child: Text('3'),
            ),
          ],
        ),
      ),
    );
  }
}
