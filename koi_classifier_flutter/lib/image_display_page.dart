import 'dart:io';
import 'dart:ui';                                          
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum ImageMode { camera, gallery }

class ImageDisplayPage extends StatefulWidget {
  final ImageMode mode;

  ImageDisplayPage({required this.mode});

  @override
  _ImageDisplayPageState createState() => _ImageDisplayPageState();
}

class _ImageDisplayPageState extends State<ImageDisplayPage> {
  File? _image;
  final picker = ImagePicker();
  String? _class;
  double? _probability;
  String? _description;

  @override
  void initState() {
    super.initState();
    if (widget.mode == ImageMode.camera) {
      _getImageFromCamera();
    } else {
      _getImageFromGallery();
    }
  }

  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _classifyImage() async {
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

      _showPopupCard(context);
    }
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
                Text('Probability: ${(_probability! * 100).toStringAsFixed(2)}%'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Display'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? CircularProgressIndicator() // Placeholder for loading indicator
                : Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            SizedBox(height: 20),
            if (_image != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _getImageFromCamera,
                    child: Text('Retake'),
                  ),
                  ElevatedButton(
                    onPressed: _classifyImage,
                    child: Text('Classify Image'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
