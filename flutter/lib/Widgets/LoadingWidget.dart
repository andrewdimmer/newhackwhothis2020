import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({Key key, this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          child: CircularProgressIndicator(),
          padding: EdgeInsets.all(16),
        ),
        Center(
          child: Text(
            message,
          ),
        ),
      ],
    );
  }
}
