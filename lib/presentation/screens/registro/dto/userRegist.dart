import 'dart:convert';

class UserRegistration {
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  UserRegistration({
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  String toJsonString() => jsonEncode(toJson());
}
