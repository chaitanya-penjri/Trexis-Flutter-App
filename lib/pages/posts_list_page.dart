import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:flutter_trexis_app/network/posts_list_cubit.dart';


class PostsListPage extends StatelessWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Posts'),
      ),
      body: BlocBuilder<PostsListCubit, List<PostTypicode>>(
        builder: (context, posts) {
          if (posts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
              ),
            );
          });
        },
      ),
    );
  }
}
