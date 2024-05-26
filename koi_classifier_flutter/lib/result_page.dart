import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String? resultClass;
  final double? resultProbability;

  ResultPage({this.resultClass, this.resultProbability});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classification Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Class: $resultClass',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Probability: ${(resultProbability! * 100).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
