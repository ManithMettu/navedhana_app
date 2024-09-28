import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/controllers/language_controller.dart';
import 'package:app/screens/language_widget.dart';
import '../../Login With Google/google_auth.dart';
import '../Widget/button.dart';
import 'login.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Congratulations\nYou_have_successfully_logged_in',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
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
            // Check if the user is not null before displaying their details
            if (user != null) ...[
              Image.network(user.photoURL ?? 'https://via.placeholder.com/150'),
              Text(user.email ?? 'No Email'),
              Text(user.displayName ?? 'No Display Name'),
            ] else ...[
              const Text('No user is signed in.'),
            ]
          ],
        ),
      ),
    );
  }
}
