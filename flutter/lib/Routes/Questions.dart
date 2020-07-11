import 'package:classmate_connect/Classes/BioObject.dart';
import 'package:classmate_connect/Classes/ClassObject.dart';
import 'package:classmate_connect/Classes/QAObject.dart';
import 'package:classmate_connect/Pages/Bio.dart';
import 'package:classmate_connect/Pages/Password.dart';
import 'package:classmate_connect/Pages/QuestionList.dart';
import 'package:flutter/material.dart';
import 'package:classmate_connect/Pages/Email.dart';

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
  String email = "";
  BioObject userInfo;
  List<Map<String, num>> dorms;

  List<bool> classLevelSelected = [false, false, false, false];

  String dorm = "";

  String classLevel = "";

  final List<QAObject> questions = [
    QAObject(
        "Question 1", ["Answer 1", "Answer 2", "Answer 3", "Answer 4"], null),
    QAObject(
        "Question 2", ["Answer 1", "Answer 2", "Answer 3", "Answer 4"], null),
    QAObject(
        "Question 3", ["Answer 1", "Answer 2", "Answer 3", "Answer 4"], null)
  ];

  void updateQAObject(int index, QAObject newObject) {
    setState(() {
      questions[index] = newObject;
    });
  }

  void setClassLevelSelected(int index) {
    if (classLevelSelected[index]) {
      setState(() {
        classLevelSelected[index] = false;
        classLevel = "";
      });
    } else {
      for (int i = 0; i < classLevelSelected.length; i++) {
        setState(() {
          classLevelSelected[i] = false;
        });
      }
      classLevelSelected[index] = true;
      if (index == 0) {
        setState(() {
          classLevel = "Freshman";
        });
      } else if (index == 1) {
        setState(() {
          classLevel = "Sophomore";
        });
      } else if (index == 2) {
        setState(() {
          classLevel = "Junior";
        });
      } else if (index == 3) {
        setState(() {
          classLevel = "Senior";
        });
      }
    }
  }

  void setStage(Stage newStage) {
    setState(() {
      stage = newStage;
    });
  }

  void setEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }

  void setUserInfo(String firstName, String lastName, String bio,
      List<ClassObject> classes, String dorm, String floor, String classLevel) {
    setState(() {
      userInfo =
          BioObject(firstName, lastName, bio, classes, dorm, floor, classLevel);
    });
  }

  void setAnswer(int index, String answer) {
    setState(() {
      questions[index].answer = index;
    });
  }

  void setDorm(String dormName) {
    setState(() {
      dorm = dormName;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (stage == Stage.email) {
      return Email(setEmail, setStage);
    } else if (stage == Stage.password) {
      return Password(setStage);
    } else if (stage == Stage.bio) {
      return Bio(setUserInfo, setStage, classLevelSelected,
          setClassLevelSelected, dorm, setDorm, classLevel);
    } else if (stage == Stage.questionList) {
      print(questions);
      return QuestionList(setStage, updateQAObject, questions);
    }
    return Text(
        "Everything is broken, it should never be able to get to this point. Run for your life.");
  }
}
