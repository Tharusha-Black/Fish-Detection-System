import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
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
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
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
              'Welcome to Koily, the mobile application developed by Koily. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use the Koily mobile application ("App"). We are committed to protecting your privacy and complying with the Sri Lankan Personal Data Protection Act (PDPA) and other relevant international data protection regulations.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            // Add the rest of the Privacy Policy content here
            Text(
              '1. Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Personal Data:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '• Name\n'
              '• Email address\n'
              '• Phone number\n'
              '• Other contact information when you register for an account or contact us for support\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Usage Data:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '• IP address\n'
              '• Browser type and version\n'
              '• Pages of our App visited\n'
              '• Time and date of your visit\n'
              '• Unique device identifiers\n'
              '• Other diagnostic data\n',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Image Data:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '• Images of koi fish uploaded or captured through the App\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '2. How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            // Add the rest of the Privacy Policy content here
            Text(
              'We use the information we collect in the following ways:\n'
              '• To provide and maintain our App\n'
              '• To improve, personalize, and expand our App\n'
              '• To understand and analyze how you use our App\n'
              '• To develop new products, services, features, and functionality\n'
              '• To communicate with you for customer service, updates, and marketing\n'
              '• To process transactions and manage orders\n'
              '• To find and prevent fraud\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            // Continue adding more sections as needed
             Text(
              '3. Sharing Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may share your information with:\n'
              '• Third-Party Service Providers: To help us provide and improve the App, perform services on our behalf, such as data analysis, payment processing, and IT services\n'
              '• Legal Obligations: To comply with laws or respond to legal processes\n'
              '• Business Transfers: If we are involved in a merger, acquisition, or asset sale, your information may be transferred. We will notify you before your information is transferred and becomes subject to a different privacy policy\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '4. Data Security',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We use administrative, technical, and physical security measures to help protect your personal information. While we strive to protect your personal data, we cannot guarantee its absolute security.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '5. Your Data Protection Rights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Depending on your jurisdiction, you may have the following rights:\n'
              '• Access: Request access to the personal data we hold about you\n'
              '• Correction: Request correction of inaccurate or incomplete data\n'
              '• Deletion: Request deletion of your personal data\n'
              '• Objection: Object to the processing of your personal data\n'
              '• Data Portability: Request your personal data in a structured, commonly used, and machine-readable format\n'
              'To exercise these rights, please contact us at [Your Email Address].\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '6. Cookies and Tracking Technologies',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We use cookies and similar tracking technologies to track activity on our App and hold certain information. Cookies are small files that may include an anonymous unique identifier. You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our App.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '7. Third-Party Links',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our App may contain links to third-party websites. We are not responsible for the privacy practices or the content of these third-party websites. We encourage you to review the privacy policies of any third-party sites or services you visit.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '8. Changes to This Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '9. Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about this Privacy Policy, please contact us at:\n'
              '• Email: koily2024072@gmail.com\n'
              'By using Koily, you agree to the collection and use of information in accordance with this Privacy Policy.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '10. Legal Basis for Processing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Under the Sri Lankan Personal Data Protection Act (PDPA) and applicable international data protection laws, we rely on the following legal bases to process your personal data:\n'
              '• Consent: You have given your consent for processing your personal data for one or more specific purposes\n'
              '• Contract: Processing is necessary for the performance of a contract to which you are a party or to take steps at your request before entering into such a contract\n'
              '• Legal Obligation: Processing is necessary for compliance with a legal obligation to which we are subject\n'
              '• Legitimate Interests: Processing is necessary for the purposes of our legitimate interests, except where such interests are overridden by your fundamental rights and freedoms\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '11. Children\'s Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our App is not intended for use by children under the age of 13. If we become aware that we have collected personal data from children without parental consent, we will take steps to delete that information. If you become aware that a child has provided us with personal data, please contact us immediately.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '12. International Data Transfers',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
             SizedBox(height: 8),
            Text(
              'We may transfer your personal data to countries other than the country in which you are resident. These countries may have data protection laws that are different from the laws of your country. We will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '13. Data Retention',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We will retain your personal data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use your personal data to the extent necessary to comply with our legal obligations, resolve disputes, and enforce our legal agreements and policies.\n',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            Text(
              '14. Data Protection Officer (DPO)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We have appointed a Data Protection Officer to oversee compliance with this Privacy Policy. If you have any questions about this Privacy Policy or how we handle your personal data, please contact our Data Protection Officer at koily2024072@gmail.com\n',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
