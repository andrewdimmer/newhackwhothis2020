import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Pages/Profile.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  final BioObject bio;
  final List<QAObject> answers;

  Contact({this.bio, this.answers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: GestureDetector(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                children: [
                  Text(bio.firstName + " " + bio.lastName),
                  Text(
                    bio.email,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
            )
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(
                      bio: bio,
                      answers: answers,
                    )),
          );
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final BioObject bio;
  final List<QAObject> answers;

  ProfilePage({this.bio, this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Classmate Connector"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Profile(
          bio: bio,
          questionsAndAnswers: answers,
        ),
      ),
    );
  }
}
