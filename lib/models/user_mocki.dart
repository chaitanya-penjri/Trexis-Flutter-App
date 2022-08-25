import 'dart:convert';

class UserMockiResponse {
  final List<UserMocki> users;

  UserMockiResponse({required this.users});

  factory UserMockiResponse.fromJson(dynamic json) {
    print(json);
    var users = json as List;
    return UserMockiResponse(users: users.map((u) => UserMocki.fromJson(u)).toList());
  }
}

class UserMocki {
  final String name;
  final String city;

  UserMocki({required this.name, required this.city});

  factory UserMocki.fromJson(dynamic json) {
    return UserMocki(
      name: json['name']! as String,
      city: json['city']! as String,
    );
  }

  String firstLastNameLetters() {
    return this.name.split(' ').map((n) => n[0]).join('');
  }

  String snackBarMessage() {
    return this.name + ' is came from the ' + this.city;
  }

  @override
  String toString() {
    return '{ name : ${this.name}, city : ${this.city} }';
  }
}
