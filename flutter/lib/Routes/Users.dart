import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Data/Data.dart';
import 'package:classmate_connector/Database/getDataHandlers.dart';
import 'package:classmate_connector/Widgets/BottomNavBarCustom.dart';
import 'package:classmate_connector/Widgets/Contact.dart';
import 'package:classmate_connector/Widgets/FabCustom.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  final BioObject userInfo = yourInfo;
  List<BioObject> matchedList = matches;
  final List<QAObject> questionsAndAnswers = listOfQuestions;

  @override
  Widget build(BuildContext context) {
    List<Widget> contactWidgets = [];

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
