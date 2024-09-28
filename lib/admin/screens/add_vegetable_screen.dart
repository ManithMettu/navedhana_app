import 'package:flutter/material.dart';
import '../widgets/vegetable_form.dart';

class AddVegetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vegetable'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: VegetableForm(),
      ),
    );
  }
}
