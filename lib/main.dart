import 'package:cattlefarming/Screens/consumeFodderScreen.dart';
import 'package:cattlefarming/Screens/events.dart';
import 'package:cattlefarming/Screens/expenseScreen.dart';
import 'package:cattlefarming/Screens/farmNameScreen.dart';
import 'package:cattlefarming/Screens/farmSetup.dart';
import 'package:cattlefarming/Screens/fodderStockScreen.dart';
import 'package:cattlefarming/Screens/incomeScreen.dart';
import 'package:cattlefarming/Screens/addCattleScreen.dart';
import 'package:cattlefarming/Screens/addMilkScreen.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/signInScreen.dart';
import 'package:cattlefarming/Screens/signupScreen.dart';
import 'package:cattlefarming/Screens/splashScreen.dart';
import 'package:cattlefarming/Screens/temperatureScreen.dart';
import 'package:cattlefarming/Screens/transactionScreen.dart';
import 'package:cattlefarming/Screens/vaccineCourse.dart';
import 'package:cattlefarming/Screens/vaccineInjectScreen.dart';
import 'package:cattlefarming/Screens/viewTemperatureScreen.dart';
import 'package:cattlefarming/Screens/viewWaightScreen.dart';
import 'package:cattlefarming/Screens/weightScreen.dart';
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
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              color: Color.fromARGB(
                  255, 100, 99, 99)), // Adjust the color as needed
        ),
        fontFamily: 'Jomolhari',
        colorScheme: ColorScheme.light(
          primary: Color(0xFF039BA8), // or any color you want
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF039BA8), // or any color you want
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // or any color you want
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
