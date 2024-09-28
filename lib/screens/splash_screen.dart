// Suggested code may be subject to a license. Learn more: ~LicenseLog:172989189.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1548985530.
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/utils/app_routes.dart';

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3750497555.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1496639413.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  dispose() {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2589187684.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1264870656.
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    Timer(const Duration(seconds: 4),
        () => Get.offNamed(RouteHelper.getLanguageRoute())
      );
  }

  @override
  Widget build(BuildContext context) {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:
    return Scaffold(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:
      key: _globalKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset("img/logo1.png", width: 200))),
          Center(child: Image.asset("img/logo2.png", width: 200)),
        ],
      ),
    );
  }
}
  

  

