import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;
  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemData['question'].toString(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 5),
              Text(
                itemData['user_answer'].toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 202, 171, 252),
                ),
              ),
              Text(
                itemData['correct_answer'].toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
