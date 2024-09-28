import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import for user authentication
import 'package:get/get.dart';
import '../../Login Signup/Screen/login.dart';
import '../../Login Signup/Widget/button.dart';
import '../../Login With Google/google_auth.dart';
import '../widgets/banner_slider.dart';
import '../widgets/footer_navigation.dart';
import '../widgets/header_bar.dart';
import '../widgets/vegetable_card.dart';
 // Import your LoginScreen file

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: HeaderBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerSlider(),
            // In Stock Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('In Stock', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation or other logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 201, 198, 195), // Button background color
                    ),
                    child: Text(
                      'Explore',
                      style: TextStyle(color: Colors.black), // Button text color
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  VegetableCard('assets/images/vege.jpg', 'Tomato', 100, 75),
                  VegetableCard('assets/images/vege.jpg', 'Cucumber', 60, 50),
                  VegetableCard('assets/images/vege.jpg', 'Bringle', 100, 75),
                  VegetableCard('assets/images/vege.jpg', 'Cabbage', 60, 50),
                  // Add more cards here
                ],
              ),
            ),
            // All Vegetables Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All Vegetables', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to all vegetables screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 201, 198, 195), // Button background color
                    ),
                    child: Text(
                      'Explore',
                      style: TextStyle(color: Colors.black), // Button text color
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  VegetableCard('assets/images/vege.jpg', 'Tomato', 100, 75),
                  VegetableCard('assets/images/vege.jpg', 'Cucumber', 60, 50),
                  VegetableCard('assets/images/vege.jpg', 'Tomato', 100, 75),
                  VegetableCard('assets/images/vege.jpg', 'Cucumber', 60, 50),
                  // Add more cards here
                ],
              ),
            ),
            // All Leafy Vegetables Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All Leafy Vegetables', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to all leaf vegetables screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 201, 198, 195), // Button background color
                    ),
                    child: Text(
                      'Explore',
                      style: TextStyle(color: Colors.black), // Button text color
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  VegetableCard('assets/images/leaf_vege.jpg', 'Spinach', 60, 50),
                  VegetableCard('assets/images/leaf_vege.jpg', 'Lettuce', 55, 45),
                  VegetableCard('assets/images/leaf_vege.jpg', 'Spinach', 60, 50),
                  VegetableCard('assets/images/leaf_vege.jpg', 'Lettuce', 55, 45),
                  // Add more cards here
                ],
              ),
            ),
            // Recently Viewed Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Recently Viewed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 180.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  VegetableCard('assets/images/vege.jpg', 'Tomato', 100, 75),
                  VegetableCard('assets/images/leaf_vege.jpg', 'Spinach', 60, 50),
                  VegetableCard('assets/images/vege.jpg', 'Tomato', 100, 75),
                  VegetableCard('assets/images/leaf_vege.jpg', 'Spinach', 60, 50),
                  // Add more cards here
                ],
              ),
            ),
            // User Details Section

          ],
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}
