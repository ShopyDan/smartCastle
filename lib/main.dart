import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/country_screen.dart';
import 'package:flutter_application_1/menu_cboku.dart';
import 'package:flutter_application_1/shop_app/login.dart';
import 'package:flutter_application_1/shop_app/register.dart';
import 'package:flutter_application_1/users.dart';
import 'package:flutter_application_1/with_bar_menu.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDxgxcyHAOxpDx_LyqCr42489KOEuuAIlk', 
      appId: 'com.example.flutter_application_1', 
      messagingSenderId: 'sendid', 
      projectId: 'myfirstproject-ca160',
      storageBucket: "myfirstproject-ca160.appspot.com",
      ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: menu_sboku(),
        );
  }
}
