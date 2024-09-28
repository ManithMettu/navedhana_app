import 'package:flutter/material.dart';

class LeafVegetableListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Leaf Vegetables'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Spinach'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ),
          ListTile(
            title: Text('Lettuce'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Text('Add to Cart'),
            ),
          ),
          // Add more leaf vegetable items
        ],
      ),
    );
  }
}
