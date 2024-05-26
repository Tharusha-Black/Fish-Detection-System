import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'models/user.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _storage = FlutterSecureStorage();
  User? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    // Fetch user data from secure storage or your backend
    final String? username = await _storage.read(key: 'username');
    final String? firstName = await _storage.read(key: 'firstname');
    final String? lastName = await _storage.read(key: 'lastname');
    final String? email = await _storage.read(key: 'email');
    final String? mobile = await _storage.read(key: 'mobile');
    final String? userImage = await _storage.read(key: 'userImage'); // Assuming userImage is the path

    setState(() {
      user = User(
        firstName: firstName ?? '',
        lastName: lastName ?? '',
        username: username ?? '',
        email: email ?? '',
        mobileNumber: mobile ?? '',
        profileImage: userImage ?? '',
      );
      isLoading = false;
    });
  }

  void _logout() async {
    await _storage.deleteAll();
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _goHome() {
    Navigator.pushReplacementNamed(context, '/main_page');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/menu.png',
            width: 20,
            height: 20,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous page
          },
        ),
        title: Text('User Profile'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : user == null
              ? Center(child: Text('User not found'))
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 80, // Larger profile image
                        backgroundImage: user!.profileImage.isNotEmpty
                            ? FileImage(File(user!.profileImage))
                            : AssetImage('assets/logo.png')
                                as ImageProvider,
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username: ${user!.username}', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 10),
                            Text('First Name: ${user!.firstName}', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 10),
                            Text('Last Name: ${user!.lastName}', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 10),
                            Text('Email: ${user!.email}', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 10),
                            Text('Mobile: ${user!.mobileNumber}', style: TextStyle(fontSize: 18)),
                          ],
                        ),
                      ),
                      Spacer(), // Push buttons to the bottom
                      Padding(
                        padding: const EdgeInsets.only(bottom: 60), // Increased bottom margin
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _logout,
                              icon: Image.asset('assets/logout.png', width: 20, height: 20),
                              label: Text('Logout'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: TextStyle(fontSize: 16),
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: _goHome,
                              icon: Image.asset('assets/home.png', width: 20, height: 20),
                              label: Text('Home'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                textStyle: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
