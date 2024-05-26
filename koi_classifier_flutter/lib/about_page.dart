import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'assets/menu.png',
            width: 30,
            height: 30,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to login page
          },
        ),
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Koily!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'At Koily, we share a deep passion for koi fish and are dedicated to providing koi enthusiasts with a powerful tool to identify and learn about various koi fish varieties. Our mobile application leverages advanced image recognition technology to accurately identify different koi fish varieties, making it easier than ever to appreciate the intricate beauty and diversity of koi.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our mission is to empower koi enthusiasts of all levels with the knowledge and tools to identify, appreciate, and care for koi fish. Whether you\'re a seasoned koi keeper, a hobbyist, or simply fascinated by these magnificent creatures, Koily is here to enhance your experience and deepen your understanding.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'How It Works',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Using cutting-edge image recognition technology, Koily allows you to either upload an image or capture a photo of any koi fish. Our system then analyzes the image and identifies the specific variety, providing you with detailed information about its characteristics, history, and care requirements. This feature ensures that you can easily understand and care for your koi, helping them thrive in your pond or aquarium.',
              style: TextStyle(fontSize: 16),
            ),
            // Add more text sections here...
          ],
        ),
      ),
    );
  }
}
