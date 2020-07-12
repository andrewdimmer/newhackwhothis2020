import 'package:classmate_connect/Classes/BioObject.dart';
import 'package:classmate_connect/Classes/DormObject.dart';
import 'package:classmate_connect/Routes/Questions.dart';
import 'package:classmate_connect/Widgets/ClassLevelSelector.dart';
import 'package:classmate_connect/Widgets/DormSelector.dart';
import 'package:flutter/material.dart';

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _bioController = TextEditingController();

class Bio extends StatelessWidget {
  Bio({this.bioInfo, this.updateState, this.setStage}) {
    _firstNameController.text = bioInfo.firstName;
    _lastNameController.text = bioInfo.lastName;
    _bioController.text = bioInfo.bio;
  }

  final BioObject bioInfo;
  final Function updateState;
  final Function setStage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: "First name"),
              controller: _firstNameController,
            ),
            Padding(
              child: TextField(
                decoration: InputDecoration(labelText: "Last name"),
                controller: _lastNameController,
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              child: TextField(
                decoration: InputDecoration(labelText: "Bio"),
                controller: _bioController,
                maxLines: 20,
                minLines: 1,
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              child: Text(
                "Select Classes",
                style: TextStyle(fontSize: 20),
              ),
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Select Class Level",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              child: ClassLevelSelector(
                bioInfo: bioInfo,
                updateState: updateState,
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Select Housing",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              child: DormSelector(bioInfo: bioInfo, updateState: updateState),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              child: ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      setStage(Stage.password);
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _bioController.clear();
                    },
                    child: Text("Cancel"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setStage(Stage.questionList);
                      setUserInfo(
                          _firstNameController.text,
                          _lastNameController.text,
                          _bioController.text,
                          [],
                          dorm,
                          "",
                          classLevel);
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
    ));
  }
}
