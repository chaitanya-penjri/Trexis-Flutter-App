import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserPreferencesPage extends StatefulWidget {
  const UserPreferencesPage({Key? key}) : super(key: key);

  @override
  State<UserPreferencesPage> createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {

  String someValue = '';

  Future<SharedPreferences> _getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  void _storeValue() async {
    var sharedPrefs = await _getSharedPreferences();

    await sharedPrefs.setString('trexis_office', 'Atlanta, GA');
  }

  void _retrieveValue() async {
    var sharedPrefs = await _getSharedPreferences();

    var value = await sharedPrefs.getString('trexis_office');
    setState(() {
      someValue = value ?? "No value is There!";
    });
  }

  void _removeValue() async {
    var sharedPrefs = await _getSharedPreferences();

    await sharedPrefs.remove('trexis_office');
    _retrieveValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Trexis Located in $someValue'),

            ElevatedButton(
              onPressed: _storeValue,
              child: Text('Save Value'),
            ),

            ElevatedButton(
              onPressed: _retrieveValue,
              child: Text('Retrieve Value!'),
            ),

            ElevatedButton(
              onPressed: _removeValue,
              child: Text('Remove Value!'),
            ),
          ],
        ),
      ),
    );
  }
}
