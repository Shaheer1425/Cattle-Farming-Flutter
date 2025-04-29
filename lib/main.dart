import 'package:cattlefarming/Screens/addmilknewscreen.dart';
import 'package:cattlefarming/Screens/adminDashbordScreen.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/milkInventoryDetails.dart';

import 'package:cattlefarming/Screens/signInScreen.dart';
import 'package:cattlefarming/Screens/splashScreen.dart';
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
      title: 'Smart Cattle Management System',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              color: Color.fromARGB(
                  255, 100, 99, 99)), // Adjust the color as needed
        ),
        fontFamily: 'Jomolhari',
        colorScheme: ColorScheme.light(
          primary: Color.fromARGB(255, 15, 172, 1), // or any color you want
        ),
        //colorscheme
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 7, 180, 1), // or any color you want
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // or any color you want
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

  // BoxDecoration(
  //                       color: Color.fromARGB(255, 238, 243, 243),
  //                       // borderRadius: BorderRadius.all(Radius.circular(85)),
  //                       border: Border.all(color: const Color(0xFF02B7C8)),
  //                       boxShadow: [
  //                         BoxShadow(
  //                           color: const Color(
  //                               0xFF02B7C8), // Shadow color and opacity
  //                           spreadRadius: 1, // Shadow spread radius
  //                           blurRadius: 5, // Shadow blur radius
  //                           offset: Offset(0, 0), // Shadow offset
  //                         ),
  //                       ],
  //                     );