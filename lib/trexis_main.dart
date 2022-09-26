import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trexis_app/blocs/posts_list_bloc_upgrade.dart';
import 'package:flutter_trexis_app/cubits/navigation_cubit.dart';
import 'package:flutter_trexis_app/navigation/bloc_cubit_navigator.dart';
import 'package:flutter_trexis_app/pages/counter_page_bloc_cubit.dart';
import 'package:flutter_trexis_app/pages/job_home_page.dart';
import 'package:flutter_trexis_app/pages/list_grid_tabs_page.dart';
import 'package:flutter_trexis_app/pages/login_page.dart';
import 'package:flutter_trexis_app/pages/posts_list_page.dart';
import 'package:flutter_trexis_app/pages/user_preferences_page.dart';
import 'package:flutter_trexis_app/pages/users_list_network_page.dart';

void main() {
  runApp(const TrexisApp());
}

class TrexisApp extends StatelessWidget {
  const TrexisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<PostsListBloc>(
              create: (context) => PostsListBloc()..add(LoadPostsEvent()),
            ),
            BlocProvider<NavigationCubit>(
              create: (context) => NavigationCubit(null),
            ),
          ],
          child: BlocCubitNavigator(),
        ));
  }
}
