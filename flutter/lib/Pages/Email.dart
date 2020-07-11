import 'package:classmate_connect/Routes/Questions.dart';
import 'package:flutter/material.dart';

class Email extends StatelessWidget {
  final Function setEmail;
  final Function setStage;

  Email(this.setEmail, this.setStage);

  final TextEditingController _controller = TextEditingController();

  void clearEmail() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return (Center(
        child: Padding(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "Email"),
            controller: _controller,
          ),
          Padding(
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  child: Text("Cancel"),
                ),
                RaisedButton(
                  onPressed: () {
                    setEmail(_controller.text);
                    setStage(Stage.password);
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
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    )));
  }
}
