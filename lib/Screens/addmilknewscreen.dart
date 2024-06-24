// import 'dart:collection';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AddMilkNewScreen extends StatefulWidget {
//   const AddMilkNewScreen({super.key});

//   @override
//   State<AddMilkNewScreen> createState() => _AddMilkNewScreenState();
// }

// class _AddMilkNewScreenState extends State<AddMilkNewScreen> {
//   // TextEditingController avgMilkCon = TextEditingController();
//   late List<TextEditingController> avgMilkcon;
//   late List<bool> _isChecked;

//   // Properly formatted records list
//   List<Map<String, String>> records = [
//     {'tag': 'C14F', 'totalMilk': '10'},
//     {'tag': 'B19F', 'totalMilk': '13'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the checkbox states
//     _isChecked = List<bool>.filled(records.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Add Milk Record",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: ListView.builder(
//         shrinkWrap: true,
//         itemCount: records.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 3,
//               child: ListTile(
//                 title: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Tag: ${records[index]['tag']}'),
//                     Checkbox(
//                       //side: BorderSide(color: Color(0xFF02B7C8)),
//                       value: _isChecked[index],
//                       onChanged: (value) {
//                         setState(() {
//                           _isChecked[index] = value!;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 subtitle: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 15, bottom: 10),
//                       child: Container(
//                         width: 150,
//                         height: 45,
//                         child: TextFormField(
//                           keyboardType: TextInputType.numberWithOptions(),
//                           controller: avgMilkcon,
//                           decoration: InputDecoration(
//                             labelText: 'Total Milk',
//                             // labelStyle:
//                             //  TextStyle(color: Colors.blue), // Label color
//                             floatingLabelBehavior: FloatingLabelBehavior.always,
//                             hintText: '10 ltr',
//                             border: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   //  color: Colors.blue, // Border color
//                                   //   style: BorderStyle.solid,

//                                   //  width: 1,
//                                   ),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 // color: Colors.blue, // Enabled border color
//                                 style: BorderStyle.solid,
//                                 width: 2,
//                               ),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                 //   color: Colors.blue, // Focused border color
//                                 style: BorderStyle.solid,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class AddMilkNewScreen extends StatefulWidget {
//   const AddMilkNewScreen({super.key});

//   @override
//   State<AddMilkNewScreen> createState() => _AddMilkNewScreenState();
// }

// class _AddMilkNewScreenState extends State<AddMilkNewScreen> {
//   TextEditingController datecon = TextEditingController();
//   late List<TextEditingController> avgMilkControllers;
//   late List<bool> _isChecked;
//   List<Map<String, dynamic>> records = [];
//   String? selectedTime = "Morning";

//   @override
//   void initState() {
//     super.initState();
//     fetchMilkData();
//   }

//   Future<void> fetchMilkData() async {
//     final response = await http.get(Uri.parse(
//         'http://192.168.237.224/CattleFarmingAPI/api/Milk/GetAllMilkDetails'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       setState(() {
//         records = data
//             .map((item) => {
//                   'tag': item['CattleTag'],
//                   'totalMilk': item['TotalMilk'].toString(),
//                 })
//             .toList();
//         avgMilkControllers = List.generate(
//             records.length,
//             (index) =>
//                 TextEditingController(text: records[index]['totalMilk']));
//         _isChecked = List<bool>.filled(records.length, false);
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   Future<void> postUpdatedMilkData() async {
//     List<Map<String, dynamic>> updatedRecords = [];
//     for (int i = 0; i < records.length; i++) {
//       if (_isChecked[i]) {
//         updatedRecords.add({
//           'tag': records[i]['tag'],
//           'totalMilk': avgMilkControllers[i].text,
//         });
//       }
//     }

//     final response = await http.post(
//       Uri.parse('http://192.168.237.224/api/PostUpdatedMilkData'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(updatedRecords),
//     );

//     if (response.statusCode == 200) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Center(child: Text('Data posted successfully')),
//           );
//         },
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Center(
//                 child: Text(
//                     'Failed to post data to the database. Status code: ${response.statusCode}')),
//           );
//         },
//       );
//     }
//   }

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? datePicker = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1947),
//         lastDate: DateTime(2050));
//     if (datePicker != null) {
//       setState(() {
//         datecon.text = datePicker.toString().split(' ')[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Add Milk Record",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: records.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(bottom: 8, left: 30, top: 30),
//                     child: Text(
//                       "Date",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 25.0),
//                     child: Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           border: Border.all(color: const Color(0xFF02B7C8))),
//                       child: Center(
//                         child: GestureDetector(
//                           onTap: () => selectDate(context),
//                           child: AbsorbPointer(
//                             //AbsorbPointer used to prevent user input in textformfield
//                             child: TextFormField(
//                               controller: datecon,
//                               decoration: InputDecoration(
//                                   hintText: '2023-11-14',
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 30.0, vertical: 10.0),
//                                   suffixIcon: Icon(
//                                     Icons.calendar_month_outlined,
//                                     color: Theme.of(context)
//                                         .inputDecorationTheme
//                                         .hintStyle
//                                         ?.color,
//                                   )),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30.0),
//                     child: Row(
//                       children: [
//                         Radio(
//                             value: "Morning",
//                             groupValue: selectedTime,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedTime = value as String;
//                               });
//                             }),
//                         Text(
//                           "Morning",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Radio(
//                             value: "Evening",
//                             groupValue: selectedTime,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedTime = value as String;
//                               });
//                             }),
//                         Text(
//                           "Evening",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: records.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Card(
//                           elevation: 3,
//                           child: ListTile(
//                             title: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Tag: ${records[index]['tag']}'),
//                                 Checkbox(
//                                   value: _isChecked[index],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       _isChecked[index] = value!;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                             subtitle: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 15, bottom: 10),
//                                   child: Container(
//                                     width: 150,
//                                     height: 45,
//                                     child: TextFormField(
//                                       keyboardType:
//                                           TextInputType.numberWithOptions(),
//                                       controller: avgMilkControllers[index],
//                                       decoration: InputDecoration(
//                                         labelText: 'Total Milk',
//                                         floatingLabelBehavior:
//                                             FloatingLabelBehavior.always,
//                                         hintText: '10 ltr',
//                                         border: OutlineInputBorder(
//                                           borderSide: BorderSide(),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             style: BorderStyle.solid,
//                                             width: 2,
//                                           ),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                             style: BorderStyle.solid,
//                                             width: 2,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: postUpdatedMilkData,
//         child: Icon(Icons.save),
//         backgroundColor: Colors.deepPurpleAccent,
//       ),
//     );
//   }
// }

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:flutter/material.dart';

