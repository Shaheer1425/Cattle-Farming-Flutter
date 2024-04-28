import 'package:cattlefarming/Screens/addCustomers.dart';
import 'package:cattlefarming/Screens/adminDashbordScreen.dart';

import 'package:cattlefarming/Screens/consumeFodderScreen.dart';
import 'package:cattlefarming/Screens/events.dart';
import 'package:cattlefarming/Screens/expenseScreen.dart';
import 'package:cattlefarming/Screens/addFarmScreen.dart';
import 'package:cattlefarming/Screens/farmSetup.dart';
import 'package:cattlefarming/Screens/fodderStockScreen.dart';
import 'package:cattlefarming/Screens/incomeScreen.dart';
import 'package:cattlefarming/Screens/addCattleScreen.dart';
import 'package:cattlefarming/Screens/addMilkScreen.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/milkInventoryDetails.dart';
import 'package:cattlefarming/Screens/notificationScreen.dart';
import 'package:cattlefarming/Screens/showCattleInfoScreen.dart';
import 'package:cattlefarming/Screens/signInScreen.dart';
import 'package:cattlefarming/Screens/signupScreen.dart';
import 'package:cattlefarming/Screens/temperatureScreen.dart';
import 'package:cattlefarming/Screens/transactionScreen.dart';
import 'package:cattlefarming/Screens/vaccineCourse.dart';
import 'package:cattlefarming/Screens/vaccineInjectScreen.dart';
import 'package:cattlefarming/Screens/viewCattleScreen.dart';
import 'package:cattlefarming/Screens/viewCustomers.dart';
import 'package:cattlefarming/Screens/viewFodderStockScreen.dart';
import 'package:cattlefarming/Screens/viewMilkRecord.dart';
import 'package:cattlefarming/Screens/viewTemperatureScreen.dart';
import 'package:cattlefarming/Screens/viewWaightScreen.dart';
import 'package:cattlefarming/Screens/weightScreen.dart';
import 'package:flutter/material.dart';
import 'package:cattlefarming/Screens/splashScreen.dart';

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
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF039BA8), // or any color you want
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // or any color you want
        ),
        useMaterial3: true,
      ),
      home: AdminDashbordScreen(),
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