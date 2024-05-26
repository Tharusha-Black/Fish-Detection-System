import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
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
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Last updated: [5/17/2024]',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to Koily! These Terms and Conditions govern your use of the Koily mobile application ("App") and any related services we provide. By downloading, installing, or using Koily, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the App.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '1. Acceptance of Terms',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'By accessing or using Koily, you agree to comply with and be bound by these Terms. We may update these Terms from time to time, and your continued use of the App constitutes acceptance of any changes. Please review these Terms regularly.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            // Continue adding the rest of the sections similarly
            Text(
              'Koily provides users with the ability to identify koi fish varieties through image recognition technology, access a library of koi fish information, and use other features such as user login and registration. Additional features may be added in the future.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '3. User Accounts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Registration: To access certain features of the App, you must create an account. You agree to provide accurate, current, and complete information during the registration process.\n'
              '• Responsibility: You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.\n'
              '• Termination: We reserve the right to terminate or suspend your account at any time for any reason, including if we believe you have violated these Terms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '4. Use of the App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• License: We grant you a limited, non-exclusive, non-transferable, and revocable license to use the App for personal, non-commercial use in accordance with these Terms.\n'
              '• Restrictions: You agree not to:\n'
              '  - Use the App for any illegal or unauthorized purpose.\n'
              '  - Modify, adapt, hack, or reverse engineer the App.\n'
              '  - Use the App in any manner that could interfere with, disrupt, negatively affect, or inhibit other users from fully enjoying the App.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '5. Content and Intellectual Property',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Ownership: All content and materials available on the App, including but not limited to text, graphics, logos, images, and software, are the property of Koily or its licensors and are protected by intellectual property laws.\n'
              '• License to Use Content: You are granted a limited license to access and use the content provided through the App for personal, non-commercial use. You may not copy, reproduce, distribute, or create derivative works from the content without our express written permission.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '6. User-Generated Content',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Responsibility: You are solely responsible for any content you upload or post through the App, including images, comments, and other materials.\n'
              '• License: By posting content, you grant us a non-exclusive, worldwide, royalty-free license to use, display, reproduce, and distribute your content in connection with the operation and promotion of the App.\n'
              '• Prohibited Content: You agree not to upload or post content that is illegal, offensive, or infringes on the rights of others.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '7. Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your use of the App is also governed by our Privacy Policy, which explains how we collect, use, and protect your personal information. By using the App, you consent to our collection and use of your data as described in the Privacy Policy.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '8. Disclaimers and Limitation of Liability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Disclaimers: The App is provided on an "as-is" and "as-available" basis. We make no warranties, express or implied, regarding the App, including but not limited to its accuracy, reliability, or availability.\n'
              '• Limitation of Liability: To the fullest extent permitted by law, Koily shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or in connection with your use of the App.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '9. Indemnification',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You agree to indemnify, defend, and hold harmless Koily and its officers, directors, employees, and agents from and against any claims, liabilities, damages, losses, and expenses, including legal fees, arising out of or in any way connected with your use of the App or violation of these Terms.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
             Text(
              '10. Governing Law',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'These Terms shall be governed by and construed in accordance with the laws of Sri Lanka, without regard to its conflict of law principles. Any disputes arising under or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts located in Panadura.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '11. Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about these Terms, please contact us at:\n'
              '• Email: koily2024072@gmail.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              'By using Koily, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
