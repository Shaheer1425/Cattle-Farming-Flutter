/*import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MilkInventoryDetailsScreen extends StatefulWidget {
  const MilkInventoryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MilkInventoryDetailsScreen> createState() =>
      _MilkInventoryDetailsScreenState();
}

class _MilkInventoryDetailsScreenState
    extends State<MilkInventoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Milk Inventory Details",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 243, 243),
                      borderRadius: BorderRadius.all(Radius.circular(85)),
                      border: Border.all(color: const Color(0xFF02B7C8)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                              0xFF02B7C8), // Shadow color and opacity
                          spreadRadius: 1, // Shadow spread radius
                          blurRadius: 5, // Shadow blur radius
                          offset: Offset(0, 0), // Shadow offset
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      //bottom: 15,
                      top: 17,
                      left: 64,
                      child: Text(
                        "29",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      //bottom: 15,
                      top: 55,
                      left: 40,
                      child: Text("Liter Remaining")),
                  Positioned(
                    bottom: 15,
                    left: 50,
                    child: Image.asset(
                      "assets/images/milk.png",
                      //fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              padding: const EdgeInsets.all(5.0),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5, bottom: 15),
                  //  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () {
                    
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 70,
                            child: Image.asset(
                              "assets/images/goat.png",
                            ),
                          ),
                          Text(
                            "Goat",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 15),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 70,
                            child: Image.asset(
                              "assets/images/cow.png",
                            ),
                          ),
                          Text(
                            "Cow",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5, bottom: 15),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 70,
                            child: Image.asset(
                              "assets/images/buffalo.png",
                            ),
                          ),
                          Text(
                            "Buffalo",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 15),
                  child: InkWell(
                    onTap: () {},
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
                          Text(
                            "Total Stock",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 5),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MilkInventoryDetailsScreen extends StatefulWidget {
  const MilkInventoryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MilkInventoryDetailsScreen> createState() =>
      _MilkInventoryDetailsScreenState();
}

class _MilkInventoryDetailsScreenState
    extends State<MilkInventoryDetailsScreen> {
  int selectedIndex = -1;
  int? remainigMilk = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Milk Stock",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 243, 243),
                      borderRadius: BorderRadius.all(Radius.circular(85)),
                      border: Border.all(color: const Color(0xFF02B7C8)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                              0xFF02B7C8), // Shadow color and opacity
                          spreadRadius: 1, // Shadow spread radius
                          blurRadius: 5, // Shadow blur radius
                          offset: Offset(0, 0), // Shadow offset
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    //bottom: 15,
                    top: 17,
                    left: 68,
                    child: Text(
                      "$remainigMilk",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    //bottom: 15,
                    top: 55,
                    left: 40,
                    child: Text("Liter Remaining"),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 50,
                    child: Image.asset(
                      "assets/images/milk.png",
                      //fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              padding: const EdgeInsets.all(5.0),
              children: [
                buildGridItem(0, "Goat", "assets/images/goat.png", 30),
                buildGridItem(1, "Cow", "assets/images/cow.png", 50),
                buildGridItem(2, "Buffalo", "assets/images/buffalo.png", 80),
                buildGridItem(3, "Total Stock",
                    "assets/images/Shoping Card rack.png", 160),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(
      int index, String title, String imagePath, int remainMilk) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
            remainigMilk = remainMilk;
          });
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 70,
                child: Image.asset(
                  imagePath,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color:
                      selectedIndex == index ? Color(0xFF02B7C8) : Colors.black,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xFF02B7C8)
                  : Colors.transparent,
              width: 2, // Change border width when selected
            ),
            boxShadow: [
              BoxShadow(blurRadius: 5),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
