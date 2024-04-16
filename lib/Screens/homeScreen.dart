import 'package:cattlefarming/Screens/addCattleScreen.dart';
import 'package:cattlefarming/Screens/addMilkScreen.dart';
import 'package:cattlefarming/Screens/consumeFodderScreen.dart';
import 'package:cattlefarming/Screens/events.dart';
import 'package:cattlefarming/Screens/farmNameScreen.dart';
import 'package:cattlefarming/Screens/farmSetup.dart';
import 'package:cattlefarming/Screens/fodderStockScreen.dart';
import 'package:cattlefarming/Screens/incomeScreen.dart';
import 'package:cattlefarming/Screens/temperatureScreen.dart';
import 'package:cattlefarming/Screens/transactionScreen.dart';
import 'package:cattlefarming/Screens/vaccineCourse.dart';
import 'package:cattlefarming/Screens/viewTemperatureScreen.dart';
import 'package:cattlefarming/Screens/weightScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          title: Text(
            "Cattle Management",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                // Add your onPressed callback here
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                //  padding : const EdgeInsets.fromLTRB(10.0, 16.0, 16.0, 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF02B7C8),
                ),
                child: Center(
                    child: Text(
                  'Cattle Management',
                  style: TextStyle(
                    fontFamily: 'Jomolhari',
                    fontSize: 25,
                    color: Colors.white,
                  ),
                )),
              ),
              ListTile(
                title: const Text('Farm Account'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(
                  "assets/images/pkr.png",
                  width: 25,
                ),
                title: const Text('Transaction Report'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Milk Report'),
                leading: Image.asset(
                  "assets/images/milk-bottle.png",
                  width: 25,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Weight Report'),
                leading: const Icon(
                  Icons.monitor_weight,
                  color: const Color(0xFF443E3E),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => WeightScreen()));
                },
              ),
              ListTile(
                title: const Text('Temperature Report'),
                leading: Image.asset(
                  "assets/images/temperature.png",
                  width: 25,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewTemperatureScreen()));
                },
              ),
              ListTile(
                title: const Text('Food Stock'),
                leading: Image.asset(
                  "assets/images/foodicon.png",
                  width: 25,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FodderStockScreen()));
                },
              ),
              ListTile(
                title: const Text('Food Consume Report'),
                leading: Image.asset(
                  "assets/images/foodicon.png",
                  width: 25,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => consumeFodderScreen()));
                },
              ),
              ListTile(
                title: const Text('Other Farm'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('View Other Farm'),
                leading: const Icon(
                  Icons.remove_red_eye,
                  color: const Color(0xFF443E3E),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          padding: const EdgeInsets.all(40.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddCattle())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/cattlepic.png",
                        ),
                      ),
                      Text(
                        "Cattle",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10),
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
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddMilkScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/milk.png",
                        ),
                      ),
                      Text(
                        "Milk Record",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10),
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
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EventsScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/event.png",
                        ),
                      ),
                      Text(
                        "Events",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10),
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
                    builder: (context) => TransactionsScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/transaction.png",
                        ),
                      ),
                      Text(
                        "Transactions",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10),
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
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FarmSetupScreen())),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 70,
                        child: Image.asset(
                          "assets/images/farm setup.png",
                        ),
                      ),
                      Text(
                        "Farm Setup",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(blurRadius: 10),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 70,
                      child: Image.asset(
                        "assets/images/reports.png",
                      ),
                    ),
                    Text(
                      "Report",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: 10),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _navBar());
  }

  Widget _navBar() {
    return Container(
      height: 70,
      color: const Color(0xFF02B7C8),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
          child: Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: const Color(0xFF02B7C8),
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle Add to Cart action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: const Color(0xFF02B7C8),
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    // Handle Add to Cart action
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: const Color(0xFF02B7C8),
                    size: 30,
                  ),
                  onPressed: () {
                    // Handle Add to Cart action
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FarmNameScreen()));
                  },
                ),
              ],
            ),
          ))),
    );
  }
}
