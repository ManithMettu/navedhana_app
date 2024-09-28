import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import for user authentication
import '../../Login Signup/Screen/login.dart';
import '../../Login Signup/Widget/button.dart';
import '../../Login With Google/google_auth.dart';
 // Import your LoginScreen file
import 'package:get/get.dart';

import '../widgets/footer_navigation.dart'; // Import GetX for translations

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account '),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User Details Section
            if (user != null) ...[
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.blueGrey.shade100,
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL ?? 'https://via.placeholder.com/150'),
                      radius: 50,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user.displayName ?? 'No Display Name',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(user.email ?? 'No Email'),
                    const SizedBox(height: 16),
                    MyButtons(
                      onTap: () async {
                        await FirebaseServices().googleSignOut();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      text: "Log Out".tr,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
            // Add any additional widgets or sections here if needed
          ],
        ),
      ),
      bottomNavigationBar: FooterNavigation(),
    );
  }
}
