import 'package:adv_basics/answer_button.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Question',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          AnswerButton(
            answer: 'answer 1',
            action: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          AnswerButton(
            answer: 'answer 2',
            action: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          AnswerButton(
            answer: 'answer 3',
            action: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          AnswerButton(
            answer: 'answer 4',
            action: () {},
          ),
        ],
      ),
    );
  }
}
