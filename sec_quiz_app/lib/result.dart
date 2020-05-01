import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;

  String get resultPhrase {
    String resultText = 'Your Score is $score';
    return resultText;
  }

  Result(this.score, this.reset);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36, 
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: reset, 
            child: Text('Restart the Quiz!'),
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
