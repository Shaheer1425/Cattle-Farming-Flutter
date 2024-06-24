// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/weightClass.dart';

// import 'package:cattlefarming/Screens/weightScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ViewWeightScreen extends StatefulWidget {
//   const ViewWeightScreen({super.key});

//   @override
//   State<ViewWeightScreen> createState() => _ViewWeightScreenState();
// }

// class _ViewWeightScreenState extends State<ViewWeightScreen> {
//   // List of TemperatureRecord data

//   ApiHandler apiHandler = ApiHandler();

//   TextEditingController datecon = TextEditingController();
//   // Future<void> selectDate(BuildContext context) async {
//   //   final DateTime? datePicker = await showDatePicker(
//   //       context: context,
//   //       initialDate: DateTime.now(),
//   //       firstDate: DateTime(1947),
//   //       lastDate: DateTime(2050));
//   //   if (datePicker != null) {
//   //     setState(() {
//   //       datecon.text = datePicker.toString().split(' ')[0];
//   //     });
//   //   }
//   // }

//   // List<WeightRecord> records = [];
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   setState(() {
//   //     fetchWeights();
//   //   });
//   // }

//   // Future<void> fetchWeights() async {
//   //   if (datecon.text.isNotEmpty) {
//   //     records = await apiHandler.getWeightByDate(datecon.text);
//   //   } else {
//   //     records = await apiHandler.getAllWeights();
//   //   }
//   //   setState(() {});
//   // }

//   List<WeightRecord> records = [];
//   @override
//   void initState() {
//     super.initState();
//     // datecon.text = DateTime.now().toString().split(' ')[0]; // Set default date
//     fetchWeights(); // Fetch weights initially
//   }

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? datePicker = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1947),
//       lastDate: DateTime(2050),
//     );
//     if (datePicker != null) {
//       setState(() {
//         datecon.text = datePicker.toString().split(' ')[0];
//       });
//       fetchWeights(); // Fetch weights for the selected date
//     }
//   }

//   Future<void> fetchWeights() async {
//     if (datecon.text.isNotEmpty) {
//       records = await apiHandler.getWeightByDate(datecon.text);
//     } else {
//       records = await apiHandler.getAllWeights();
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Weight Record",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => WeightScreen()));
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 25.0, bottom: 18),
//               child: Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: GestureDetector(
//                     onTap: () => selectDate(context),
//                     child: AbsorbPointer(
//                       //AbsorbPointer used to prevent user input in textformfield
//                       child: TextFormField(
//                         controller: datecon,
//                         decoration: InputDecoration(
//                             hintText: '2023-11-14',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                             suffixIcon: Icon(
//                               Icons.calendar_month_outlined,
//                               color: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .hintStyle
//                                   ?.color,
//                             )),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: records.length,
//               itemBuilder: (context, index) {
//                 final record = records[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 3,
//                     child: ListTile(
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Tag: ${record.tag}'),
//                           Text('Weight: ${record.weight}'),
//                         ],
//                       ),
//                       subtitle: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 35, bottom: 10),
//                             child: Text(
//                               'Date: ${record.date}',
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           const Color(0xFF039BA8)),
//                                   foregroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   fixedSize: MaterialStateProperty.all<Size>(
//                                       Size(90, 15)),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text('Edit'),
//                               ),
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           const Color(0xFF039BA8)),
//                                   foregroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   fixedSize: MaterialStateProperty.all<Size>(
//                                       Size(90, 15)),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text('Delete'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//--------------------In this below screen on search cattle by tag functionality available

// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/weightClass.dart';
// import 'package:cattlefarming/Screens/addWeightScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class ViewWeightScreen extends StatefulWidget {
//   const ViewWeightScreen({super.key});

//   @override
//   State<ViewWeightScreen> createState() => _ViewWeightScreenState();
// }

// class _ViewWeightScreenState extends State<ViewWeightScreen> {
//   // final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   ApiHandler apiHandler = ApiHandler();
//   TextEditingController tagcon = TextEditingController();
//   List<WeightRecord> records = [];
//   // String? tag;

