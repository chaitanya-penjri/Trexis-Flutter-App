import 'dart:convert';

import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:http/http.dart' as http;


class PostsService {

  Future<List<PostTypicode>> getPostsFromNetwork() async {
    var uri = Uri.https("jsonplaceholder.typicode.com", "/posts");
    var postsResponse = await http.get(uri);
    var postsJson = jsonDecode(postsResponse.body) as List;
    return postsJson.map((post) => PostTypicode.fromJson(post)).toList();
  }
}