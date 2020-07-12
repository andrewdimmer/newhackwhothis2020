import 'package:classmate_connector/Classes/BioObject.dart';
import 'package:classmate_connector/Data/Data.dart';
import 'package:classmate_connector/Database/helpers.dart';
import 'package:http/http.dart' as http;

Future<bool> getToApproveDatabaseHandler(String requesterEmail) async {
  final response = await http.post(
      'https://us-central1-dimmer-hacks.cloudfunctions.net/newhackwhothis2020_get_to_approve',
      body: requesterEmail);

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
    throw Exception("Failed to get people to approve.");
  }
}

Future<bool> getMatchesDatabaseHandler(String requesterEmail) async {
  final response = await http.post(
      'https://us-central1-dimmer-hacks.cloudfunctions.net/newhackwhothis2020_get_matches',
      body: requesterEmail);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<BioWithScoreObject> results =
        parseJsonStringToBioWithScoresObject(response.body);
    return setMatches(results).then((value) => true);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    throw Exception("Failed to get people to approve.");
  }
}
