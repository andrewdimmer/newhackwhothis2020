import 'package:classmate_connect/Classes/QAObject.dart';
import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  QAObject question;
  int index;
  Function updateQAObject;

  Question(this.question, this.index, this.updateQAObject);

  @override
  _QuestionState createState() =>
      _QuestionState(question, index, updateQAObject);
}

class _QuestionState extends State<Question> {
  QAObject question;
  int index;
  Function updateQAObject;

  _QuestionState(this.question, this.index, this.updateQAObject);

  @override
  Widget build(BuildContext context) {
    List<Widget> answerWidgets = [];

    for (int j = 0; j < question.answers.length; j++) {
      answerWidgets.add(
        RaisedButton(
            onPressed: () {
              question.answer = j;
              updateQAObject(index, question);
            },
            child: Text(question.answers[j],
                style: TextStyle(
                    color: ((!(question.answer == null) && question.answer == j)
                        ? Colors.white
                        : Colors.black))),
            color: ((!(question.answer == null) && question.answer == j)
                ? Theme.of(context).accentColor
                : Colors.grey[200])),
      );
    }

    return Container(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
            child: Text(
              question.question,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: answerWidgets,
          )
        ],
      ),
    );
  }
}
