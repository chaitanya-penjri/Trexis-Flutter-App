
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:flutter_trexis_app/network/posts_list_network_call.dart';

class PostsListCubit extends Cubit<List<PostTypicode>> {
  PostsListCubit() : super([]);

  var _postsService = PostsService();

  void getPosts() async => emit(await _postsService.getPostsFromNetwork());
}