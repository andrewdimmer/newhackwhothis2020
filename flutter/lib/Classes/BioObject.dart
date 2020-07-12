import 'dart:convert';
import 'package:classmate_connector/Classes/ClassObject.dart';
import 'package:classmate_connector/Classes/DormObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';

class BioObject {
  String firstName;
  String lastName;
  String email;
  String bio;
  List<ClassObject> classes;
  DormObject dorm;
  String classLevel;

  BioObject(
      {this.firstName,
      this.lastName,
      this.email,
      this.bio,
      this.classes,
      this.dorm,
      this.classLevel});
}

class BioWithScoreObject extends BioObject {
  final int score;
  final int status;
  final List<QALiteObject> questions;

  BioWithScoreObject({
    String firstName,
    String lastName,
    String email,
    String bio,
    List<ClassObject> classes,
    DormObject dorm,
    String classLevel,
    this.score,
    this.status,
    this.questions,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          bio: bio,
          classes: classes,
          dorm: dorm,
          classLevel: classLevel,
        );

  factory BioWithScoreObject.fromJson(Map<String, dynamic> jsonMap) {
    return BioWithScoreObject(
      firstName: jsonMap["firstName"],
      lastName: jsonMap["lastName"],
      email: jsonMap["email"],
      bio: jsonMap["bio"],
      classLevel: jsonMap["classLevel"],
      score: jsonMap["score"],
      status: jsonMap["status"],
      classes: (jsonMap["classes"] as List<dynamic>).map((classInfo) {
        Map<String, dynamic> classInfoParsed =
            json.decode(json.encode(classInfo));
        return ClassObject(
          dept: classInfoParsed["dept"],
          number: classInfoParsed["number"].toString(),
        );
      }).toList(),
      dorm: (dormInfo) {
        Map<String, dynamic> dormInfoParsed =
            json.decode(json.encode(dormInfo));
        return DormObject(
          dorm: dormInfoParsed["dorm"],
          floor:
              dormInfoParsed["floor"] != null ? dormInfoParsed["floor"] : null,
        );
      }(jsonMap["dorm"]),
      questions: (jsonMap["questions"] as List<dynamic>).map((questionInfo) {
        Map<String, dynamic> questionInfoParsed =
            json.decode(json.encode(questionInfo));
        return QALiteObject(
          questionNumber: questionInfoParsed["questionNumber"],
          answer: questionInfoParsed["answerIndex"],
        );
      }).toList(),
    );
  }
}
