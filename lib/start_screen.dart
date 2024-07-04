import 'package:flutter/material.dart';
import 'package:quiz_app_advanced/quiz.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.rend, {super.key});
  void Function() rend;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'চলো ফ্লাটার শিখি',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 65,
          ),
          OutlinedButton.icon(
              onPressed: rend,
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_circle_right_rounded),
              label: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}