//   // void _onQRViewCreated(QRViewController controller) {
//   //   controller.scannedDataStream.listen((scanData) {
//   //     setState(() {
//   //       tag = scanData.code;
//   //       print("-----------------------------------------ye tag hy$tag");
//   //       tagcon.text = tag!;
//   //       filterWeightBytag(tag!);
//   //       controller.pauseCamera(); // Pause camera after successful scan
//   //       Navigator.of(context).pop(); // Close the QR scanner dialog if any
//   //     });
//   //   });
//   // }

//   // @override
//   // void dispose() {
//   //   tagcon.dispose();
//   //   super.dispose();
//   // }

//   @override
//   void initState() {
//     super.initState();
//     fetchWeights(); // Fetch weights initially
//     tagcon.addListener(() {
//       // Call the filter function whenever text changes
//       filterWeightBytag(tagcon.text);
//     });
//   }

//   Future<void> fetchWeights() async {
//     if (tagcon.text.isNotEmpty) {
//       records = await apiHandler.getWeightByTag(tagcon.text);
//     } else {
//       records = await apiHandler.getAllWeights();
//     }
//     setState(() {}); // Update the UI after fetching weights
//   }

//   Future<void> filterWeightBytag(String tag) async {
//     // Fetch records based on the provided query
//     if (tag.isNotEmpty) {
//       records = await apiHandler.getWeightByTag(tag);
//     } else {
//       records = await apiHandler.getAllWeights();
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Metrics Record",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final newRecord = await Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => WeightScreen(),
//             ),
//           );

//           // Check if a new record was returned
//           if (newRecord != null && newRecord is WeightRecord) {
//             setState(() {
//               records.add(newRecord);
//             });
//           }
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 15,
//             ),
//             // GestureDetector(
//             //   onTap: () {
//             //     showDialog(
//             //       context: context,
//             //       builder: (BuildContext context) {
//             //         return AlertDialog(
//             //           title: Text('Scan QR'),
//             //           content: SizedBox(
//             //             width: double.infinity,
//             //             height: 300,
//             //             child: QRView(
//             //               key: qrKey,
//             //               onQRViewCreated: _onQRViewCreated,
//             //             ),
//             //           ),
//             //           actions: [
//             //             TextButton(
//             //               child: Text('Close'),
//             //               onPressed: () {
//             //                 Navigator.of(context).pop();
//             //               },
//             //             ),
//             //           ],
//             //         );
//             //       },
//             //     );
//             //   },
//             //   child: CircleAvatar(
//             //     radius: 50,
//             //     backgroundColor: Colors.teal,
//             //     child: Icon(
//             //       Icons.camera_alt,
//             //       size: 50,
//             //       color: Colors.white,
//             //     ),
//             //   ),
//             // ),

//             // SizedBox(height: 16),
//             Container(
//               width: 300,
//               height: 60,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: const Color(0xFF02B7C8))),
//               child: Center(
//                 child: TextFormField(
//                   controller: tagcon,
//                   decoration: InputDecoration(
//                       hintText: 'Search by Tag',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding:
//                           EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
//                       suffixIcon: tagcon.text.isEmpty
//                           ? IconButton(
//                               icon: Icon(Icons.search),
//                               onPressed: () async {
//                                 records = await apiHandler
//                                     .getWeightByTag(tagcon.text);
//                                 setState(() {});
//                               },
//                             )
//                           : IconButton(
//                               icon: Icon(Icons.clear),
//                               onPressed: () async {
//                                 // Clear the search field and reset the list
//                                 records = await apiHandler.getAllWeights();
//                                 tagcon.clear();
//                                 setState(() {});
//                               },
//                             )),
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 30,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: records.length,
//               itemBuilder: (context, index) {
//                 final record = records[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 3,
//                     child: ListTile(
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Tag: ${record.tag}'),
//                           Text('Weight: ${record.weight} KG'),
//                         ],
//                       ),
//                       subtitle: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 35, bottom: 10),
//                                 child: Text(
//                                   'Date: ${record.date}',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 35, bottom: 10),
//                                 child: Text(
//                                   'Height: ${record.height} CM',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           const Color(0xFF039BA8)),
//                                   foregroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   fixedSize: MaterialStateProperty.all<Size>(
//                                       Size(90, 15)),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text('Edit'),
//                               ),
//                               ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           const Color(0xFF039BA8)),
//                                   foregroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                           Colors.white),
//                                   fixedSize: MaterialStateProperty.all<Size>(
//                                       Size(90, 15)),
//                                 ),
//                                 onPressed: () {},
//                                 child: Text('Delete'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//------------------Tag search and Start Date end date functionality is added in it

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/weightClass.dart';
import 'package:cattlefarming/Screens/addWeightScreen.dart';
import 'package:flutter/material.dart';

