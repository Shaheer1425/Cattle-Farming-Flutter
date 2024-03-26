import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/signInScreen.dart';
import 'package:cattlefarming/Screens/signupScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xFF02B7C8), // or any color you want
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF02B7C8), // or any color you want
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // or any color you want
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
