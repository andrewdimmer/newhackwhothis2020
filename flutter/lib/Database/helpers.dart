import 'dart:convert';

import 'package:classmate_connector/Classes/BioObject.dart';

List<BioWithScoreObject> parseJsonStringToBioWithScoresObject(
    String jsonString) {
  List<dynamic> toApprove = json.decode(jsonString)["toApprove"];
  return toApprove.map((note) {
    return BioWithScoreObject.fromJson(json.decode(json.encode(note)));
  }).toList();
}
