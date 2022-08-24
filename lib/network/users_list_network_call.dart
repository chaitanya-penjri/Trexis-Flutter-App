import 'package:http/http.dart' as http;

class UsersService {
  Future<String> makeRequestToApi() async {
    // https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8
    var url = Uri.https("mocki.io", "/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8");
    var response = await http.get(url);

    return response.body;
  }
}