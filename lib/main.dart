
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:myapp/Phone%20Auth/phone_login.dart';
import 'package:app/controllers/language_controller.dart';
import 'Phone Auth/otp_screen.dart';
import 'Phone Auth/phone_login.dart';
import 'utils/dep.dart' as dep;
import 'package:app/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:app/utils/app_constants.dart';
import 'package:app/utils/app_routes.dart';
import 'package:app/utils/messages.dart';
import 'controllers/language_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Map<String, Map<String, String>> languages = await dep.init();
  //runApp(MyApp(languages: languages, RouteHelper: RouteHelper(),));
  runApp(const MyApp());
}
/*
class MyApp extends StatelessWidget {
  MyApp({required this.languages, required RouteHelper});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            locale: localizationController.locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode,
                AppConstants.languages[0].countryCode),
            initialRoute: RouteHelper.getSplashRoute(),
            getPages: RouteHelper.routes,
          );
        });
  }
}

*/


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: OTPScreen(verificationId: '252525',),
      home:PhoneAuthentication(),
    );
  }
}


/*
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'app/screens/home_screen.dart';
import 'admin/screens/admin_home_screen.dart';
import 'firebase_options.dart';

void main() {
  if (kIsWeb) {
    runApp(AdminApp());
  } else {
    Future<void> main() async {
      WidgetsFlutterBinding.ensureInitialized();
      //await Firebase.initializeApp();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      //Map<String, Map<String, String>> languages = await dep.init();
      runApp(MyApp());
      //runApp(const MyApp());
    }

    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(), // The main screen for mobile app users
    );
  }
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdminHomeScreen(), // The main screen for web admin users
    );
  }
}
*/