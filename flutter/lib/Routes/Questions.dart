import 'package:classmate_connect/Classes/BioObject.dart';
import 'package:classmate_connect/Classes/DormObject.dart';
import 'package:classmate_connect/Classes/QAObject.dart';
import 'package:classmate_connect/Pages/Bio.dart';
import 'package:classmate_connect/Pages/Email.dart';
import 'package:classmate_connect/Pages/Password.dart';
import 'package:classmate_connect/Pages/QuestionList.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  Questions({
    Key key,
  }) : super(key: key);

  @override
  _QuestionsState createState() => _QuestionsState();
}

enum Stage { email, password, bio, questionList, home }

class _QuestionsState extends State<Questions> {
  Stage stage = Stage.email;
  BioObject userInfo = BioObject(
      firstName: "",
      lastName: "",
      email: "",
      bio: "",
      classes: [],
      classLevel: "",
      dorm: DormObject(dorm: "Select a Dorm"));

  final List<QAObject> questions = [
    QAObject(
      question: "Question 1",
      answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"],
    ),
    QAObject(
      question: "Question 2",
      answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"],
    ),
    QAObject(
      question: "Question 3",
      answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"],
    )
  ];

  void _updateQAObject(int index, QAObject newObject) {
    setState(() {
      questions[index] = newObject;
    });
  }

  void _setStage(Stage newStage) {
    setState(() {
      stage = newStage;
    });
  }

  void _setEmail(String newEmail) {
    setState(() {
      userInfo.email = newEmail;
    });
  }

  void _updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (stage == Stage.email) {
      return Email(_setEmail, _setStage);
    } else if (stage == Stage.password) {
      return Password(_setStage);
    } else if (stage == Stage.bio) {
      return Bio(
        bioInfo: userInfo,
        updateState: _updateState,
        setStage: _setStage,
      );
    } else if (stage == Stage.questionList) {
      print(questions);
      return QuestionList(_setStage, _updateQAObject, questions);
    }
    return Text(
        "Everything is broken, it should never be able to get to this point. Run for your life.");
  }
}
