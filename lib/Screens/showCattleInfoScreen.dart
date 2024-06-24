import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/cattleInfClass.dart';
import 'package:cattlefarming/Models/global.dart';
import 'package:cattlefarming/Screens/incomeScreen.dart';
import 'package:flutter/material.dart';

class CattleInfoScreen extends StatefulWidget {
  final String cTag;

  const CattleInfoScreen({super.key, required this.cTag});

  @override
  State<CattleInfoScreen> createState() => _CattleInfoScreenState();
}

class _CattleInfoScreenState extends State<CattleInfoScreen> {
  int farmId = 1;
  late String tag;
  late Future<CattleInfo?> cattleInfoFuture;
  TextEditingController deadCostCon = TextEditingController();
  @override
  void initState() {
    super.initState();
    tag = widget.cTag;
    fetchData();
    //  farmId = FarmManager.getSelectedFarmId();
  }

  Future<void> fetchData() async {
    try {
      cattleInfoFuture = ApiHandler().fetchCattleInfo(tag, farmId);
      setState(() {});

      print('Fetched Cattle info successfully: '); // Debug print
    } catch (e) {
      print('Failed to load data of cattle info: $e');
    }
  }

  void markCattleAsDead(String tag, int farmId, int costOfDead) async {
    Map<String, dynamic> cattleData = {
      'Tag': tag,
      'FarmID': farmId,
      'CostOfDead': costOfDead,
    };

    try {
      String response = await ApiHandler().deadCattle(cattleData);
      print('------------------------------Response: $response');
      // Show success message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cattle marked as dead successfully!')),
      );
    } catch (e) {
      print('Error: $e');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to mark cattle as dead. Error: $e')),
      );
    }
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
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Sale'),
                value: 'Sale',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewIncomeScreen(Stag: tag)));
                },
              ),
              PopupMenuItem(
                child: Text('Dead'),
                value: 'Dead',
                onTap: () {
                  // Show the dialog to input the estimated cost
                  showDialog(
                      context: context,
                      builder: (BuildContext) {
                        return AlertDialog(
                          // title: Text('Enter Estimated Cost'),
                          content: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 8, left: 8),
                                  child: Text(
                                    "Enter Estimated Cost",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                          color: const Color(0xFF02B7C8))),
                                  child: Center(
                                    child: TextFormField(
                                      controller: deadCostCon,
                                      decoration: const InputDecoration(
                                        hintText: 'Rs. 290000',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Text('Cancel')),
                            ElevatedButton(
                                onPressed: () async {
                                  markCattleAsDead(
                                      tag, farmId, int.parse(deadCostCon.text));
                                  setState(() {
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: Text('Save'))
                          ],
                        );
                      });

                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: Text('Enter Estimated Cost'),
                  //       content: DeadCattleDialog(
                  //         tag: tag,
                  //         farmId: farmId,
                  //         onSubmitted: (costOfDead) {
                  //           markCattleAsDead(tag, farmId, costOfDead);
                  //         },
                  //       ),
                  //     );
                  //   },
                  // );
                },
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<CattleInfo?>(
        future: cattleInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          }

          var cattleInfo = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                              border:
                                  Border.all(color: const Color(0xFF02B7C8)),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          left: 145,
                          child: Image.asset(
                            "assets/images/cow.png",
                            width: 90,
                            height: 90,
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          left: 160,
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  _buildInfoRow("Weight:", cattleInfo.weight),
                  _buildInfoRow("Gender:", cattleInfo.gender),
                  _buildInfoRow("Age:", cattleInfo.age),
                  // _buildInfoRow("DOB:", cattleInfo.purchaseDate ?? 'N/A'),
                  if (cattleInfo.purchaseDate != null) ...[
                    _buildInfoRow("Purchase Date:", cattleInfo.purchaseDate!),
                    _buildInfoRow("Cost:", cattleInfo.cost),
                  ] else ...[
                    _buildInfoRow("Cattle Obtained:", "Born on Farm"),
                  ],
                  //  _buildInfoRow("Expense:", cattleInfo.expense),
                  _buildInfoRow("Vaccine:", cattleInfo.vaccine ?? 'N/A'),
                  _buildInfoRow(
                      "Vaccine Date:", cattleInfo.vaccineDate ?? 'N/A'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle()),
          Text(value, style: TextStyle(color: const Color(0xFF02B7C8))),
        ],
      ),
    );
  }
}

//---------------------DeadCattleDialog functionality

// class DeadCattleDialog extends StatefulWidget {
//   final String tag;
//   final int farmId;
//   final Function(int) onSubmitted;

//   DeadCattleDialog({
//     required this.tag,
//     required this.farmId,
//     required this.onSubmitted,
//   });

//   @override
//   _DeadCattleDialogState createState() => _DeadCattleDialogState();
// }

