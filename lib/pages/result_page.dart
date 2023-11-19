import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/summary/question_summary.dart';

class Result extends StatelessWidget {
  final Function() reset;
  final List<String> chosenAnswer;
  const Result({super.key, required this.chosenAnswer, required this.reset});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],//the first answer is the correct one in the original answer list
        "user_answer": chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    //length of questions
    final numTotal = questions.length;
    //length of correct answers
    final numCorrect = summaryData
        .where((element) => element["correct_answer"] == element["user_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrect out of $numTotal questions correctly!",
              style: GoogleFonts.lato(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(CupertinoIcons.restart),
              onPressed: reset,
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
