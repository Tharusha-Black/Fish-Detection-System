import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileImagePicker extends StatefulWidget {
  final Function(String) onImagePicked;

  ProfileImagePicker({required this.onImagePicked});

  @override
  _ProfileImagePickerState createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
      widget.onImagePicked(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_imageFile != null)
          Image.file(_imageFile!, width: 100, height: 100)
        else
          Icon(Icons.person, size: 100),
        ElevatedButton(
          onPressed: _pickImage,
          child: Text('Pick Profile Image'),
        ),
      ],
    );
  }
}