// class _DeadCattleDialogState extends State<DeadCattleDialog> {
//   final TextEditingController _controller = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Enter Estimated Cost'),
//       content: Form(
//         key: _formKey,
//         child: TextFormField(
//           controller: _controller,
//           decoration: InputDecoration(
//             labelText: 'Estimated Cost',
//           ),
//           keyboardType: TextInputType.number,
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter the estimated cost';
//             }
//             if (int.tryParse(value) == null) {
//               return 'Please enter a valid number';
//             }
//             return null;
//           },
//         ),
//       ),
//       actions: [
//         Row(
//           children: [
//             TextButton(
//               onPressed: () {
//                 if (_formKey.currentState?.validate() == true) {
//                   widget.onSubmitted(int.parse(_controller.text));
//                   Navigator.of(context).pop();
//                 }
//               },
//               child: Text('OK'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//--------------------old screen

// import 'package:cattlefarming/Models/cattleInfClass.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class CattleInfoScreen extends StatefulWidget {
//   final String cTag;

//   const CattleInfoScreen({super.key, required this.cTag});

//   @override
//   State<CattleInfoScreen> createState() => _CattleInfoScreenState();
// }

// class _CattleInfoScreenState extends State<CattleInfoScreen> {
//   // final List<CattleInfoRecord> cattleList = [
//   //   CattleInfoRecord(
//   //     tag: 'C14F',
//   //     weight: '250 KG',
//   //     gender: 'Female',
//   //     age: '2 Years',
//   //     bornDate: '2022-01-14',
//   //     cost: "2800000",
//   //     purchaseDate: '2023-11-14',
//   //     expense: '8000',
//   //     vaccine: 'BVD',
//   //     vaccineDate: '2024-02-13',
//   //   ),
//   // ];

//   late String tag;
//   String weight = '250 KG';
//   String gender = 'Female';
//   String age = '2 Years';
//   String bornDate = '2022-01-14';
//   String cost = "2800000";
//   String purchaseDate = '2023-11-14';
//   // String purchaseDate = 'null';
//   String expense = '8000';
//   String vaccine = 'BVD';
//   String vaccineDate = '2024-02-13';

//   @override
//   void initState() {
//     super.initState();
//     tag = widget.cTag;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Show Cattle Info",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         actions: [
//           PopupMenuButton(
//             icon: Icon(
//               Icons.menu,
//               color: Colors.white,
//             ), // Menu icon
//             itemBuilder: (BuildContext context) => [
//               // Menu items

//               PopupMenuItem(
//                 child: Text('Sale'),
//                 value: 'Sale',
//                 onTap: () {},
//               ),
//               PopupMenuItem(
//                 child: Text('Dead'),
//                 value: 'Dead',
//                 onTap: () {},
//               ),
//             ],
//           ),
//         ],

//         // actions: [
//         //   Builder(
//         //     builder: (context) => IconButton(
//         //       icon: Icon(
//         //         Icons.menu,
//         //         color: Colors.white,
//         //         size: 25,
//         //       ),
//         //       onPressed: () {
//         //         Scaffold.of(context).openEndDrawer();
//         //       },
//         //     ),
//         //   ),
//         // ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(0.0),
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Center(
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     height: 200,
//                     width: 359,
//                     color: Color(0xFF02B7C8),
//                   ),
//                   Positioned(
//                     left: 130,
//                     top: 15,
//                     child: Container(
//                       width: 120,
//                       height: 120,
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 238, 243, 243),
//                         borderRadius: BorderRadius.all(Radius.circular(60)),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 80,
//                     left: 145,
//                     child: Image.asset(
//                       "assets/images/cow.png",
//                       //fit: BoxFit.cover,
//                       width: 90,
//                       height: 90,
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 25,
//                       left: 160,
//                       child: Text(tag,
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white)))
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   bottom: 20, left: 50, right: 50, top: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Weight:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     weight,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 bottom: 20,
//                 left: 50,
//                 right: 50,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Gender:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     gender,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 bottom: 20,
//                 left: 50,
//                 right: 50,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Age:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     age,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 bottom: 20,
//                 left: 50,
//                 right: 50,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "DOB:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     bornDate,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             if (purchaseDate != 'null') ...[
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Purchase Date:",
//                       style: TextStyle(),
//                     ),
//                     Text(
//                       purchaseDate,
//                       style: TextStyle(
//                         color: const Color(0xFF02B7C8),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Cost:",
//                       style: TextStyle(),
//                     ),
//                     Text(
//                       cost,
//                       style: TextStyle(
//                         color: const Color(0xFF02B7C8),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Expense:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     expense,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Vaccine:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     vaccine,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20, left: 50, right: 50),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Vaccine Date:",
//                     style: TextStyle(),
//                   ),
//                   Text(
//                     vaccineDate,
//                     style: TextStyle(
//                       color: const Color(0xFF02B7C8),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ]),
//         ),
//       ),
//     );
//   }
// }
