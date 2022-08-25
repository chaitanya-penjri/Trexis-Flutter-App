import 'package:flutter_trexis_app/models/user_preferences.dart';
import 'package:flutter_trexis_app/preferences/PreferenceService.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserPreferencesPage extends StatefulWidget {
  UserPreferencesPage({Key? key}) : super(key: key);

  final _preferenceService = PreferenceService();

  @override
  State<UserPreferencesPage> createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {
  var _nameController = TextEditingController();
  var _selectedJobType = JobTypes.BACKEND;
  var _selectedLanguages = Set<ProgrammingLanguages>();
  var _interestedInFlutter = false;

  @override
  void initState() {
    super.initState();

    _retrieveAndShowPreferences();
  }

  void _retrieveAndShowPreferences() async {
    final userPreferences = await widget._preferenceService.retrievePreferences();

    setState(() {
      _nameController.text = userPreferences.name;
      _selectedJobType = userPreferences.jobType;
      _selectedLanguages = userPreferences.programmingLanguages;
      _interestedInFlutter = userPreferences.isInterested;
    });
  }

  void _updatePreferences() async {
    await widget._preferenceService.updatePreferences(UserPreferences(
      name: _nameController.text,
      jobType: _selectedJobType,
      programmingLanguages: _selectedLanguages,
      isInterested: _interestedInFlutter,
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      scrollDirection: Axis.vertical,
      children: [
        ListTile(
          title: Text(
            'Enter Your Name',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          leading: Icon(
            Icons.drive_file_rename_outline_rounded,
          ),
          onTap: () {},
        ),
        ListTile(
          title: TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          trailing: Icon(
            Icons.save,
          ),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            'Choose Job Type',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          leading: Icon(
            Icons.drive_file_rename_outline_rounded,
          ),
          onTap: () {},
        ),
        RadioListTile<JobTypes>(
          title: Text('FrontEnd'),
          value: JobTypes.FRONTEND,
          groupValue: _selectedJobType,
          onChanged: (newValue) {
            setState(() {
              _selectedJobType = newValue!;
            });
          },
        ),
        RadioListTile<JobTypes>(
          title: Text('BackEnd'),
          value: JobTypes.BACKEND,
          groupValue: _selectedJobType,
          onChanged: (newValue) {
            setState(() {
              _selectedJobType = newValue!;
            });
          },
        ),
        RadioListTile<JobTypes>(
          title: Text('Mobile'),
          value: JobTypes.MOBILE,
          groupValue: _selectedJobType,
          onChanged: (newValue) {
            setState(() {
              _selectedJobType = newValue!;
            });
          },
        ),
        RadioListTile<JobTypes>(
          title: Text('Testing'),
          value: JobTypes.TESTING,
          groupValue: _selectedJobType,
          onChanged: (newValue) {
            setState(() {
              _selectedJobType = newValue!;
            });
          },
        ),
        ListTile(
          title: Text(
            'Select Programming Languages',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          leading: Icon(
            Icons.drive_file_rename_outline_rounded,
          ),
          onTap: () {},
        ),
        CheckboxListTile(
          title: Text('Swift'),
          value: _selectedLanguages.contains(ProgrammingLanguages.SWIFT),
          onChanged: (checked) {
            setState(() {
              (checked!)
                  ? _selectedLanguages.add(ProgrammingLanguages.SWIFT)
                  : _selectedLanguages.remove(ProgrammingLanguages.SWIFT);
            });
          },
        ),
        CheckboxListTile(
          title: Text('Kotlin'),
          value: _selectedLanguages.contains(ProgrammingLanguages.KOTLIN),
          onChanged: (checked) {
            setState(() {
              (checked!)
                  ? _selectedLanguages.add(ProgrammingLanguages.KOTLIN)
                  : _selectedLanguages.remove(ProgrammingLanguages.KOTLIN);
            });
          },
        ),
        CheckboxListTile(
          title: Text('Dart'),
          value: _selectedLanguages.contains(ProgrammingLanguages.DART),
          onChanged: (checked) {
            setState(() {
              (checked!)
                  ? _selectedLanguages.add(ProgrammingLanguages.DART)
                  : _selectedLanguages.remove(ProgrammingLanguages.DART);
            });
          },
        ),
        CheckboxListTile(
          title: Text('Javascript'),
          value: _selectedLanguages.contains(ProgrammingLanguages.JAVASCRIPT),
          onChanged: (checked) {
            setState(() {
              (checked!)
                  ? _selectedLanguages.add(ProgrammingLanguages.JAVASCRIPT)
                  : _selectedLanguages.remove(ProgrammingLanguages.JAVASCRIPT);
            });
          },
        ),
        CheckboxListTile(
          title: Text('Java'),
          value: _selectedLanguages.contains(ProgrammingLanguages.JAVA),
          onChanged: (checked) {
            setState(() {
              (checked!)
                  ? _selectedLanguages.add(ProgrammingLanguages.JAVA)
                  : _selectedLanguages.remove(ProgrammingLanguages.JAVA);
            });
          },
        ),
        ListTile(
          title: Text(
            'Select Whether Interested or Not',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          leading: Icon(
            Icons.drive_file_rename_outline_rounded,
          ),
          onTap: () {},
        ),
        SwitchListTile(
          title: Text('Interested In Flutter'),
          value: _interestedInFlutter,
          onChanged: (changed) {
            setState(() {
              _interestedInFlutter = changed;
            });
          },
        ),
        TextButton(onPressed: _updatePreferences, child: Text('Save/Update Preferences')),
        ListTile(
          title: Container(
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: Center(child: Text('End of Preferences!',
            style: GoogleFonts.vesperLibre(
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),)),
          ),
        )
      ],
    ));
  }
}
