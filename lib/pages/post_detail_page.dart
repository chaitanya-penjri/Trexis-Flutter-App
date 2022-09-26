import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';

class PostDetailsView extends StatelessWidget {
  final PostTypicode post;

  const PostDetailsView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('User ID : '+post.userId.toString()),
            Text('ID : '+post.id.toString()),
            Text('Body : '+post.body),
          ],
        ),
      ),
    );
  }
}
