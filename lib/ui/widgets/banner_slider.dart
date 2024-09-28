import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        'assets/images/banner1.jpg',
        'assets/images/banner2.jpg',
        'assets/images/banner3.jpg'
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(imagePath, fit: BoxFit.cover, width: 1000);
          },
        );
      }).toList(),
    );
  }
}
