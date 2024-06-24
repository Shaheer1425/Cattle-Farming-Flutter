import 'package:cattlefarming/Screens/consumeFodderScreen.dart';
import 'package:cattlefarming/Screens/fodderStockScreen.dart';
import 'package:cattlefarming/Screens/milkInventoryDetails.dart';
import 'package:cattlefarming/Screens/vaccineCourse.dart';
import 'package:cattlefarming/Screens/viewRemainingFodderScreen.dart';
import 'package:cattlefarming/Screens/viewMilkRecord.dart';
import 'package:cattlefarming/Screens/viewTemperatureScreen.dart';
import 'package:cattlefarming/Screens/viewWaightScreen.dart';
import 'package:flutter/material.dart';

class FodderScreen extends StatelessWidget {
  const FodderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Fodder",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, bottom: 10, top: 35),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => consumeFodderScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/cattlefodder.png",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Consume Fodder",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 3),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewFodderStockScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/Shoping Card rack.png",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Remaining Fodder",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 3),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
