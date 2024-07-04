import 'package:flutter/material.dart';
import 'package:quiz_app_advanced/data/question.dart';

class Question_Summary extends StatelessWidget {
  const Question_Summary({required this.summaryData, super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(((data['question_index'] as int) + 1).toString()),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String),
                        Text(data['correct_answer'] as String),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
