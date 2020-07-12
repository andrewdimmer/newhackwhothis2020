import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Classes/QAObject.dart';
import 'package:classmate_connector/Data/Data.dart';
import 'package:classmate_connector/Database/helpers.dart';
import 'package:http/http.dart' as http;

Future<bool> createNewStudentDatabaseHandler(
    BioObject bioInfo, List<QAObject> questions) async {
  final response = await http.post(
      'https://us-central1-dimmer-hacks.cloudfunctions.net/newhackwhothis2020_create_new_student',
      body: '{"firstName": "' +
          bioInfo.firstName +
          '", "lastName": "' +
          bioInfo.lastName +
          '", "email": "' +
          bioInfo.email +
          '", "classLevel": "' +
          bioInfo.classLevel +
          '", "bio": "' +
          bioInfo.bio +
          '", "classes": ' +
          bioInfo.classes
              .map((classInfo) {
                return '{"dept": "' +
                    classInfo.dept +
                    '", "number": ' +
                    classInfo.number +
                    '}';
              })
              .toList()
              .toString() +
          ', "questions": ' +
          questions
              .map((questionInfo) {
                return '{"questionNumber": ' +
                    questionInfo.questionNumber.toString() +
                    ', "answerIndex": ' +
                    questionInfo.answer.toString() +
                    '}';
              })
              .toList()
              .toString() +
          ', "dorm": { "dorm": "' +
          bioInfo.dorm.dorm +
          '"' +
          (bioInfo.dorm.floor != null
              ? (', "floor": ' + bioInfo.dorm.floor.toString())
              : "") +
          ' }}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<BioWithScoreObject> results =
        parseJsonStringToBioWithScoresObject(response.body);
    return setToApprove(results).then((value) => true);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    throw Exception("Failed to create new student.");
  }
}
