import 'package:flutter/material.dart';

class BannerForm extends StatelessWidget {
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _imageUrlController,
            decoration: InputDecoration(labelText: 'Image URL'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Save banner to Firebase
            },
            child: Text('Add Banner'),
          ),
        ],
      ),
    );
  }
}
