import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Data/Data.dart';
import 'package:classmate_connector/Widgets/Contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final List<BioObject> matchedList = [
    BioObject(
        firstName: "Nathan",
        lastName: "Dimmer",
        email: "nathandimmer@school.edu",
        bio: "I'm a person",
        classLevel: "Freshman",
        classes: [],
        dorm: DormObject(dorm: "Dorm One", floor: null)),
    BioObject(
        firstName: "Andrew",
        lastName: "Dimmer",
        email: "andrewdimmer@oakland.edu",
        bio: "I'm also person",
        classLevel: "Sophomore",
        classes: [],
        dorm: DormObject(dorm: "Dorm Two", floor: null))
  ];
  final List<QAObject> questionsAndAnswers = listOfQuestions;

  @override
  Widget build(BuildContext context) {
    List<Widget> contactWidgets = [];

    print(matchedList[0].email);

    for (int i = 0; i < matchedList.length; i++) {
      contactWidgets.add(Contact(
        bio: matchedList[i],
        answers: questionsAndAnswers,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Classmate Connect"),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
          child: ListView(
            children: contactWidgets,
          ),
          onRefresh: () {
            return getMatchesDatabaseHandler(userInfo.email).then((_) {
              setState(() {
                matchedList = matches;
              });
            });
          }),
      bottomNavigationBar: BottomNavBarCustom(),
      floatingActionButton: FabCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
