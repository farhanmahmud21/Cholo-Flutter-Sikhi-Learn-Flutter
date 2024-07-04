import 'package:flutter/material.dart';

import 'package:quiz_app_advanced/data/question.dart';
import 'package:quiz_app_advanced/models/answerButton.dart/answer.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectedAnswer, super.key});
  final Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
                style: GoogleFonts.arapey(color: Colors.white, fontSize: 25)),
            const SizedBox(height: 20),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  onTap: () {
                    answerQuestion(answer);
                  },
                  answerText: answer);
            }),
          ],
        ),
      ),
    );
  }
}
