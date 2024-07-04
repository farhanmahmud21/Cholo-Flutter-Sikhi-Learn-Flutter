import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onTap, required this.answerText});
  final Function() onTap;
  final String answerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(

            // shadowColor: Colors.black,
            backgroundColor: Color.fromARGB(255, 225, 162, 14),
            foregroundColor: Color.fromARGB(255, 0, 0, 0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        child: Text(
          answerText,
          style: GoogleFonts.aBeeZee(fontSize: 19, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));
  }
}
