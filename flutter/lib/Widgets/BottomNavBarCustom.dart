import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BottomNavBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: RaisedButton(
              onPressed: () {
                print("Left button pressed");
              },
              color: Colors.blue[800],
              child: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue[800])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: RaisedButton(
              onPressed: () {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(context, '/Users');
                });
              },
              color: Colors.blue[800],
              child: Icon(
                Icons.view_headline,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue[800])),
            ),
          ),
        ],
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
