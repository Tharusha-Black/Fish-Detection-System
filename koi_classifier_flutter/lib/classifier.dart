import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:koi_classifier_flutter/result_page.dart'; // Import ResultPage widget from result_page.dart

class Classifier {
  static Future classifyImage(BuildContext context, File image) async {
    final uri = Uri.parse('http://192.168.8.148:5000/classify'); // Replace with your Flask backend URL
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', image.path));

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final resultClass = data['class'];
      final resultProbability = data['probability'];
      // Continue with the rest of your code

      // Navigate to the result page with classification results
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            resultClass: resultClass,
            resultProbability: resultProbability,
          ),
        ),
      );
    } else {
      // Show an error message if classification fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to classify image')),
      );
    }
  }
}
