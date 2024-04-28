import 'package:cattlefarming/Screens/addFarmScreen.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminDashbordScreen extends StatefulWidget {
  const AdminDashbordScreen({super.key});

  @override
  State<AdminDashbordScreen> createState() => _AdminDashbordScreenState();
}

class _AdminDashbordScreenState extends State<AdminDashbordScreen> {
  String adminName = 'Mazhar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Farms",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 45, top: 70),
            child: Text(
              'Hello $adminName',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 40, right: 40.0, top: 30, bottom: 20),
            child: Text(
              'Make Cattle Farming smart with your knowledge!',
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, top: 50, right: 30),
                            child: Text(
                              "Happy Hooves Ranch",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, top: 30, right: 30),
                            child: Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                  'Rawalpindi',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 3),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xFF039BA8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddFarmScreen()));
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 3),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color(0xFF039BA8),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.add,
                        size: 70,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
//   List farms = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchFarms();
//   }

//   fetchFarms() async {
//     var url = 'http://example.com/api/farms'; // replace with your API url
//     var response = await http.get(url);
//     var farms = jsonDecode(response.body);
//     setState(() {
//       this.farms = farms;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Dashboard'),
//       ),
//       body: ListView.builder(
//         itemCount: farms.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(farms[index]['name']), // replace 'name' with the actual property name
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => FarmDetailsScreen()),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }