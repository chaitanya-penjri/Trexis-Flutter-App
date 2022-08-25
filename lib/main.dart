import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/job_home_page.dart';
import 'package:flutter_trexis_app/login_page.dart';
import 'package:flutter_trexis_app/user_preferences_page.dart';
import 'package:flutter_trexis_app/users_list_network_page.dart';

void main() {
  runApp(const TrexisApp());
}

class TrexisApp extends StatelessWidget {
  const TrexisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UsersListPage(),
    );
  }
}

