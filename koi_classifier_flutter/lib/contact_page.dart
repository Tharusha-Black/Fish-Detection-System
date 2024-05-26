import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final String email = 'koily2024072@gmail.com';
  final String phone = '+94 773316718';
  final String facebookUrl = 'https://www.facebook.com/koily';
  final String instagramUrl = 'https://www.instagram.com/koily';

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We love hearing from our users! If you have any questions, feedback, or suggestions, please don\'t hesitate to get in touch with us.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Image.asset('assets/email.png', width: 24, height: 24),
                SizedBox(width: 8),
                Text(
                  'Email:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Image.asset('assets/phone.png', width: 24, height: 24),
                SizedBox(width: 8),
                Text(
                  'Phone:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              phone,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'Join Our Community',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Follow us on social media to stay updated on the latest features, koi care tips, and community events.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launchUrl(facebookUrl),
              child: Row(
                children: [
                  Image.asset('assets/facebook.png', width: 24, height: 24),
                  SizedBox(width: 8),
                  Text(
                    'Facebook:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'facebook.com/koily',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () => _launchUrl(instagramUrl),
              child: Row(
                children: [
                  Image.asset('assets/instagram.png', width: 24, height: 24),
                  SizedBox(width: 8),
                  Text(
                    'Instagram:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'instagram.com/koily',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
            SizedBox(height: 24),
            Text(
              'Thank You',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Thank you for choosing Koily. We hope our app helps you to better appreciate and care for your koi fish. Dive in and explore the fascinating world of koi with us!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
