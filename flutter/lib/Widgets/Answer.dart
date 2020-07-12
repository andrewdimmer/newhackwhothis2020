import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String question;
  final List<String> answers;
  final int answer;

  Answer({this.question, this.answers, this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 2.5, 0, 2.5),
          child: Text(
            answers[answer],
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
