// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/global.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// class AddMilkScreen extends StatefulWidget {
//   const AddMilkScreen({super.key});

//   @override
//   State<AddMilkScreen> createState() => _AddMilkScreenState();
// }

// class _AddMilkScreenState extends State<AddMilkScreen> {
//   TextEditingController tagcon = TextEditingController();
//   TextEditingController datecon = TextEditingController();
//   TextEditingController milkproducedcon = TextEditingController();
//   TextEditingController milkUsedcon = TextEditingController();
//   TextEditingController notecon = TextEditingController();
//   String? selectedTime = "Morning";
//   int farmId = 1;
//   @override
//   void initState() {
//     super.initState();
//     // farmId = FarmManager.getSelectedFarmId();
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
//             "Add Milk",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Tag",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: tagcon,
//                     decoration: const InputDecoration(
//                       hintText: 'C14F',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Date",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
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
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//                   Radio(
//                       value: "Morning",
//                       groupValue: selectedTime,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedTime = value as String;
//                         });
//                       }),
//                   Text(
//                     "Morning",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Radio(
//                       value: "Evening",
//                       groupValue: selectedTime,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedTime = value as String;
//                         });
//                       }),
//                   Text(
//                     "Evening",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Total Milk Produced",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: milkproducedcon,
//                     decoration: const InputDecoration(
//                       hintText: '10 KG',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Total Used/Calve",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: milkUsedcon,
//                     decoration: const InputDecoration(
//                       hintText: '2 KG',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Milk Note",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: notecon,
//                     decoration: const InputDecoration(
//                       hintText: 'Write Some Note',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Center(
//                   child: SizedBox(
//                       width: 200,
//                       height: 60,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(0xFF039BA8),
//                         )),
//                         onPressed: () async {
//                           if (tagcon.text.isEmpty ||
//                               datecon.text.isEmpty ||
//                               milkproducedcon.text.isEmpty ||
//                               milkUsedcon.text.isEmpty) {
//                             // Display a snackbar if any of the fields are empty
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Please fill in all fields'),
//                               ),
//                             );
//                             return;
//                           }

//                           // Create a Map with the input data
//                           Map<String, dynamic> milkData = {
//                             'CattleTag': tagcon.text,
//                             'Date': datecon.text,
//                             'TotalMilk': milkproducedcon.text,
//                             'Time': selectedTime,
//                             'UsedMilk': milkUsedcon.text,
//                             'Note': notecon.text,
//                             'FarmId': farmId
//                           };

//                           try {
//                             // Call the API to add the cattle
//                             String response =
//                                 await ApiHandler().addMilk(milkData);
//                             // Display a success message
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text(response),
//                               ),
//                             );
//                           } catch (e) {
//                             // Display an error message
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(
//                                 content: Text('Failed to add Milk. Error: $e'),
//                               ),
//                             );
//                           }
//                         },
//                         child: const Text(
//                           "Add Now",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                           ),
//                         ),
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
