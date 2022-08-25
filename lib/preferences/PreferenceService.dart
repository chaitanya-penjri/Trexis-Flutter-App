import 'package:flutter_trexis_app/models/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  Future updatePreferences(UserPreferences preferences) async {
    final _sharedPrefs = await SharedPreferences.getInstance();

    await _sharedPrefs.setString('name', preferences.name);
    await _sharedPrefs.setBool('is_interested', preferences.isInterested);
    await _sharedPrefs.setInt('job_type', preferences.jobType.index);
    await _sharedPrefs.setStringList(
        'programming_languages',
        preferences.programmingLanguages
            .map((pl) => pl.index.toString())
            .toList());

    print('Preferences Saved!');
  }

  Future<UserPreferences> retrievePreferences() async {
    final _sharedPrefs = await SharedPreferences.getInstance();

    return UserPreferences(
      name: _sharedPrefs.getString('name') ?? '',
      jobType: JobTypes.values[_sharedPrefs.getInt('job_type') ?? 0],
      programmingLanguages:
          (_sharedPrefs.getStringList('programming_languages') ?? [])
              .map((pl) => ProgrammingLanguages.values[int.parse(pl)])
              .toSet(),
      isInterested: _sharedPrefs.getBool('is_interested') ?? false,
    );
  }
}
