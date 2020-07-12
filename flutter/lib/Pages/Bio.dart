import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:classmate_connector/Routes/Questions.dart';
import 'package:classmate_connector/Widgets/ClassLevelSelector.dart';
import 'package:classmate_connector/Widgets/DormSelector.dart';
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
              onChanged: (newFirstName) {
                bioInfo.firstName = newFirstName;
              },
            ),
            Padding(
              child: TextField(
                decoration: InputDecoration(labelText: "Last name"),
                controller: _lastNameController,
                onChanged: (newLastName) {
                  bioInfo.lastName = newLastName;
                },
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              child: TextField(
                decoration: InputDecoration(labelText: "Bio"),
                controller: _bioController,
                maxLines: 20,
                minLines: 1,
                onChanged: (newBio) {
                  bioInfo.bio = newBio;
                },
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
            DormSelector(bioInfo: bioInfo, updateState: updateState),
            Padding(
              child: ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    onPressed: () {
                      _firstNameController.clear();
                      _lastNameController.clear();
                      _bioController.clear();
                      bioInfo.firstName = "";
                      bioInfo.lastName = "";
                      bioInfo.bio = "";
                      bioInfo.email = "";
                      bioInfo.dorm =
                          DormObject(dorm: "Select a Dorm", floor: null);
                      setStage(Stage.email);
                    },
                    child: Text("Cancel"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (bioInfo.firstName.length > 0 &&
                          bioInfo.lastName.length > 0 &&
                          bioInfo.bio.length > 0 &&
                          bioInfo.classes.length >= 0 &&
                          bioInfo.classLevel.length >= 0 &&
                          ((bioInfo.dorm.dorm.indexOf("Off Campus") == 0 &&
                                  "Off Campus".indexOf(bioInfo.dorm.dorm) ==
                                      0) ||
                              bioInfo.dorm.floor != null &&
                                  bioInfo.dorm.floor.toString().length > 0)) {
                        setStage(Stage.questionList);
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Please confirm that there are no empty feilds above.',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                      }
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
