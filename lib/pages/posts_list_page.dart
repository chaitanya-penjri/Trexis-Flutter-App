import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:flutter_trexis_app/network/posts_list_bloc_upgrade.dart';


class PostsListPage extends StatelessWidget {
  const PostsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Posts'),
      ),
      body: BlocBuilder<PostsListBloc, PostsState>(
        builder: (context, postsState) {
          switch (postsState.runtimeType) {
            case LoadingPostsState: {
              return Center(child: CircularProgressIndicator());
            }
            case LoadedPostsState: {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PostsListBloc>().add(PullToRefreshEvent());
                },
                child: ListView.builder(
                  itemCount: (postsState as LoadedPostsState).posts.length,
                    itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(postsState.posts[index].title),
                      subtitle: Text(postsState.posts[index].body),
                    ),
                  );
                }),
              );
            }
            case FailedToLoadPostsState: {
              return Center(
                child: Text('Error Occurred : ${(postsState as FailedToLoadPostsState).error}'),
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
