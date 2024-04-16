import 'package:cattlefarming/Screens/vaccineCourse.dart';
import 'package:cattlefarming/Screens/viewTemperatureScreen.dart';
import 'package:cattlefarming/Screens/viewWaightScreen.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Events",
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
                    builder: (context) => ViewTemperatureScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/temperature.png",
                        ),
                      ),
                      Text(
                        "Temperature",
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
                    builder: (context) => ViewWeightScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/weighticon.png",
                        ),
                      ),
                      Text(
                        "Weight",
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
                    builder: (context) => VaccineCourseScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/vaccineicon2.png",
                        ),
                      ),
                      Text(
                        "Vaccination",
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
