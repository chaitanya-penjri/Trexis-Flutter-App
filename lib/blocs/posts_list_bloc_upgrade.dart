
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:flutter_trexis_app/network/posts_list_network_call.dart';

// The cubit class below is upgraded to bloc which is below this class.
class PostsListCubit extends Cubit<List<PostTypicode>> {
  PostsListCubit() : super([]);

  var _postsService = PostsService();

  void getPosts() async => emit(await _postsService.getPostsFromNetwork());
}

abstract class PostsEvent {}

class LoadPostsEvent extends PostsEvent {}

abstract class PostsState {}

class PullToRefreshEvent extends PostsEvent {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<PostTypicode> posts;
  LoadedPostsState({required this.posts});
}

class FailedToLoadPostsState extends PostsState {
  String error;
  FailedToLoadPostsState({required this.error});
}


class PostsListBloc extends Bloc<PostsEvent, PostsState> {
  final _postsService = PostsService();

  PostsListBloc() : super(LoadingPostsState()) {
    on<PostsEvent>((event, emit) async {
      try {
        final _posts = await _postsService.getPostsFromNetwork();

        if (event is LoadPostsEvent || event is PullToRefreshEvent) {
          emit(LoadedPostsState(posts: _posts));
        }
      } catch(e) {
        emit(FailedToLoadPostsState(error: e.toString()));
      }
    });
  }
}