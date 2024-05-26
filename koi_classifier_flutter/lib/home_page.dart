import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final picker = ImagePicker();
  String? _class;
  double? _probability;
  String? _description;
  bool _isImageSelected = false;
  bool _isLoading = false;
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _isImageSelected = true;
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _isImageSelected = true;
      }
    });
  }

  Future classifyImage() async {
    if (_image == null) {
      return;
    }

    final uri = Uri.parse('http://192.168.8.148:5000/classify');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', _image!.path));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _class = data['class'];
        _probability = data['probability'];
        _description = data['description'];
      });

      _saveToHistory();
      _showPopupCard(context);
    }
  }

  Future<void> _saveToHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? historyString = prefs.getString('history');
    List<Map<String, dynamic>> history = historyString != null
        ? List<Map<String, dynamic>>.from(json.decode(historyString))
        : [];

    history.add({
      'imagePath': _image!.path,
      'class': _class,
      'probability': _probability,
      'description': _description,
    });

    await prefs.setString('history', json.encode(history));
  }

  void _showPopupCard(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            title: Text('Classification Result'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Variety: $_class'),
                SizedBox(height: 8),
                Text(
                    'Probability: ${(_probability! * 100).toStringAsFixed(2)}%'),
                SizedBox(height: 8),
                Text('Description: $_description'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _reset() {
    setState(() {
      _image = null;
      _isImageSelected = false;
      _class = null;
      _probability = null;
      _description = null;
    });
  }

  Future<void> _logout(BuildContext context) async {
    try {
      String? token = await _storage.read(key: 'token');
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Please upload or capture image",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              if (_isImageSelected) ...[
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 252, 252),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (_isLoading)
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    classifyImage().then((_) {
                      setState(() {
                        _isLoading = false;
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/check.png', width: 24, height: 24),
                        SizedBox(width: 8),
                        Text('Classify Image', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _reset,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/refresh.png',
                            width: 24, height: 24),
                        SizedBox(width: 8),
                        Text('Retake Image', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
              ] else ...[
                Spacer(),
                GestureDetector(
                  onTap: getImageFromCamera,
                  child: Container(
                    width: 150,
                    height: 150,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/capture.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(height: 8),
                        Text('Capture Image', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: getImageFromGallery,
                  child: Container(
                    width: 150,
                    height: 150,
                    padding: const EdgeInsets.all(16.0),
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/upload_btn.png',
                          width: 70,
                          height: 70,
                        ),
                        SizedBox(height: 8),
                        Text('Upload Image', style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ],
          ),
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
