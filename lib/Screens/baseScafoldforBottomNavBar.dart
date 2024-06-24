import 'package:cattlefarming/Screens/adminDashbordScreen.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/milkInventoryDetails.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;

  const BaseScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: _navBar(context),
    );
  }

  Widget _navBar(BuildContext context) {
    return Container(
      height: 70,
      color: const Color(0xFF039BA8),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Color(0xFF02B7C8),
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MilkInventoryDetailsScreen()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.home,
                  color: Color(0xFF02B7C8),
                  size: 35,
                ),
                onPressed: () {
                  // Handle Add to Cart action
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Color(0xFF02B7C8),
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AdminDashbordScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
