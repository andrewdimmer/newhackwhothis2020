import 'package:classmate_connector/Routes/Questions.dart';
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
                    if (_controller.text.contains(_controller2.text) &&
                        _controller2.text.contains(_controller.text) &&
                        _controller.text.length >= 8) {
                      setStage(Stage.bio);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Passwords need to match and be at least 8 characters.',
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
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
    )));
  }
}
