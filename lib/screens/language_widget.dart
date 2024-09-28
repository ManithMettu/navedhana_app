import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controllers/language_controller.dart';
import '../utils/app_constants.dart';
import 'language_model.dart';


class LanguageWidget extends StatelessWidget{
  final LanguageModel languageModel;
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1574478394.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4057325567.
  final LocalizationController localizationController;
  final int index;

// Suggested code may be subject to a license. Learn more: ~LicenseLog:3528749758.
  LanguageWidget({
    required this.languageModel,
    required this.localizationController,
    required this.index,
  });

  @override
  Widget build(BuildContext context){
    return InkWell(
        onTap: (){
          localizationController.setLanguage(Locale(
            AppConstants.languages[index].languageCode,
            AppConstants.languages[index].countryCode,
          ));
          localizationController.setSelectIndex(index);


        },
        child:Container(
          padding: EdgeInsets.all(10),
          margin:EdgeInsets.all(5),
          decoration: BoxDecoration(
            color:Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
                color:Colors.grey[200]!,
                blurRadius:5,spreadRadius:1
            )],
          ),
          child:Stack(children:
          [
            Center(
              child:Column(mainAxisSize:MainAxisSize.min,children:[
                SizedBox(height:5),
                Text(languageModel.languageName,),
              ]),
            ),
            localizationController.selectedIndex == index ? Positioned(
              top:0, right:0,left: 0,bottom:40,
              child:Icon(Icons.check_circle,color:Theme.of(context).primaryColor,size:25),
            ):SizedBox(),
          ]),
        )
    );
  }
}