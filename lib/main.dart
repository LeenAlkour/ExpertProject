
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project1/IndexExpert.dart';

import 'package:project1/Local_login.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project1/category_.dart';
import 'package:project1/expert.dart';
import 'package:project1/expert_list.dart';
import 'package:project1/favoriteScreen.dart';
import 'package:project1/profile.dart';
import 'package:project1/register_screen.dart';
import 'package:project1/search_.dart';
import 'package:project1/shwo_expert_from_.dart';
import 'package:project1/splash.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:project1/applocal.dart';


dynamic token;
void main() async
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      localizationsDelegates:  [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("ar", ""),
      ],

      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale locale in supportLang) {
            if (locale.languageCode == currentLang.languageCode) {
              // mySharedPreferences.setString("lang",currentLang.languageCode) ;
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
      routes:
        {
          "search_":(context)=>search_(token:token),
          "expert":(context)=> expert_list(token: token,),
          "Local_login":(context)=> const Local_login(),
           "category_":(context)=> category_(token: token,),
           "expert":(context)=> expert(token: token,),
           "Register_Screen":(context)=> Register_Screen(),
          "IndwxExpert":(context)=> IndwxExpert(token: token,),
          "favoriteScreen":(context)=> favoriteScreen(token: token,),
          "shwo_expert_from_":(context) => shwo_expert_from_(token: token,),

        },


    );
  }
}