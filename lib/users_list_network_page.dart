import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/network/users_list_network_call.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {

  final _usersService = UsersService();
  String? _response;

  void _getUsersList() async {
    print('before response');
    final response = await _usersService.makeRequestToApi();
    setState(() {
      _response = response;
    });
    print('after response ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Builder(builder: (_) {
            if (_response != null) {
              return Text(_response!);
            } else {
             return ElevatedButton(
                 onPressed: _getUsersList,
                 child: Text('Make a Request!')
             );
            }
          })
      ),
    );
  }
}
