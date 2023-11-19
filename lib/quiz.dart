import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/questions_screen.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'pages/first_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //list for answers selected
  List<String> selectedAnswers = [];

  var activeScreenPage = "First";

  void switchScreen() {
    setState(() {
      activeScreenPage = "Quiz";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreenPage = "result";
      });
    }
  }

  void reset() {
    selectedAnswers = [];
    setState(() {
      activeScreenPage = "First";
    });
  }

  @override
  Widget build(BuildContext context) {
    //first page will be displayed initially
    Widget screen = FirstPage(switchScreen);
    //if button is pressed we will switch the screen to the question screen
    if (activeScreenPage == "Quiz") {
      screen = QuestionScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }
    //if we answer all questions we will move to the result page
    if (activeScreenPage == "result") {
      screen = Result(
        chosenAnswer: selectedAnswers,
        reset: reset,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blue.shade100,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
