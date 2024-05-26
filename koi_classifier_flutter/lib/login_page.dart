import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _dio.post(
          'http://192.168.8.148:5000/login',
          data: {
            'username': _usernameController.text,
            'password': _passwordController.text,
          },
        );

        if (response.statusCode == 200) {
          final data = response.data;
          await _saveProfileData(data);
          // Navigate to the profile page with the username argument
          Navigator.pushReplacementNamed(context, '/main_page');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Invalid username or password')));
        }
      } catch (e) {
        print('Error logging in: $e');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred while logging in')));
      }
    }
  }

  Future<void> _saveProfileData(Map<String, dynamic> data) async {
    await _storage.write(key: 'token', value: data['token']);
    await _storage.write(key: 'username', value: data['username']);
    await _storage.write(key: 'firstname', value: data['firstname']);
    await _storage.write(key: 'lastname', value: data['lastname']);
    await _storage.write(key: 'email', value: data['email']);
    await _storage.write(key: 'mobile', value: data['mobile']);
    await _storage.write(key: 'userImage', value: data['userImage']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow icon
        title: Row(
          children: [
            Image.asset('assets/enter.png', width: 40, height: 40),
            SizedBox(width: 8),
            Text('Login'),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView( // Added to make the screen scrollable on small devices
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo2.png', width: 300, height: 200), // Add logo here
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login,
                        child: Text('Login'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('Don\'t have an account? Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
