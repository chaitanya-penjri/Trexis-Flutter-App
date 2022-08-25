import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trexis_app/models/user_mocki.dart';
import 'package:flutter_trexis_app/network/users_list_network_call.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({Key? key}) : super(key: key);

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  final _usersService = UsersService();
  List<UserMocki>? _response;

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
      body: Center(child: Builder(builder: (_) {
        if (_response != null) {
          return ListView.builder(
              itemCount: _response!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange[800]),
                    child: Center(
                      child: Text(
                        _response![index].firstLastNameLetters(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  title: Text(
                    _response![index].name,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'From ' + _response![index].city,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  trailing: Icon(
                    CupertinoIcons.airplane,
                    color: Colors.lightBlue[400],
                  ),
                  tileColor: Color(0xFFFEEFFF),
                  textColor: Colors.brown,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.blue,
                        elevation: 100,
                        margin: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        behavior: SnackBarBehavior.floating,
                        content: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(child: Text(_response![index].snackBarMessage())),
                        ),
                      ),
                    );
                  },
                );
              });
        } else {
          return ElevatedButton(
            onPressed: _getUsersList,
            child: Text('Make a Request!'),
          );
        }
      })),
    );
  }
}
