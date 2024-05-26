import 'package:flutter/material.dart';

class EnterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
              },
              child: Image.asset(
                'assets/logo3.png', // Replace with your enter button image
                width: 350, // Adjust image width as needed
                height: 350, // Adjust image height as needed
              ),
            ),
            SizedBox(height: 100), // Increased margin top for the button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login'); // Navigate to login page
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set button background color to black
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // Button padding
                child: Text(
                  'Let\'s Begin',
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
    );
  }
}
