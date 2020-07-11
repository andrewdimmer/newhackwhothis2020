import 'package:classmate_connect/Routes/Questions.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {
  final Function setStage;

  Password(this.setStage);

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

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
            decoration: InputDecoration(labelText: "Password"),
            controller: _controller,
            obscureText: true,
          ),
          Padding(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: "Confirm Password"),
              controller: _controller2,
              obscureText: true,
            ),
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          ),
          Padding(
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: () {
                    setStage(Stage.email);
                    _controller.clear();
                    _controller2.clear();
                  },
                  child: Text("Cancel"),
                ),
                RaisedButton(
                  onPressed: () {
                    setStage(Stage.bio);
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
