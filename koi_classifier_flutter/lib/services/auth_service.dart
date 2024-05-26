import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class AuthService {
  final String baseUrl;

  AuthService({required this.baseUrl});

  Future<Map<String, dynamic>?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {'error': json.decode(response.body)['error']};
    }
  }

  Future<User?> getUserProfile(String username) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user_profile?username=$username'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  // New method to get the current user's information
  Future<User?> getCurrentUser() async {
    // Example implementation using a hardcoded username
    // Replace this with your actual implementation to get the current user's information
    final username = 'your-username';

    return getUserProfile(username);
  }
}
