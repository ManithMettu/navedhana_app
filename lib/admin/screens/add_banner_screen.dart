import 'package:flutter/material.dart';
import '../widgets/banner_form.dart';

class AddBannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Banner'),
      ),
      body: BannerForm(),
    );
  }
}
