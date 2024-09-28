import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:app/Login%20Signup/Screen/home_screen.dart';
//import 'package:app/Phone%20Auth/phone_login.dart';
import 'package:app/controllers/language_controller.dart';
import 'package:app/screens/language_widget.dart';
import 'package:app/screens/login_screen.dart';


import '../Login Signup/Screen/home_screen.dart';
import '../Login Signup/Screen/login.dart';
//import 'package:app/screens/login_screen.dart'; // Import the login screen

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<LocalizationController>(
          builder: (localizationController) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(5),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset("img/logo1.png", width: 120),
                                ),
                                const SizedBox(height: 5),
                                Center(
                                  child: Image.asset("img/logo2.png", width: 140),
                                ),
                                const SizedBox(height: 30),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'select_language'.tr,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: localizationController.languages.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => LanguageWidget(
                                    languageModel: localizationController.languages[index],
                                    localizationController: localizationController,
                                    index: index,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text('you_can_change_language'.tr),
                                const SizedBox(height: 20), // Add some space before the button
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all<Color>(Color.fromARGB(255, 10, 101, 104)),
                                    padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Color.fromARGB(255, 145, 250, 104)),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Get.to(() => LoginScreen());
                                    Get.to(() => LoginScreen());
                                    // Navigate to the login screen
                                  },
                                  child: Text(
                                    'Next'.tr,
                                    style: TextStyle(fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 20), // Add some space after the button
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
