import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  final Map<String, Object> itemData;
  const Summary(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: //if user answer is correct the color will be blue else purple
              (itemData["correct_answer"] == itemData["user_answer"])
                  ? Colors.blueAccent
                  : Colors.purpleAccent,
          radius: 15,
          child: Text(
            //the question index will start with 1
            ((itemData['question_index'] as int) + 1).toString(),
            style: GoogleFonts.lato(
              fontSize: 15,
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData["question"].toString(),
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemData["user_answer"].toString(),
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              Text(
                itemData["correct_answer"].toString(),
                style: GoogleFonts.lato(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
