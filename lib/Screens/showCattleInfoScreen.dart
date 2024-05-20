import 'package:cattlefarming/Models/cattleInfClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CattleInfoScreen extends StatefulWidget {
  final String cTag;

  const CattleInfoScreen({super.key, required this.cTag});

  @override
  State<CattleInfoScreen> createState() => _CattleInfoScreenState();
}

class _CattleInfoScreenState extends State<CattleInfoScreen> {
  // final List<CattleInfoRecord> cattleList = [
  //   CattleInfoRecord(
  //     tag: 'C14F',
  //     weight: '250 KG',
  //     gender: 'Female',
  //     age: '2 Years',
  //     bornDate: '2022-01-14',
  //     cost: "2800000",
  //     purchaseDate: '2023-11-14',
  //     expense: '8000',
  //     vaccine: 'BVD',
  //     vaccineDate: '2024-02-13',
  //   ),
  // ];

  late String tag;
  String weight = '250 KG';
  String gender = 'Female';
  String age = '2 Years';
  String bornDate = '2022-01-14';
  String cost = "2800000";
  String purchaseDate = '2023-11-14';
  // String purchaseDate = 'null';
  String expense = '8000';
  String vaccine = 'BVD';
  String vaccineDate = '2024-02-13';

  @override
  void initState() {
    super.initState();
    tag = widget.cTag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Show Cattle Info",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ), // Menu icon
            itemBuilder: (BuildContext context) => [
              // Menu items

              PopupMenuItem(
                child: Text('Sale'),
                value: 'Sale',
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text('Dead'),
                value: 'Dead',
                onTap: () {},
              ),
            ],
          ),
        ],

        // actions: [
        //   Builder(
        //     builder: (context) => IconButton(
        //       icon: Icon(
        //         Icons.menu,
        //         color: Colors.white,
        //         size: 25,
        //       ),
        //       onPressed: () {
        //         Scaffold.of(context).openEndDrawer();
        //       },
        //     ),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 359,
                    color: Color(0xFF02B7C8),
                  ),
                  Positioned(
                    left: 130,
                    top: 15,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 238, 243, 243),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        border: Border.all(color: const Color(0xFF02B7C8)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 145,
                    child: Image.asset(
                      "assets/images/cow.png",
                      //fit: BoxFit.cover,
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Positioned(
                      bottom: 25,
                      left: 160,
                      child: Text(tag,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 50, right: 50, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Weight:",
                    style: TextStyle(),
                  ),
                  Text(
                    weight,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 50,
                right: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gender:",
                    style: TextStyle(),
                  ),
                  Text(
                    gender,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 50,
                right: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Age:",
                    style: TextStyle(),
                  ),
                  Text(
                    age,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 50,
                right: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DOB:",
                    style: TextStyle(),
                  ),
                  Text(
                    bornDate,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
            if (purchaseDate != 'null') ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Purchase Date:",
                      style: TextStyle(),
                    ),
                    Text(
                      purchaseDate,
                      style: TextStyle(
                        color: const Color(0xFF02B7C8),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cost:",
                      style: TextStyle(),
                    ),
                    Text(
                      cost,
                      style: TextStyle(
                        color: const Color(0xFF02B7C8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expense:",
                    style: TextStyle(),
                  ),
                  Text(
                    expense,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vaccine:",
                    style: TextStyle(),
                  ),
                  Text(
                    vaccine,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vaccine Date:",
                    style: TextStyle(),
                  ),
                  Text(
                    vaccineDate,
                    style: TextStyle(
                      color: const Color(0xFF02B7C8),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
