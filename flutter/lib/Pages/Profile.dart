import 'package:classmate_connect/Classes/BioObject.dart';
import 'package:classmate_connect/Classes/QAObject.dart';
import 'package:classmate_connect/Widgets/Answer.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final BioObject bio;
  final List<QAObject> questionsAndAnswers;

  Profile({this.bio, this.questionsAndAnswers});

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

    return (Column(
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
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  bio.bio,
                ),
              ),
              Text(
                "Classes",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Insert map of class list here
              ],
            )),
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
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(bio.classLevel),
                Text(bio.dorm.dorm),
              ],
            )),
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
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: answerWidgets,
            )),
      ],
    ));
  }
}
