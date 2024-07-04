import 'package:flutter/material.dart';
import 'package:quiz_app_advanced/data/question.dart';
import 'package:quiz_app_advanced/question_summary.dart';
import './question_screen.dart';

class Result extends StatelessWidget {
  const Result({required this.rstrt, required this.chosenAnswer, super.key});
  final Function() rstrt;
  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummury() {
    final List<Map<String, Object>> Summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      Summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return Summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummury();
    final numTotalQustions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'You have answered $numCorrectQuestions out of $numTotalQustions questions ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Question_Summary(summaryData: summaryData),
              SizedBox(
                height: 30,
              ),
              TextButton(onPressed: rstrt, child: const Text('Restart ')),
            ]),
      ),
    );
  }
}
