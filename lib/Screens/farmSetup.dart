import 'package:cattlefarming/Screens/vaccineCourse.dart';
import 'package:cattlefarming/Screens/viewTemperatureScreen.dart';
import 'package:cattlefarming/Screens/viewWaightScreen.dart';
import 'package:flutter/material.dart';

class FarmSetupScreen extends StatelessWidget {
  const FarmSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Category Explorer",
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text('Income Categories')),
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Milk Sale'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Cattle Sale'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/pkr1.png",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Income Categories",
                          style: TextStyle(fontSize: 18),
                        ),
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text('Expense Categories')),
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Fodder'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Vaccination'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/pkr1.png",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          "Expense Categories",
                          style: TextStyle(fontSize: 18),
                        ),
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text('Cattle Breed')),
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.42,
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Sahiwali'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Red Sindhi'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Cholistani'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Nili-Ravi'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Dajal'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/cattlebreed.png",
                        ),
                      ),
                      Text(
                        "Cattle Breed",
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
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(child: Text('Cattle Type')),
                        content: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.26,
                          child: Column(
                            children: [
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Cow'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Buffalo'),
                                ),
                              ),
                              Card(
                                elevation: 5,
                                child: ListTile(
                                  title: Text('Goat'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/cattletype.png",
                        ),
                      ),
                      Text(
                        "Cattle Type",
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
