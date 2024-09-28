import 'package:flutter/material.dart';
import 'admin/screens/admin_home_screen.dart';

void main() {
  runApp(MyAdminApp());
}

class MyAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminHomeScreen(),
    );
  }
}
