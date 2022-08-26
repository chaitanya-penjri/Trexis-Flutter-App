import 'dart:convert';

import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:flutter_trexis_app/models/user_mocki.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<List<UserMocki>> makeRequestToApi() async {
    // https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8
    var url = Uri.https("mocki.io", "/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8");
    var response = await http.get(url);

    final json = jsonDecode(response.body);
    var usersResponse = UserMockiResponse.fromJson(json);

    return usersResponse.users;
  }

  Future<PostTypicode> makePostRequestAPost() async {
    var url = Uri.https("jsonplaceholder.typicode.com", "/posts");
    var response = await http.post(url, body: {
      'title': 'Trexis',
      'body': 'Sample Post Request',
      'userId': '8',
    });

    final json = jsonDecode(response.body);

    return PostTypicode.fromJson(json);
  }
}