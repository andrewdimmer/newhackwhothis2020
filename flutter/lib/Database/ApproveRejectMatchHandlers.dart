import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> approveDatabaseHandler(
    String approverEmail, String approveeEmail) async {
  final response = await http.post(
      'https://us-central1-dimmer-hacks.cloudfunctions.net/newhackwhothis2020_approve',
      body: '{"approverEmail": "' +
          approverEmail +
          '", "approveeEmail": "' +
          approveeEmail +
          '"}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body) as bool;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    throw Exception("Failed to approve " + approveeEmail + ".");
  }
}

Future<bool> rejectDatabaseHandler(
    String rejecterEmail, String rejecteeEmail) async {
  final response = await http.post(
      'https://us-central1-dimmer-hacks.cloudfunctions.net/newhackwhothis2020_reject',
      body: '{"rejecterEmail": "' +
          rejecterEmail +
          '", "rejecteeEmail": "' +
          rejecteeEmail +
          '"}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body) as bool;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    throw Exception("Failed to reject " + rejecteeEmail + ".");
  }
}

Future<bool> matchDatabaseHandler(
    String matcherEmail, String matcheeEmail) async {
  final response = await http.post(
      'https://us-central1-dimmer-hacks.cloudfunctions.net/newhackwhothis2020_match',
      body: '{"matcherEmail": "' +
          matcherEmail +
          '", "matcheeEmail": "' +
          matcheeEmail +
          '"}');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return json.decode(response.body) as bool;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.statusCode);
    print(response.reasonPhrase);
    print(response.body);
    throw Exception("Failed to match " + matcheeEmail + ".");
  }
}
