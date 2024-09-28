import 'package:flutter/material.dart';
import 'add_banner_screen.dart';
import 'add_vegetable_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddBannerScreen(),
                  ),
                );
              },
              child: Text('Add Banner'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddVegetableScreen(),
                  ),
                );
              },
              child: Text('Add Vegetable'),
            ),
          ],
        ),
      ),
    );
  }
}
