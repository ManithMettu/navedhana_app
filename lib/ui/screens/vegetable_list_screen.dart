import 'package:flutter/material.dart';

class VegetableListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Vegetables'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Tomato'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ),
          ListTile(
            title: Text('Cucumber'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ),
          // Add more vegetable items
        ],
      ),
    );
  }
}
