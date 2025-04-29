import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/farmClass.dart';
import 'package:cattlefarming/Models/global.dart';
import 'package:cattlefarming/Screens/addFarmScreen.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminDashbordScreen extends StatefulWidget {
  const AdminDashbordScreen({super.key});

  @override
  State<AdminDashbordScreen> createState() => _AdminDashbordScreenState();
}

class _AdminDashbordScreenState extends State<AdminDashbordScreen> {
  ApiHandler apiHandler = ApiHandler();
  List<FarmRecord> records = [];
  String adminName = 'Shaheer';

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchFarms();
    });
    // fetchFarms();
  }

  Future<void> fetchFarms() async {
    records = await apiHandler.getAlladminFarm();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Farm",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 70),
              child: Text(
                'Hello, $adminName',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40.0, top: 30, bottom: 20),
              child: Text(
                'Make Smart Cattle Farming smart with your knowledge!',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, top: 20),
              child: Text(
                'All Farms',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: records.length + 1,
                itemBuilder: (context, index) {
                  if (index < records.length) {
                    final record = records[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: InkWell(
                        onTap: () {
                          int selectedFarmId = records[index]
                              .id; // Get selected farm ID from your list
                          FarmManager.setSelectedFarmId(selectedFarmId);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xFF039BA8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    record.name,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      record.city,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddFarmScreen()));
                        },
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            color: Color(0xFF039BA8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 70,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/farmClass.dart';
// import 'package:cattlefarming/Screens/addFarmScreen.dart';
// import 'package:cattlefarming/Screens/homeScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class AdminDashbordScreen extends StatefulWidget {
//   const AdminDashbordScreen({super.key});

//   @override
//   State<AdminDashbordScreen> createState() => _AdminDashbordScreenState();
// }

// class _AdminDashbordScreenState extends State<AdminDashbordScreen> {
//   ApiHandler apiHandler = ApiHandler();
//   List<FarmRecord> records = [];
//   String adminName = 'Mazhar';
//   @override
//   void initState() {
//     super.initState();
//     // datecon.text = DateTime.now().toString().split(' ')[0]; // Set default date
//     fetchFarms(); // Fetch weights initially
//   }

//   Future<void> fetchFarms() async {
//     records = await apiHandler.getAlladminFarm();

//     setState(() {}); // Update the UI after fetching weights
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Farms",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 45, top: 70),
//             child: Text(
//               'Hello, $adminName',
//               style: TextStyle(
//                 fontSize: 15,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 40, right: 40.0, top: 30, bottom: 20),
//             child: Text(
//               'Make Cattle Farming smart with your knowledge!',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 50.0, top: 20),
//             child: Text(
//               'All Farms',
//               style: TextStyle(
//                 fontSize: 40,
//               ),
//             ),
//           ),
//           ListView.builder(
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             //   physics: NeverScrollableScrollPhysics(),
//             itemCount: records.length,
//             itemBuilder: (context, index) {
//               final record = records[index];
//               return Padding(
//                 padding: const EdgeInsets.only(left: 40.0, top: 10),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => HomeScreen()));
//                   },
//                   child: Container(
//                     width: 200,
//                     height: 200,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 30.0, top: 50, right: 30),
//                           child: Text(
//                             record.name,
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 30.0, top: 30, right: 30),
//                           child: Row(
//                             children: [
//                               Icon(Icons.location_on),
//                               Text(
//                                 record.city,
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(blurRadius: 3),
//                       ],
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       color: Color(0xFF039BA8),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => AddFarmScreen()));
//                     },
//                     child: Container(
//                       width: 200,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(blurRadius: 3),
//                         ],
//                         borderRadius: BorderRadius.all(Radius.circular(30)),
//                         color: Color(0xFF039BA8),
//                       ),
//                       child: Center(
//                           child: Icon(
//                         Icons.add,
//                         size: 70,
//                       )),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
// //   List farms = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchFarms();
// //   }

// //   fetchFarms() async {
// //     var url = 'http://example.com/api/farms'; // replace with your API url
// //     var response = await http.get(url);
// //     var farms = jsonDecode(response.body);
// //     setState(() {
// //       this.farms = farms;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Admin Dashboard'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: farms.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text(farms[index]['name']), // replace 'name' with the actual property name
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => FarmDetailsScreen()),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }