import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                QuestionIdentifier(
                  isCorrectAnswer: (data['user_answer'].toString() ==
                      data['correct_answer'].toString()),
                  questionIndex: (data['question_index'] as int),
                ),
                /*
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),*/
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        data['question'].toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        data['user_answer'].toString(),
                      ),
                      Text(data['correct_answer'].toString()),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
