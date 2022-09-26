import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/cubits/navigation_cubit.dart';
import 'package:flutter_trexis_app/models/post_typicode.dart';
import 'package:flutter_trexis_app/pages/post_detail_page.dart';

import '../pages/posts_list_page.dart';

class BlocCubitNavigator extends StatelessWidget {
  const BlocCubitNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, PostTypicode?>(
      builder: (context, post) {
        return Navigator(
          pages: [
            MaterialPage(child: PostsListPage()),
            if (post != null) MaterialPage(child: PostDetailsView(post: post)),
          ],
          onPopPage: (route, result) {
            context.read<NavigationCubit>().popToPostsList();
            route.didPop(result);
            return true;
          },
        );
      },
    );
  }
}
