import 'dart:convert';

import 'package:flutter_trexis_app/models/user_mocki.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersService {
  Future<List<UserMocki>> makeRequestToApi() async {
    // https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8
    var url = Uri.https("mocki.io", "/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8");
    var response = await http.get(url);

    final json = jsonDecode(response.body);
    var usersResponse = UserMockiResponse.fromJson(json);

    return usersResponse.users;
  }
}