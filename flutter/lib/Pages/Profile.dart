import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Widgets/Answer.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final BioObject bio;
  final List<QAObject> questionsAndAnswers;
  final bool showEmail;

  Profile({this.bio, this.questionsAndAnswers, this.showEmail = false});

  @override
  Widget build(BuildContext context) {
    List<Widget> answerWidgets = [];

    for (int i = 0; i < questionsAndAnswers.length; i++) {
      answerWidgets.add(Answer(
        question: questionsAndAnswers[i].question,
        answer: questionsAndAnswers[i].answer,
        answers: questionsAndAnswers[i].answers,
      ));
    }

    List<Widget> getShowEmailAndBioArray() {
      List<Widget> columnChildren = [];
      if (showEmail) {
        columnChildren = [
          Text(
            "Email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text(
              bio.email,
            ),
          ),
        ];
      }
      columnChildren.addAll(
        [
          Text(
            "Bio",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
            child: Text(
              bio.bio,
            ),
          ),
          Text(
            "Classes",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      );
      return columnChildren;
    }

    return (SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              bio.firstName + " " + bio.lastName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getShowEmailAndBioArray(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bio.classes
                  .map((classInfo) =>
                      Text(classInfo.dept + " " + classInfo.number.toString()))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text(
                    "Other information",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bio.classLevel),
                Text(bio.dorm.dorm +
                    (bio.dorm.floor != null
                        ? (", floor " + bio.dorm.floor.toString())
                        : "")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text(
                    "Question Answers",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: answerWidgets,
            ),
          ),
        ],
      ),
    ));
  }
}
