import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/ClassObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Data/Data.dart';
import 'package:classmate_connector/Pages/Bio.dart';
import 'package:classmate_connector/Pages/Email.dart';
import 'package:classmate_connector/Pages/Password.dart';
import 'package:classmate_connector/Pages/QuestionList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
      classes: [ClassObject(dept: "", number: "")],
      classLevel: "",
      dorm: DormObject(dorm: "Select a Dorm"));

  final List<QAObject> questions = List<QAObject>.from(listOfQuestions);

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
    Widget showingScreen;

    if (stage == Stage.email) {
      showingScreen = Email(_setEmail, _setStage);
    } else if (stage == Stage.password) {
      showingScreen = Password(_setStage);
    } else if (stage == Stage.bio) {
      showingScreen = Bio(
        bioInfo: userInfo,
        updateState: _updateState,
        setStage: _setStage,
      );
    } else if (stage == Stage.questionList) {
      showingScreen = QuestionList(_setStage, _updateQAObject, questions);
    } else if (stage == Stage.home) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/Home');
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Classmate Connector"),
      ),
      body: showingScreen,
    );
  }
}
