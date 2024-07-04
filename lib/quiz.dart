import 'package:flutter/material.dart';
import 'package:quiz_app_advanced/data/question.dart';
import 'package:quiz_app_advanced/question_screen.dart';
import 'package:quiz_app_advanced/result_Screen.dart';
import 'package:quiz_app_advanced/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start_Screen';
  @override
  /*void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }*/

  void switchScreen() {
    setState(() {
      activeScreen = 'question_Screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_Screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'start_screen') {
      screenWidget = StartScreen(switchScreen);
    }

    if (activeScreen == 'question_Screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer);
    }
    if (activeScreen == 'result_Screen') {
      screenWidget = Result(
        rstrt: restart,
        chosenAnswer: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 140, 4, 214),
              Color.fromARGB(255, 93, 13, 143)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
