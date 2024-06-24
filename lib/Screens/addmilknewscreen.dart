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

//---------------------------------------------------------------------------

// import 'dart:convert';

// import 'package:cattlefarming/Models/addnewMilk.dart';
// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:http/http.dart' as http;

// class AddMilkNewScreen extends StatefulWidget {
//   final String? qrData;
//   const AddMilkNewScreen({Key? key, this.qrData}) : super(key: key);

//   @override
//   State<AddMilkNewScreen> createState() => _AddMilkNewScreenState();
// }

// class _AddMilkNewScreenState extends State<AddMilkNewScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   int farmId = 1;
//   late String? qrdata;
//   TextEditingController datecon = TextEditingController();
//   TextEditingController tagcon = TextEditingController();
//   late List<TextEditingController> avgMilkControllers;
//   late TextEditingController singleavgMilkControllers;
//   late List<bool> _isChecked;
//   List<AddMilkInfo> records = [];

//   List<AddMilkInfo> filteredRecords = [];
//   String? selectedTime = "Morning";
//   final ApiHandler apiHandler = ApiHandler();
//   String? tag;

//   void _onQRViewCreated(QRViewController controller) {
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         tag = scanData.code;
//         print("-----------------------------------------ye tag hy$tag");
//         tagcon.text = tag!;
//         //filterWeightBytag(tag!);
//         // setState(() {
//         //   fetchSingleCattleMilkData(tag!);
//         // });

//         controller.pauseCamera(); // Pause camera after successful scan
//         Navigator.of(context).pop(); // Close the QR scanner dialog if any
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     qrdata = widget.qrData;
//     fetchMilkRecord();
//   }

//   bool isBulkSelected = true;

//   //List<cattleAvgMilkRecord> cattleList = [];
//   bool isLoading = true;
//   // int farmId = 1;

//   // Future<void> filteraddMilkByTag(String query) async {
//   //   if (query.isNotEmpty) {
//   //     try {
//   //       final cattleRecord = await apiHandler.fetchSingleCattleMilkData(query);
//   //       setState(() {
//   //         records = [cattleRecord];
//   //       });
//   //     } catch (e) {
//   //       print('Failed to load data for tag $query: $e');
//   //     }
//   //   } else {
//   //     fetchMilkData();
//   //   }
//   // }

//   // Future<void> fetchSingleCattleMilkData(String tag) async {
//   //   try {
//   //   List<Map<String, dynamic>> data =
//   //         await apiHandler.fetchSingleCattleMilkData(tag);

//   //     setState(() {
//   //       records = data;
//   //       avgMilkControllers = List.generate(
//   //           records.length,
//   //           (index) =>
//   //               TextEditingController(text: records[index]['totalMilk']));
//   //       _isChecked = List<bool>.filled(records.length, false);
//   //       setState(() {
//   //         isLoading = false;
//   //       });
//   //     });
//   //   } catch (e) {
//   //     // Handle any errors that occur during the fetch
//   //     print('Error fetching milk data for tag $tag: $e');
//   //   }
//   // }
//   // Future<void> fetchSingleCattleMilkData(String tag) async {
//   //   try {
//   //     final response = await http.get(Uri.parse(
//   //         'http://192.168.239.224/CattleFarmingAPI/api/Milk/GetAliveCattleWithMilk?tag=$tag'));
//   //     if (response.statusCode == 200) {
//   //       Map<String, dynamic> data = jsonDecode(response.body);
//   //       print(data);
//   //       setState(() {
//   //         singleRecord = [
//   //           data
//   //         ]; // Wrapping data in a list to maintain consistency
//   //         singleavgMilkControllers =
//   //             TextEditingController(text: data['totalMilk'].toString());
//   //         _isChecked = [false];
//   //       });
//   //     } else {
//   //       throw Exception('Failed to load data for cattle with tag: $tag');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching milk data for tag $tag: $e');
//   //   }
//   // }
//   // Future<void> fetchSingleCattleMilkData(String tag) async {
//   //   try {
//   //     final response = await http.get(Uri.parse(
//   //         'http://192.168.239.224/CattleFarmingAPI/api//Milk/GetAliveCattleWithMilk?tag=$tag'));
//   //     if (response.statusCode == 200) {
//   //       Map<String, dynamic> data = jsonDecode(response.body);
//   //       print(data);
//   //       setState(() {
//   //         singleRecord = [
//   //           data
//   //         ]; // Wrapping data in a list to maintain consistency
//   //         singleavgMilkControllers =
//   //             TextEditingController(text: data['totalMilk'].toString());
//   //         _isChecked = [false]; // Ensure this is consistent with singleRecord
//   //       });
//   //     } else {
//   //       throw Exception('Failed to load data for cattle with tag: $tag');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching milk data for tag $tag: $e');
//   //   }
//   // }

