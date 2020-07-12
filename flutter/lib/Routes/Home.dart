import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
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
  final List<QAObject> questionsAndAnswers = [
    QAObject(
        question: "Question 1",
        answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"],
        answer: 1),
    QAObject(
        question: "Question 2",
        answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"],
        answer: 3),
    QAObject(
        question: "Question 3",
        answers: ["Answer 1", "Answer 2", "Answer 3", "Answer 4"],
        answer: 0)
  ];

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
      body: (disimissables.length > 0 ? disimissables[0] : Done()),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: RaisedButton(
                onPressed: () {
                  print("Left button pressed");
                },
                color: Colors.blue[800],
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue[800])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: RaisedButton(
                onPressed: () {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushNamed(context, '/Users');
                  });
                },
                color: Colors.blue[800],
                child: Icon(
                  Icons.view_headline,
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue[800])),
              ),
            ),
          ],
        ),
        color: Theme.of(context).primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Fab pressed");
        },
        backgroundColor: Colors.blue[800],
        child: Icon(
          Icons.compare_arrows,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Dismissable extends StatelessWidget {
  final BioObject currentBio;
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
