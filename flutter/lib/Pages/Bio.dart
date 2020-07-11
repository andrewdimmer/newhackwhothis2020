import 'package:classmate_connect/Routes/Questions.dart';
import 'package:flutter/material.dart';

final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _bioController = TextEditingController();

class Bio extends StatelessWidget {
  final Function setUserInfo;
  final Function setStage;
  final Function setClassLevelSelected;
  final List<bool> classLevelSelected;

  final String dorm;
  final Function setDorm;

  final String classLevel;

  Bio(this.setUserInfo, this.setStage, this.classLevelSelected,
      this.setClassLevelSelected, this.dorm, this.setDorm, this.classLevel);

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
                autofocus: true,
                decoration: InputDecoration(labelText: "Last name"),
                controller: _lastNameController,
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(labelText: "Bio"),
                controller: _bioController,
                maxLines: 4,
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
                "Select class level",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setClassLevelSelected(0);
                              },
                              child: Text("Freshman",
                                  style: TextStyle(
                                      color: (classLevelSelected[0]
                                          ? Colors.white
                                          : Colors.black))),
                              color: (classLevelSelected[0]
                                  ? Theme.of(context).accentColor
                                  : Colors.grey[200])),
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setClassLevelSelected(1);
                              },
                              child: Text("Sophomore",
                                  style: TextStyle(
                                      color: (classLevelSelected[1]
                                          ? Colors.white
                                          : Colors.black))),
                              color: (classLevelSelected[1]
                                  ? Theme.of(context).accentColor
                                  : Colors.grey[200])),
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setClassLevelSelected(2);
                              },
                              child: Text("Junior",
                                  style: TextStyle(
                                      color: (classLevelSelected[2]
                                          ? Colors.white
                                          : Colors.black))),
                              color: (classLevelSelected[2]
                                  ? Theme.of(context).accentColor
                                  : Colors.grey[200])),
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          child: RaisedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                setClassLevelSelected(3);
                              },
                              child: Text("Senior",
                                  style: TextStyle(
                                      color: (classLevelSelected[3]
                                          ? Colors.white
                                          : Colors.black))),
                              color: (classLevelSelected[3]
                                  ? Theme.of(context).accentColor
                                  : Colors.grey[200])),
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        ),
                      )
                    ],
                  )
                ],
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                "Select housing",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              child: DropdownButton<String>(
                isExpanded: true,
                value: dorm,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Theme.of(context).primaryColor),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).primaryColor,
                ),
                onChanged: (String newValue) {
                  setDorm(newValue);
                },
                items: <String>[
                  '',
                  'Dorm One',
                  'Dorm Two',
                  'Dorm Three',
                  'Dorm Four',
                  'Off campus',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
