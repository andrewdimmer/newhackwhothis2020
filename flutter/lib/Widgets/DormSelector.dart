import 'package:classmate_connect/Classes/BioObject.dart';
import 'package:classmate_connect/Classes/DormObject.dart';
import 'package:flutter/material.dart';

class DormSelector extends StatelessWidget {
  DormSelector({Key key, this.bioInfo, this.updateState}) : super(key: key);

  final BioObject bioInfo;
  final Function updateState;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: bioInfo.dorm.dorm,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      focusColor: Theme.of(context).primaryColor,
      underline: Container(
        height: 1,
        color: Colors.grey[400],
      ),
      onChanged: (String newValue) {
        bioInfo.dorm = DormObject(dorm: newValue, floor: null);
        updateState();
      },
      items: <String>[
        'Select a Dorm',
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
    );
  }
}
