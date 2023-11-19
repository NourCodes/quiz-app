import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/summary/summary_structure.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              //transform List<Map<String,Object>> to a list of widgets
              summaryData.map((item) {//map each item
            return Summary(item);
          }).toList(),
        ),
      ),
    );
  }
}
