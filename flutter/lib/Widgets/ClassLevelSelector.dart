import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:flutter/material.dart';

class ClassLevelSelector extends StatelessWidget {
  ClassLevelSelector({Key key, this.bioInfo, this.updateState})
      : super(key: key);

  final BioObject bioInfo;
  final Function updateState;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      ["Freshman", "Sophomore"],
      ["Junior", "Senior"],
      ["Graduate", "Other"]
    ].map((row) {
      return Row(
          children: row.map((value) {
        return Expanded(
          child: Padding(
            child: RaisedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  bioInfo.classLevel = value;
                  updateState();
                },
                child: Text(value,
                    style: TextStyle(
                        color: (bioInfo.classLevel.indexOf(value) == 0 &&
                                value.indexOf(bioInfo.classLevel) == 0)
                            ? Colors.white
                            : Colors.black)),
                color: (bioInfo.classLevel.indexOf(value) == 0 &&
                        value.indexOf(bioInfo.classLevel) == 0)
                    ? Theme.of(context).accentColor
                    : Colors.grey[200]),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          ),
        );
      }).toList());
    }).toList());
  }
}
