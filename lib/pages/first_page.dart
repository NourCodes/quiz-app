import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPage extends StatelessWidget {
  void Function() switchPage;
  FirstPage(this.switchPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.asset(
              "images/logo.png",
              color: Colors.blue.shade500,
              width: 300,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: Colors.grey.shade50,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton(
            onPressed: switchPage,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.grey.shade50,
            ),
            child: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
