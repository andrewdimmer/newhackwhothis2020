import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/ClassObject.dart';
import 'package:flutter/material.dart';

import '../Classes/ClassObject.dart';

class EnterClassWidget extends StatelessWidget {
  EnterClassWidget({Key key, this.bioInfo, this.updateState}) : super(key: key);

  final BioObject bioInfo;
  final Function updateState;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: getColumnChildren(context),
      ),
    );
  }

  List<Widget> getColumnChildren(BuildContext context) {
    List<Widget> columnChildren = [
      Center(child: Text("Examples: HACK 101 or CS 3450"))
    ];

    for (ClassObject classInfo in bioInfo.classes) {
      TextEditingController _deptController = TextEditingController();
      TextEditingController _numberController = TextEditingController();

      _deptController.text = classInfo.dept;
      _numberController.text = classInfo.number;

      columnChildren.add(Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(labelText: "Department"),
              controller: _deptController,
              onChanged: (newDept) {
                classInfo.dept = newDept;
              },
            ),
          ),
          Expanded(
            child: Padding(
              child: TextField(
                decoration: InputDecoration(labelText: "Course Number"),
                controller: _numberController,
                keyboardType: TextInputType.number,
                onChanged: (newNumber) {
                  classInfo.number = newNumber;
                },
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),
          IconButton(
            onPressed: () {
              bioInfo.classes.remove(classInfo);
              updateState();
            },
            icon: Icon(
              Icons.remove_circle,
              color: Colors.grey[400],
            ),
          )
        ],
      ));
    }

    columnChildren.add(
      Padding(
        child: RaisedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            bioInfo.classes.add(ClassObject());
            updateState();
          },
          child: Row(
            children: [
              Padding(
                child: Icon(Icons.add),
                padding: EdgeInsets.only(right: 16),
              ),
              Text("Add New Class", style: TextStyle(color: Colors.black)),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          color: Colors.grey[200],
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        ),
        padding: EdgeInsets.only(top: 10),
      ),
    );
    return columnChildren;
  }
}
