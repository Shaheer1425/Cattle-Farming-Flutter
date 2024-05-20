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

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/weightClass.dart';
import 'package:cattlefarming/Screens/weightScreen.dart';
import 'package:flutter/material.dart';

class ViewWeightScreen extends StatefulWidget {
  const ViewWeightScreen({super.key});

  @override
  State<ViewWeightScreen> createState() => _ViewWeightScreenState();
}

class _ViewWeightScreenState extends State<ViewWeightScreen> {
  ApiHandler apiHandler = ApiHandler();
  TextEditingController tagcon = TextEditingController();
  List<WeightRecord> records = [];

  @override
  void initState() {
    super.initState();
    // datecon.text = DateTime.now().toString().split(' ')[0]; // Set default date
    fetchWeights(); // Fetch weights initially
  }

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime? datePicker = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1947),
  //     lastDate: DateTime(2050),
  //   );
  //   if (datePicker != null) {
  //     setState(() {
  //       datecon.text = datePicker.toString().split(' ')[0];
  //     });
  //     fetchWeights(); // Fetch weights for the selected date
  //   }
  // }

  Future<void> fetchWeights() async {
    if (tagcon.text.isNotEmpty) {
      // records = await apiHandler.getWeightByDate(tagcon.text);
    } else {
      records = await apiHandler.getAllWeights();
    }
    setState(() {}); // Update the UI after fetching weights
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Weight Record",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => WeightScreen()));

          final newRecord = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WeightScreen(),
            ),
          );

          // Check if a new record was returned
          if (newRecord != null && newRecord is WeightRecord) {
            setState(() {
              records.add(newRecord);
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
                              onPressed: () async {
                                // records = await apiHandler
                                //     .getCustomerByName(namecon.text);
                                setState(() {});
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () async {
                                // Clear the search field and reset the list
                                // records = await apiHandler.getAllCustomers();
                                // namecon.clear();
                                // setState(() {});
                                // search('');
                              },
                            )),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 25.0, bottom: 18),
            //   child: Container(
            //     width: 300,
            //     height: 60,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20.0),
            //         border: Border.all(color: const Color(0xFF02B7C8))),
            //     child: Center(
            //       child: GestureDetector(
            //        // onTap: () => selectDate(context),
            //         child: AbsorbPointer(
            //           child: TextFormField(
            //             controller: tagcon,
            //             decoration: InputDecoration(
            //               hintText: 'Select Date',
            //               border: InputBorder.none,
            //               contentPadding: EdgeInsets.symmetric(
            //                   horizontal: 30.0, vertical: 10.0),
            //               suffixIcon: Icon(
            //                 Icons.calendar_month_outlined,
            //                 color: Theme.of(context)
            //                     .inputDecorationTheme
            //                     .hintStyle
            //                     ?.color,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: records.length,
              itemBuilder: (context, index) {
                final record = records[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tag: ${record.tag}'),
                          Text('Weight: ${record.weight}'),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 10),
                            child: Text(
                              'Date: ${record.date}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
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
                                onPressed: () {},
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
                                onPressed: () {},
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