//   // Future<void> postUpdatedSingleCattleMilkData() async {
//   //   if (records.isEmpty) return;

//   //   Map<String, dynamic> updatedRecord = {
//   //     'CattleTag': records[0].tag,
//   //     'TotalMilk': avgMilkControllers[0].text,
//   //     'Date': datecon.text,
//   //     'Time': selectedTime,
//   //     'FarmId': farmId
//   //   };

//   //   try {
//   //     await apiHandler.postUpdatedSingleCattleMilkData(updatedRecord);
//   //     showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           title: Center(child: Text('Data posted successfully')),
//   //         );
//   //       },
//   //     );
//   //     datecon.text = ' ';
//   //   } catch (e) {
//   //     showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           title: Center(
//   //               child: Text('Failed to post data to the database. Error: $e')),
//   //         );
//   //       },
//   //     );
//   //   }
//   // }

//   void filterMilkRecords() {
//     String tag = tagcon.text.toLowerCase();

//     setState(() {
//       filteredRecords = records.where((record) {
//         bool matchesTag = record.tag.toLowerCase().contains(tag);
//         return matchesTag;
//       }).toList();
//     });
//   }

//   Future<void> fetchMilkRecord() async {
//     setState(() {
//       isLoading = true; // Start loading state
//     });

//     try {
//       List<AddMilkInfo> data = await apiHandler.fetchMilkData();

//       setState(() {
//         records = data;
//         filteredRecords = records;
//         avgMilkControllers = List.generate(
//             records.length,
//             (index) => TextEditingController(
//                 text: records[index].totalMilk.toString()));
//         _isChecked = List<bool>.filled(records.length, false);
//         isLoading = false; // End loading state
//       });
//     } catch (e) {
//       // Handle any errors that occur during the fetch
//       print('Error fetching milk data: $e');
//       setState(() {
//         isLoading = false; // End loading state even if there's an error
//       });
//     }
//   }

//   // Future<void> fetchMilkData() async {
//   //   try {
//   //     List<Map<String, dynamic>> dataa = await apiHandler.fetchMilkData();

//   //     setState(() {
//   //       records = dataa;
//   //       avgMilkControllers = List.generate(
//   //           records.length,
//   //           (index) =>
//   //               TextEditingController(text: records[index]['totalMilk']));
//   //       _isChecked = List<bool>.filled(records.length, false);
//   //       setState(() {
//   //         isLoading = false;
//   //       });
//   //     });
//   //   } catch (e) {
//   //     // Handle any errors that occur during the fetch
//   //     print('Error fetching milk data: $e');
//   //   }
//   // }

//   // Future<void> postUpdatedMilkData() async {
//   //   List<Map<String, dynamic>> updatedRecords = [];
//   //   for (int i = 0; i < records.length; i++) {
//   //     if (_isChecked[i]) {
//   //       updatedRecords.add({
//   //         'CattleTag': records[i].tag,
//   //         'TotalMilk': avgMilkControllers[i].text,
//   //         'Date': datecon.text,
//   //         'Time': selectedTime,
//   //         'FarmId': farmId
//   //       });
//   //     }
//   //   }

