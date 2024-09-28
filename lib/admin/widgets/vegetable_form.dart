import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/firebase_service.dart';

class VegetableForm extends StatefulWidget {
  @override
  _VegetableFormState createState() => _VegetableFormState();
}

class _VegetableFormState extends State<VegetableForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _imageUrl = '';
  double _actualPrice = 0;
  double _sellPrice = 0;
  File? _imageFile;
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _saveForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_imageFile != null) {
        try {
          // Upload the image and get the URL
          _imageUrl = await _firebaseService.uploadImage(_imageFile!.path, _name);

          // Save the vegetable data
          await _firebaseService.saveVegetable(
            name: _name,
            imageUrl: _imageUrl,
            actualPrice: _actualPrice,
            sellPrice: _sellPrice,
          );

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully added vegetable!'),
          ));

          Navigator.of(context).pop(); // Close the form
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to add vegetable: $e'),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Please select an image'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (value) {
              _name = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a name';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          TextButton.icon(
            icon: Icon(Icons.image),
            label: Text('Select Image'),
            onPressed: _pickImage,
          ),
          if (_imageFile != null) Image.file(_imageFile!),
          TextFormField(
            decoration: InputDecoration(labelText: 'Actual Price'),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              _actualPrice = double.parse(value!);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an actual price';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Sell Price'),
            keyboardType: TextInputType.number,
            onSaved: (value) {
              _sellPrice = double.parse(value!);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a sell price';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _saveForm,
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
