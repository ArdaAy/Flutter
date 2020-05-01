import 'package:flutter/material.dart';
import 'package:sec_quiz_app/result.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';


/*
void main(List<String> args) {
  runApp(MyApp());
}
*/

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText' : 'Question 1',
      'answers' : [
        {'text' : 'Black','score' : 10},
        {'text' : 'Red','score' : 5},
        {'text' : 'Green','score' : 3},
        {'text' : 'White','score' : 1},
      ]
    },
    {
      'questionText' : 'Question 2',
      'answers' : [
        {'text' : 'One','score' : 10},
        {'text' : 'Two','score' : 5},
        {'text' : 'Three','score' : 3},
        {'text' : 'Four','score' : 1},
      ]
    },
    {
      'questionText' : 'Question 3',
      'answers' : [
        {'text' : 'Zırt','score' : 10},
        {'text' : 'Fırt','score' : 5},
        {'text' : 'Tırt','score' : 3},
        {'text' : 'Pırt','score' : 1},
      ]
    },
    {
      'questionText' : 'Question 4',
      'answers' : []
    }
    ];
  var _questionCnt = 0;
  var _totalScore = 0;



  void _reset(){
    setState(() {
      _questionCnt = 0;
      _totalScore = 0;
    });
  }
  void _checkAnswer(int score){
    //print('Answer is $s');
    setState(() {
      _questionCnt++;
      if(_questionCnt == _questions.length){
        _questionCnt = 0;
        _totalScore = 0;
      }
      else{
        _totalScore += score;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cix App",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cix Bar'),
        ),
        body: (_questions[_questionCnt]['answers'] as List
        ).length > 0 
        ? Quiz(
            questions: _questions,
            checkAnswer: _checkAnswer,
            questionCnt: _questionCnt,
          )
        : Result(_totalScore, _reset),
      ),
    );
  }
}