class AddMilkNewScreen extends StatefulWidget {
  const AddMilkNewScreen({super.key});

  @override
  State<AddMilkNewScreen> createState() => _AddMilkNewScreenState();
}

class _AddMilkNewScreenState extends State<AddMilkNewScreen> {
  int farmId = 1;

  TextEditingController datecon = TextEditingController();
  late List<TextEditingController> avgMilkControllers;
  late List<bool> _isChecked;
  List<Map<String, dynamic>> records = [];
  String? selectedTime = "Morning";
  final ApiHandler apiHandler = ApiHandler();

  @override
  void initState() {
    super.initState();
    fetchMilkData();
  }

  Future<void> fetchMilkData() async {
    try {
      List<Map<String, dynamic>> data = await apiHandler.fetchMilkData();

      setState(() {
        records = data;
        avgMilkControllers = List.generate(
            records.length,
            (index) =>
                TextEditingController(text: records[index]['totalMilk']));
        _isChecked = List<bool>.filled(records.length, false);
      });
    } catch (e) {
      // Handle any errors that occur during the fetch
      print('Error fetching milk data: $e');
    }
  }

  Future<void> postUpdatedMilkData() async {
    List<Map<String, dynamic>> updatedRecords = [];
    for (int i = 0; i < records.length; i++) {
      if (_isChecked[i]) {
        updatedRecords.add({
          'CattleTag': records[i]['tag'],
          'TotalMilk': avgMilkControllers[i].text,
          'Date': datecon.text,
          'Time': selectedTime,
          'FarmId': farmId
        });
      }
    }

    try {
      await apiHandler.postUpdatedMilkData(updatedRecords);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Data posted successfully')),
          );
        },
      );
      datecon.text = ' ';
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text('Failed to post data to the database. Error: $e')),
          );
        },
      );
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));
    if (datePicker != null) {
      setState(() {
        datecon.text = datePicker.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Milk Record",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: records.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 30, top: 30),
                    child: Text(
                      "Date",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: const Color(0xFF02B7C8))),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => selectDate(context),
                          child: AbsorbPointer(
                            //AbsorbPointer used to prevent user input in textformfield
                            child: TextFormField(
                              controller: datecon,
                              decoration: InputDecoration(
                                  hintText: '2023-11-14',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 10.0),
                                  suffixIcon: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Theme.of(context)
                                        .inputDecorationTheme
                                        .hintStyle
                                        ?.color,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Row(
                      children: [
                        Radio(
                            value: "Morning",
                            groupValue: selectedTime,
                            onChanged: (value) {
                              setState(() {
                                selectedTime = value as String;
                              });
                            }),
                        Text(
                          "Morning",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 20),
                        Radio(
                            value: "Evening",
                            groupValue: selectedTime,
                            onChanged: (value) {
                              setState(() {
                                selectedTime = value as String;
                              });
                            }),
                        Text(
                          "Evening",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tag: ${records[index]['tag']}'),
                                Checkbox(
                                  value: _isChecked[index],
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked[index] = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            subtitle: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 10),
                                  child: Container(
                                    width: 150,
                                    height: 45,
                                    child: TextFormField(
                                      keyboardType:
                                          TextInputType.numberWithOptions(),
                                      controller: avgMilkControllers[index],
                                      decoration: InputDecoration(
                                        labelText: 'Total Milk',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        hintText: '10 ltr',
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 2,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: postUpdatedMilkData,
        child: Icon(Icons.save),
      ),
    );
  }
}
