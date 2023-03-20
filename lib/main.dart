import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}
//if only has one expression
// void main() => runApp(MyApp());

//use pascal casing in class always PascalCasing
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favourite color",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 12},
        {"text": "White", "score": 15},
      ],
    },
    {
      "questionText": "What's your favourite number",
      "answers": [
        {"text": "One", "score": 10},
        {"text": "Twenty Two", "score": 5},
        {"text": "Hundred", "score": 12},
        {"text": "SixtyNine", "score": 15},
      ],
    },
    {
      "questionText": "What's your favourite hobby",
      "answers": [
        {"text": "Running", "score": 10},
        {"text": "Cycling", "score": 5},
        {"text": "Bike Ride", "score": 12},
        {"text": "Music", "score": 15},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions for you");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
