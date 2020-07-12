import 'package:classmate_connect/Classes/ClassObject.dart';
import 'package:classmate_connect/Classes/DormObject.dart';

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