class ViewWeightScreen extends StatefulWidget {
  const ViewWeightScreen({super.key});

  @override
  State<ViewWeightScreen> createState() => _ViewWeightScreenState();
}

class _ViewWeightScreenState extends State<ViewWeightScreen> {
  ApiHandler apiHandler = ApiHandler();
  TextEditingController tagcon = TextEditingController();
  TextEditingController startDatecon = TextEditingController();
  TextEditingController endDatecon = TextEditingController();
  List<WeightRecord> records = [];
  List<WeightRecord> filteredRecords = [];

  @override
  void initState() {
    super.initState();
    fetchWeights(); // Fetch weights initially
    tagcon.addListener(() {
      // Call the filter function whenever text changes
      filterWeightRecords();
    });
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2050),
    );
    if (datePicker != null) {
      setState(() {
        controller.text = datePicker.toString().split(' ')[0];
      });
      filterWeightRecords();
    }
  }

  Future<void> fetchWeights() async {
    records = await apiHandler.getAllWeights();
    filteredRecords = records;
    setState(() {}); // Update the UI after fetching weights
  }

  void filterWeightRecords() {
    String tag = tagcon.text.toLowerCase();
    DateTime? startDate =
        startDatecon.text.isNotEmpty ? DateTime.parse(startDatecon.text) : null;
    DateTime? endDate =
        endDatecon.text.isNotEmpty ? DateTime.parse(endDatecon.text) : null;

    setState(() {
      filteredRecords = records.where((record) {
        bool matchesTag = record.tag.toLowerCase().contains(tag);
        bool matchesStartDate = startDate != null
            ? DateTime.parse(record.date)
                .isAfter(startDate.subtract(Duration(days: 1)))
            : true;
        bool matchesEndDate = endDate != null
            ? DateTime.parse(record.date)
                .isBefore(endDate.add(Duration(days: 1)))
            : true;
        return matchesTag && matchesStartDate && matchesEndDate;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final hintColor = Theme.of(context).inputDecorationTheme.hintStyle?.color;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Metrics Record",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newRecord = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WeightScreen(),
            ),
          );

          // Check if a new record was returned
          if (newRecord != null && newRecord is WeightRecord) {
            setState(() {
              records.add(newRecord);
              filterWeightRecords(); // Reapply filters
            });
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: const Color(0xFF02B7C8))),
              child: Center(
                child: TextFormField(
                  controller: tagcon,
                  decoration: InputDecoration(
                      hintText: 'Search by Tag',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                      suffixIcon: tagcon.text.isEmpty
                          ? IconButton(
                              icon: Icon(Icons.search),
                              onPressed: filterWeightRecords,
                            )
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                tagcon.clear();
                                filterWeightRecords();
                              },
                            )),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFF02B7C8))),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => selectDate(context, startDatecon),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: startDatecon,
                          decoration: InputDecoration(
                              hintText: 'Start Date',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: hintColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  width: 160,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFF02B7C8))),
                  child: Center(
                    child: GestureDetector(
                      onTap: () => selectDate(context, endDatecon),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: endDatecon,
                          decoration: InputDecoration(
                              hintText: 'End Date',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              suffixIcon: Icon(
                                Icons.calendar_month_outlined,
                                color: hintColor,
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredRecords.length,
              itemBuilder: (context, index) {
                final record = filteredRecords[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tag: ${record.tag}'),
                          Text('Weight: ${record.weight} KG'),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, bottom: 10),
                                child: Text(
                                  'Date: ${record.date}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 35, bottom: 10),
                                child: Text(
                                  'Height: ${record.height} CM',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF039BA8)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(90, 15)),
                                ),
                                onPressed: () {
                                  // Edit action here
                                },
                                child: Text('Edit'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xFF039BA8)),
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(90, 15)),
                                ),
                                onPressed: () {
                                  // Delete action here
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          ),
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
    );
  }
}
