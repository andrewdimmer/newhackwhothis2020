import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:flutter/material.dart';

final TextEditingController _floorController = TextEditingController();

class DormSelector extends StatelessWidget {
  DormSelector({Key key, this.bioInfo, this.updateState}) : super(key: key) {
    _floorController.text =
        bioInfo.dorm.floor == null ? "" : bioInfo.dorm.floor.toString();
  }

  final BioObject bioInfo;
  final Function updateState;

  final List<String> dormList = [
    'Select a Dorm',
    'Dorm One',
    'Dorm Two',
    'Dorm Three',
    'Dorm Four',
    'Off Campus',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getColumnChildren(),
    );
  }

  List<Widget> getColumnChildren() {
    List<Widget> columnChildren = [
      Padding(
        child: DropdownButton<String>(
          isExpanded: true,
          value: bioInfo.dorm.dorm,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 1,
            color: Colors.grey[400],
          ),
          onChanged: (String newValue) {
            bioInfo.dorm = DormObject(dorm: newValue, floor: null);
            updateState();
          },
          items: dormList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      ),
    ];

    if (bioInfo.dorm.dorm.indexOf("Select a Dorm") < 0 &&
        bioInfo.dorm.dorm.indexOf("Off Campus") < 0) {
      columnChildren.add(
        TextField(
          decoration: InputDecoration(labelText: "Floor"),
          controller: _floorController,
          keyboardType: TextInputType.number,
          onChanged: (newFirstName) {
            bioInfo.dorm = DormObject(
              dorm: bioInfo.dorm.dorm,
              floor: int.parse(_floorController.text),
            );
          },
        ),
      );
    }
    return columnChildren;
  }
}
