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
                    String email = _controller.text.trim().toLowerCase();
                    Iterable<RegExpMatch> regexMatches = (new RegExp(
                            "[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}",
                            caseSensitive: false))
                        .allMatches(email);
                    bool validEmail = false;
                    for (var match in regexMatches) {
                      print(match.group(0));
                      if (match.group(0).contains(email)) {
                        validEmail = true;
                      }
                    }
                    if (validEmail) {
                      setEmail(email);
                      setStage(Stage.password);
                    } else {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Please enter a valid email address.',
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
