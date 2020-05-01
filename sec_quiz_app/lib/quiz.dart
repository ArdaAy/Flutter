import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget{
  final List<Map<String, Object>> questions;
  final Function checkAnswer;
  final int questionCnt;

  Quiz({
    @required this.questions, 
    @required this.checkAnswer, 
    @required this.questionCnt
  });



  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
              Question(questions[questionCnt]['questionText']),
              ...(questions[questionCnt]['answers'] as List<Map<String, Object>>)
              .map((answer){
                // On the flight function 
                return Answer( () => checkAnswer(answer['score']), answer['text'] );
              }).toList(),
            /*
            Answer(_checkAnswer, (questions[questionCnt]['answers'] as List)[0]),
            Answer(_checkAnswer, (questions[questionCnt]['answers'] as List)[1]),
            Answer(_checkAnswer, (questions[questionCnt]['answers'] as List)[2]),
            Answer(_checkAnswer, (questions[questionCnt]['answers'] as List)[3]),
            */
          ],
        );
  }

}