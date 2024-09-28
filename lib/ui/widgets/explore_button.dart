import 'package:flutter/material.dart';

class ExploreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  ExploreButton({required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text('Explore'),
    );
  }
}
