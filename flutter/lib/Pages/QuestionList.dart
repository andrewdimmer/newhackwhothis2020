import 'package:classmate_connect/Classes/QAObject.dart';
import 'package:classmate_connect/Routes/Questions.dart';
import 'package:classmate_connect/Widgets/Question.dart';
import 'package:flutter/material.dart';

class QuestionList extends StatelessWidget {
  final Function setStage;
  final Function updateQAObject;
  final List<QAObject> questions;

  QuestionList(this.setStage, this.updateQAObject, this.questions);

  @override
  Widget build(BuildContext context) {
    List<Widget> questionWidgets = [];

    for (int i = 0; i < questions.length; i++) {
      questionWidgets.add(Question(questions[i], i, updateQAObject));
    }
    return (Center(
        child: Padding(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: questionWidgets,
            ),
            Padding(
              child: ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      setStage(Stage.bio);
                    },
                    child: Text("Cancel"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setStage(Stage.home);
                    },
                    child: Text("Submit"),
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            )
          ],
        ),
      ),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    )));
  }
}
