import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView(
        children: [
          Image.network('https://via.placeholder.com/400x150'),
          Image.network('https://via.placeholder.com/400x150'),
          Image.network('https://via.placeholder.com/400x150'),
        ],
      ),
    );
  }
}
