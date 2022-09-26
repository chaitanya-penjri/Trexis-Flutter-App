

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';

class NavigationCubit extends Cubit<PostTypicode?> {
  NavigationCubit(super.initialState);

  void showPostDetails(PostTypicode post) => emit(post);

  void popToPostsList() => emit(null);
}