//   //   try {
//   //     await apiHandler.postUpdatedMilkData(updatedRecords);
//   //     showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           title: Center(child: Text('Data posted successfully')),
//   //         );
//   //       },
//   //     );
//   //     datecon.text = ' ';
//   //   } catch (e) {
//   //     showDialog(
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           title: Center(
//   //               child: Text('Failed to post data to the database. Error: $e')),
//   //         );
//   //       },
//   //     );
//   //   }
//   // }

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
//           : Column(
//               children: [
//                 Container(
//                   width: 360,
//                   height: 2,
//                   color: Color.fromARGB(255, 161, 228, 235),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 179,
//                       height: 60,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                             isBulkSelected
//                                 ? Colors.grey
//                                 : const Color(0xFF039BA8),
//                           ),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero,
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isBulkSelected = true;
//                           });
//                         },
//                         child: const Text(
//                           "Bulk",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 179,
//                       height: 60,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(
//                             !isBulkSelected
//                                 ? Colors.grey
//                                 : const Color(0xFF039BA8),
//                           ),
//                           shape:
//                               MaterialStateProperty.all<RoundedRectangleBorder>(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.zero,
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             isBulkSelected = false;
//                           });
//                         },
//                         child: const Text(
//                           "Individual",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (isBulkSelected) ...[
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 8, left: 30, top: 10),
//                               child: Text(
//                                 "Tag",
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 25.0),
//                               child: Container(
//                                 width: 300,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   border: Border.all(
//                                       color: const Color(0xFF02B7C8)),
//                                 ),
//                                 child: Center(
//                                   child: TextFormField(
//                                     controller: tagcon,
//                                     decoration: const InputDecoration(
//                                       hintText: 'C14F',
//                                       hintStyle: TextStyle(),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 30.0),
//                                     ),
//                                     //  onFieldSubmitted: handleTagSubmit,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 8, left: 30, top: 10),
//                               child: Text(
//                                 "Date",
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 25.0),
//                               child: Container(
//                                 width: 300,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                     border: Border.all(
//                                         color: const Color(0xFF02B7C8))),
//                                 child: Center(
//                                   child: GestureDetector(
//                                     onTap: () => selectDate(context),
//                                     child: AbsorbPointer(
//                                       //AbsorbPointer used to prevent user input in textformfield
//                                       child: TextFormField(
//                                         controller: datecon,
//                                         decoration: InputDecoration(
//                                             hintText: '2023-11-14',
//                                             border: InputBorder.none,
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 30.0,
//                                                     vertical: 10.0),
//                                             suffixIcon: Icon(
//                                               Icons.calendar_month_outlined,
//                                               color: Theme.of(context)
//                                                   .inputDecorationTheme
//                                                   .hintStyle
//                                                   ?.color,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30.0),
//                               child: Row(
//                                 children: [
//                                   Radio(
//                                       value: "Morning",
//                                       groupValue: selectedTime,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           selectedTime = value as String;
//                                         });
//                                       }),
//                                   Text(
//                                     "Morning",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   SizedBox(width: 20),
//                                   Radio(
//                                       value: "Evening",
//                                       groupValue: selectedTime,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           selectedTime = value as String;
//                                         });
//                                       }),
//                                   Text(
//                                     "Evening",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             ListView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: records.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Card(
//                                     elevation: 3,
//                                     child: ListTile(
//                                       title: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Tag: ${records[index].tag}'),
//                                           Checkbox(
//                                             value: _isChecked[index],
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 _isChecked[index] = value!;
//                                               });
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       subtitle: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: 15, bottom: 10),
//                                             child: Container(
//                                               width: 150,
//                                               height: 45,
//                                               child: TextFormField(
//                                                 keyboardType: TextInputType
//                                                     .numberWithOptions(),
//                                                 controller:
//                                                     avgMilkControllers[index],
//                                                 decoration: InputDecoration(
//                                                   labelText: 'Total Milk',
//                                                   floatingLabelBehavior:
//                                                       FloatingLabelBehavior
//                                                           .always,
//                                                   hintText: '10 ltr',
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(),
//                                                   ),
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       style: BorderStyle.solid,
//                                                       width: 2,
//                                                     ),
//                                                   ),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       style: BorderStyle.solid,
//                                                       width: 2,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                           if (!isBulkSelected) ...[
//                             SizedBox(
//                               height: 10,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       title: Text('Scan QR'),
//                                       content: SizedBox(
//                                         width: double.infinity,
//                                         height: 300,
//                                         child: QRView(
//                                           key: qrKey,
//                                           onQRViewCreated: _onQRViewCreated,
//                                         ),
//                                       ),
//                                       actions: [
//                                         TextButton(
//                                           child: Text('Close'),
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 );
//                               },
//                               child: Center(
//                                 child: Stack(
//                                   children: <Widget>[
//                                     Container(
//                                       width: 170,
//                                       height: 170,
//                                       decoration: BoxDecoration(
//                                         color:
//                                             Color.fromARGB(255, 238, 243, 243),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(85)),
//                                         border: Border.all(
//                                             color: const Color(0xFF02B7C8)),
//                                         boxShadow: [
//                                           BoxShadow(
//                                             color: const Color(
//                                                 0xFF02B7C8), // Shadow color and opacity
//                                             spreadRadius:
//                                                 1, // Shadow spread radius
//                                             blurRadius: 5, // Shadow blur radius
//                                             offset:
//                                                 Offset(0, 0), // Shadow offset
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: 60,
//                                       left: 24,
//                                       child: Image.asset(
//                                         'assets/images/camera.png',

