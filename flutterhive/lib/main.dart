import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterhive/Screens/HomeScreen.dart';
import 'package:flutterhive/Screens/LoginScreen.dart';
import 'package:flutterhive/Screens/SignupScreen.dart';
import 'package:flutterhive/Screens/SplashScreen.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>("friends");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
