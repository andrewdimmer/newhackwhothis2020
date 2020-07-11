import 'package:classmate_connect/Classes/ClassObject.dart';

class BioObject {
  String firstName;
  String lastName;
  String bio;
  List<ClassObject> classes;
  String dorm;
  String floor;
  String classLevel;

  BioObject(this.firstName, this.lastName, this.bio, this.classes, this.dorm,
      this.floor, this.classLevel);
}