//                                         //fit: BoxFit.cover,assets/images/measure.png
//                                         width: 120,
//                                         height: 90,
//                                       ),
//                                     ),
//                                     Positioned(
//                                         bottom: 30,
//                                         left: 43,
//                                         child: Text(
//                                           "Scan QR",
//                                           style: TextStyle(fontSize: 20),
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 8, left: 30, top: 10),
//                               child: Text(
//                                 "Tag",
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 25.0),
//                               child: Container(
//                                 width: 300,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20.0),
//                                   border: Border.all(
//                                       color: const Color(0xFF02B7C8)),
//                                 ),
//                                 child: Center(
//                                   child: TextFormField(
//                                     controller: tagcon,
//                                     decoration: const InputDecoration(
//                                       hintText: 'C14F',
//                                       hintStyle: TextStyle(),
//                                       border: InputBorder.none,
//                                       contentPadding: EdgeInsets.symmetric(
//                                           horizontal: 30.0),
//                                     ),
//                                     //  onFieldSubmitted: handleTagSubmit,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   bottom: 8, left: 30, top: 10),
//                               child: Text(
//                                 "Date",
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 25.0),
//                               child: Container(
//                                 width: 300,
//                                 height: 60,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(20.0),
//                                     border: Border.all(
//                                         color: const Color(0xFF02B7C8))),
//                                 child: Center(
//                                   child: GestureDetector(
//                                     onTap: () => selectDate(context),
//                                     child: AbsorbPointer(
//                                       //AbsorbPointer used to prevent user input in textformfield
//                                       child: TextFormField(
//                                         controller: datecon,
//                                         decoration: InputDecoration(
//                                             hintText: '2023-11-14',
//                                             border: InputBorder.none,
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 30.0,
//                                                     vertical: 10.0),
//                                             suffixIcon: Icon(
//                                               Icons.calendar_month_outlined,
//                                               color: Theme.of(context)
//                                                   .inputDecorationTheme
//                                                   .hintStyle
//                                                   ?.color,
//                                             )),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30.0),
//                               child: Row(
//                                 children: [
//                                   Radio(
//                                       value: "Morning",
//                                       groupValue: selectedTime,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           selectedTime = value as String;
//                                         });
//                                       }),
//                                   Text(
//                                     "Morning",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                   SizedBox(width: 20),
//                                   Radio(
//                                       value: "Evening",
//                                       groupValue: selectedTime,
//                                       onChanged: (value) {
//                                         setState(() {
//                                           selectedTime = value as String;
//                                         });
//                                       }),
//                                   Text(
//                                     "Evening",
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 16),
//                             SizedBox(height: 10),
//                             ListView.builder(
//                               shrinkWrap: true,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: records.length,
//                               itemBuilder: (context, index) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Card(
//                                     elevation: 3,
//                                     child: ListTile(
//                                       title: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text('Tag: ${records[index].tag}'),
//                                           Checkbox(
//                                             value: _isChecked[index],
//                                             onChanged: (value) {
//                                               setState(() {
//                                                 _isChecked[index] = value!;
//                                               });
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                       subtitle: Column(
//                                         mainAxisSize: MainAxisSize.min,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: 15, bottom: 10),
//                                             child: Container(
//                                               width: 150,
//                                               height: 45,
//                                               child: TextFormField(
//                                                 keyboardType: TextInputType
//                                                     .numberWithOptions(),
//                                                 controller:
//                                                     singleavgMilkControllers,
//                                                 decoration: InputDecoration(
//                                                   labelText: 'Total Milk',
//                                                   floatingLabelBehavior:
//                                                       FloatingLabelBehavior
//                                                           .always,
//                                                   hintText: '10 ltr',
//                                                   border: OutlineInputBorder(
//                                                     borderSide: BorderSide(),
//                                                   ),
//                                                   enabledBorder:
//                                                       OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       style: BorderStyle.solid,
//                                                       width: 2,
//                                                     ),
//                                                   ),
//                                                   focusedBorder:
//                                                       OutlineInputBorder(
//                                                     borderSide: BorderSide(
//                                                       style: BorderStyle.solid,
//                                                       width: 2,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     // Navigate to different screens based on isIncomeSelected
//       //     if (isBulkSelected) {
//       //       // Navigate to income screen
//       //       postUpdatedMilkData();
//       //     } else {
//       //       // Navigate to expense screen
//       //       postUpdatedSingleCattleMilkData();
//       //     }
//       //   },
//       //   child: const Icon(Icons.save),
//       // ),
//     );
//   }
// }

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddMilkNewScreen extends StatefulWidget {
  final String? qrData;
  const AddMilkNewScreen({Key? key, this.qrData}) : super(key: key);

  @override
  State<AddMilkNewScreen> createState() => _AddMilkNewScreenState();
}

class _AddMilkNewScreenState extends State<AddMilkNewScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  int farmId = 1;
  late String? qrdata;
  TextEditingController datecon = TextEditingController();
  TextEditingController tagcon = TextEditingController();
  TextEditingController totalMilkcon = TextEditingController();
  late List<TextEditingController> avgMilkControllers;
  late List<bool> _isChecked;
  List<Map<String, dynamic>> records = [];
  String? selectedTime = "Morning";
  final ApiHandler apiHandler = ApiHandler();
  String? tag;

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        tag = scanData.code;
        print("-----------------------------------------ye tag hy$tag");
        tagcon.text = tag!;

        // handleTagSubmit(tag!);
        controller.pauseCamera(); // Pause camera after successful scan
        Navigator.of(context).pop(); // Close the QR scanner dialog if any
      });
    });
  }

  @override
  void initState() {
    super.initState();
    qrdata = widget.qrData;
    fetchMilkData();
  }

  bool isBulkSelected = true;
  // Future<void> fetchMilkData() async {
  //   try {
  //     List<Map<String, dynamic>> data = await apiHandler.fetchMilkData();

  //     setState(() {
  //       records = data;
  //       avgMilkControllers = List.generate(
  //           records.length,
  //           (index) =>
  //               TextEditingController(text: records[index]['totalMilk']));
  //       _isChecked = List<bool>.filled(records.length, false);
  //     });
  //   } catch (e) {
  //     // Handle any errors that occur during the fetch
  //     print('Error fetching milk data: $e');
  //   }
  // }
  Future<void> fetchMilkData() async {
    try {
      List<Map<String, dynamic>> data = await apiHandler.fetchMilkData();

      setState(() {
        records = data;
        avgMilkControllers = List.generate(
            records.length,
            (index) =>
                TextEditingController(text: records[index]['TotalMilk']));
        _isChecked = List<bool>.filled(records.length, false);
      });
    } catch (e) {
      print('Error fetching milk data: $e');
    }
  }

  Future<void> postUpdatedMilkData() async {
    List<Map<String, dynamic>> updatedRecords = [];
    for (int i = 0; i < records.length; i++) {
      if (_isChecked[i]) {
        updatedRecords.add({
          'CattleTag': records[i]['Tag'], // Ensure 'Tag' is used correctly
          'TotalMilk': avgMilkControllers[i].text,
          'Date': datecon.text,
          'Time': selectedTime,
          'FarmId': farmId
        });
      }
    }

    // Log data before sending
    print('Updated Records: $updatedRecords');

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

  //final ApiHandler apiHandler = ApiHandler(baseUrl);

  Future<void> saveMilkCollection() async {
    final milkData = {
      'CattleTag': tagcon.text,
      'Date': datecon.text,
      'Time': selectedTime,
      'TotalMilk': totalMilkcon.text,
      'FarmId': farmId
    };

    try {
      await apiHandler.saveMilkCollection(milkData);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Milk added successfully')),
          );
        },
      );

      tagcon.clear();
      datecon.clear();
      totalMilkcon.clear();
      setState(() {
        selectedTime = "Morning"; // Assuming you want to reset selectedTime
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                Center(child: Text('Failed to add milk collection. Error: $e')),
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
      body: Column(
        children: [
          Container(
            width: 360,
            height: 2,
            color: Color.fromARGB(255, 161, 228, 235),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 179,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      isBulkSelected ? Colors.grey : const Color(0xFF039BA8),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isBulkSelected = true;
                    });
                  },
                  child: const Text(
                    "Bulk",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 179,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      !isBulkSelected ? Colors.grey : const Color(0xFF039BA8),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isBulkSelected = false;
                    });
                  },
                  child: const Text(
                    "Individual",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isBulkSelected) ...[
                      SizedBox(height: 10),
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
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () => selectDate(context),
                              child: AbsorbPointer(
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
                                    ),
                                  ),
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
                              },
                            ),
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
                              },
                            ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Tag: ${records[index]['Tag']}'),
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
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 10),
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
                      )
                    ],
                    if (!isBulkSelected) ...[
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Scan QR'),
                                content: SizedBox(
                                  width: double.infinity,
                                  height: 300,
                                  child: QRView(
                                    key: qrKey,
                                    onQRViewCreated: _onQRViewCreated,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Center(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 170,
                                height: 170,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 238, 243, 243),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(85)),
                                  border: Border.all(
                                      color: const Color(0xFF02B7C8)),
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
                                bottom: 60,
                                left: 24,
                                child: Image.asset(
                                  'assets/images/camera.png',

                                  //fit: BoxFit.cover,assets/images/measure.png
                                  width: 120,
                                  height: 90,
                                ),
                              ),
                              Positioned(
                                  bottom: 30,
                                  left: 43,
                                  child: Text(
                                    "Scan QR",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 35),
                        child: Text(
                          "Tag",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                                  Border.all(color: const Color(0xFF02B7C8))),
                          child: Center(
                            child: TextFormField(
                              controller: tagcon,
                              decoration: const InputDecoration(
                                hintText: 'C14F',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 10),
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
                              },
                            ),
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
                              },
                            ),
                            Text(
                              "Evening",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          left: 30,
                        ),
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
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () => selectDate(context),
                              child: AbsorbPointer(
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
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 30),
                        child: Text(
                          "Total Milk",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                                  Border.all(color: const Color(0xFF02B7C8))),
                          child: Center(
                            child: TextFormField(
                              controller: totalMilkcon,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: const InputDecoration(
                                hintText: '10 ltr',
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 30.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to different screens based on isIncomeSelected
          if (isBulkSelected) {
            // Navigate to income screen
            postUpdatedMilkData();
          } else {
            // Navigate to expense screen
            //  postUpdatedSingleCattleMilkData(tagcon.text);
            saveMilkCollection();
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
