import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart' as dio;

Future<void> _logout(BuildContext context) async {
  try {
    final FlutterSecureStorage _storage = FlutterSecureStorage();
    String? token = await _storage.read(key: 'token');
    final Dio _dio = Dio();
    final response = await _dio.post(
      'http://192.168.8.148:5000/logout',
      options: dio.Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      await _storage.deleteAll(); // Clear all stored user data
      Navigator.pushReplacementNamed(context, '/');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred while logging out')),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset(
                'assets/menu.png',
                width: 30,
                height: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 32, // Increased title size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/home'); // Navigate to login page
              },
              child: Image.asset(
                'assets/enter_btn.png', // Replace with your enter button image
                width: 200, // Adjust image width as needed
                height: 200, // Adjust image height as needed
              ),
            ),
            SizedBox(height: 100), // Increased margin top for the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/home'); // Navigate to login page
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.black), // Set button background color to black
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 20), // Button padding
                child: Text(
                  'Find Your KOI',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset('assets/profile.png', width: 40, height: 40),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Image.asset('assets/home.png', width: 40, height: 40),
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/main_page');
              },
            ),
            ListTile(
              leading: Image.asset('assets/fish.png', width: 40, height: 40),
              title: Text('Find Your Koi'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Image.asset('assets/recent.png', width: 40, height: 40),
              title: Text('History'),
              onTap: () {
                Navigator.pushNamed(context, '/history');
              },
            ),
            ListTile(
              leading: Image.asset('assets/library.png', width: 40, height: 40),
              title: Text('Library'),
              onTap: () {
                Navigator.pushNamed(context, '/library');
              },
            ),
            ListTile(
              leading: Image.asset('assets/about.png', width: 40, height: 40),
              title: Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Image.asset('assets/contact.png', width: 40, height: 40),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Image.asset('assets/tnc.png', width: 40, height: 40),
              title: Text('Terms and Conditions'),
              onTap: () {
                Navigator.pushNamed(context, '/tnc');
              },
            ),
            ListTile(
              leading: Image.asset('assets/pvc.png', width: 40, height: 40),
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.pushNamed(context, '/pvc');
              },
            ),
            ListTile(
              leading: Image.asset('assets/logout.png', width: 40, height: 40),
              title: Text('Logout'),
              onTap: () async {
                await _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
