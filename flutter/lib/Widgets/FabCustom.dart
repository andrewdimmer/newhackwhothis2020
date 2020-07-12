import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class FabCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamed(context, '/Home');
        });
      },
      backgroundColor: Colors.blue[800],
      child: Icon(
        Icons.compare_arrows,
        color: Colors.white,
      ),
    );
  }
}
