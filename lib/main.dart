import 'package:flutter/material.dart';
import 'package:technewz/pages/home.dart';
import 'package:technewz/utils/colors.dart';

void main() => runApp( new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark, primaryColor: AppColors.primary),
      home: const Home(),
    );
  }
}