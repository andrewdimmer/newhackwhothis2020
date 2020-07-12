import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Data/Data.dart';
import 'package:classmate_connector/Pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Home extends StatefulWidget {
  // Home({this.bioList});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<BioObject> bioList = [
    BioObject(
        firstName: "Nathan",
        lastName: "Dimmer",
        bio: "I'm a person",
        classLevel: "Freshman",
        classes: [],
        dorm: DormObject(dorm: "Dorm One", floor: null)),
    BioObject(
        firstName: "Andrew",
        lastName: "Dimmer",
        bio: "I'm also person",
        classLevel: "Sophomore",
        classes: [],
        dorm: DormObject(dorm: "Dorm Two", floor: null))
  ];
  final List<QAObject> questionsAndAnswers = listOfQuestions;

  void removeItem(int index) {
    setState(() {
      bioList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> disimissables = [];

    for (int i = 0; i < bioList.length; i++) {
      disimissables.add(Dismissable(
        currentBio: bioList[i],
        index: i,
        removeItem: removeItem,
        questionsAndAnswers: questionsAndAnswers,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Classmate Connect"),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        child: (disimissables.length > 0 ? disimissables[0] : Done()),
        onRefresh: () {
          return getToApproveDatabaseHandler(userInfo.email).then((_) {
            setState(() {
              toApproveList = toApprove;
            });
          });
        },
      ),
      bottomNavigationBar: BottomNavBarCustom(),
      floatingActionButton: FabCustom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Dismissable extends StatelessWidget {
  final BioObject userInfo = yourInfo;
  final BioWithScoreObject currentBio;
  final int index;

  final Function removeItem;

  final List<QAObject> questionsAndAnswers;

  Dismissable(
      {this.currentBio, this.index, this.removeItem, this.questionsAndAnswers});

  @override
  Widget build(BuildContext context) {
    return (Dismissible(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
          child: Profile(
            bio: currentBio,
            questionsAndAnswers: questionsAndAnswers,
          ),
        ),
        key: UniqueKey(),
        background: Container(
          child: Padding(
            child: Icon(Icons.check),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          ),
          color: Colors.green[400],
          alignment: Alignment.centerLeft,
        ),
        secondaryBackground: Container(
          child: Padding(
            child: Icon(Icons.close),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          ),
          color: Colors.red[400],
          alignment: Alignment.centerRight,
        ),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            if (currentBio.status == 3) {
              matchDatabaseHandler(userInfo.email, currentBio.email);
            } else {
              approveDatabaseHandler(userInfo.email, currentBio.email);
            }
          } else {
            rejectDatabaseHandler(userInfo.email, currentBio.email);
          }
          removeItem(index);
        }));
  }
}

class Done extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text("You've looked at all our recomenedations for now!"))
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
