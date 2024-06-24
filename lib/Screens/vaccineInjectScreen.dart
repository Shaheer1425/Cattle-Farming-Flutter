// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// class VaccineInjectScreen extends StatefulWidget {
//   //final int totalDoses;

//   const VaccineInjectScreen({super.key});

//   @override
//   State<VaccineInjectScreen> createState() => _VaccineInjectScreenState();
// }

// class _VaccineInjectScreenState extends State<VaccineInjectScreen> {
//   TextEditingController tagcon = TextEditingController();
//   TextEditingController datecon = TextEditingController();
//   TextEditingController milkproducedcon = TextEditingController();
//   TextEditingController milkUsedcon = TextEditingController();
//   TextEditingController notecon = TextEditingController();

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

//   List<String> vaccineItem = [
//     'Bovine Viral Diarrhea',
//     'Leptospirosis',
//     'Clostridial',
//     'Infectious Bovine Rhinotracheitis',
//   ];

//   String? vaccineSelected;

//   // List to track which buttons have been clicked
//   late List<bool> buttonClicked;
//   final int totalDoses = 2;
//   @override
//   void initState() {
//     super.initState();
//     // Initialize buttonClicked list with false values
//     buttonClicked = List.filled(totalDoses, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Inject Vaccine",
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
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Vaccine Name",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: const Color(0xFF02B7C8)),
//                 ),
//                 child: Center(
//                   child: SizedBox(
//                     width: 240,
//                     child: DropdownButton<String>(
//                       value: vaccineSelected,
//                       underline: SizedBox(),
//                       hint: Text("Bovine Viral Diarrhea"),
//                       items: [
//                         DropdownMenuItem<String>(
//                           value: 'Select Type',
//                           child: Text("Select Type"),
//                         ),
//                         ...vaccineItem.map((String e) {
//                           return DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }),
//                       ],
//                       onChanged: (newSelectedVal) {
//                         setState(() {
//                           this.vaccineSelected = newSelectedVal!;
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Click on the dose buttons to mark them as injected:',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // Generate buttons based on the total number of doses
//                     Container(
//                       width: 150,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: totalDoses,
//                         itemBuilder: (context, index) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: ElevatedButton(
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                   buttonClicked[index]
//                                       ? Colors.green
//                                       : Colors.grey,
//                                 ),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                     borderRadius: BorderRadius
//                                         .zero, // Set the border radius to 0 for square corners
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   buttonClicked[index] = !buttonClicked[
//                                       index]; // Toggle the button state
//                                 });
//                               },
//                               child: Text(
//                                 'Dose ${index + 1}',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     // Container(
//                     //   width: 150,
//                     //   child: ListView.builder(
//                     //     shrinkWrap: true,
//                     //     physics: NeverScrollableScrollPhysics(),
//                     //     itemCount: widget.totalDoses,
//                     //     itemBuilder: (context, index) {
//                     //       return Padding(
//                     //         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     //         child: ElevatedButton(
//                     //           style: ButtonStyle(
//                     //             backgroundColor:
//                     //                 MaterialStateProperty.all<Color>(
//                     //              buttonClicked[index]
//                     //                   ? Colors.green
//                     //                   : Colors.grey,
//                     //             ),
//                     //             shape: MaterialStateProperty.all<
//                     //                 RoundedRectangleBorder>(
//                     //               RoundedRectangleBorder(
//                     //                 borderRadius: BorderRadius
//                     //                     .zero, // Set the border radius to 0 for square corners
//                     //               ),
//                     //             ),
//                     //           ),
//                     //           onPressed: () {
//                     //             // Change the color of the button when clicked
//                     //             setState(() {
//                     //               buttonClicked[index] = true;
//                     //             });
//                     //           },
//                     //           child: Text(
//                     //             'Dose ${index + 1}',
//                     //             style: TextStyle(
//                     //                 color: Colors.white, fontSize: 18),
//                     //           ),
//                     //         ),
//                     //       );
//                     //     },
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),

//               /* Text(
//                 'Click on the dose buttons to mark them as injected:',
//                 style: TextStyle(fontSize: 16),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     // Generate buttons based on the total number of doses
//                     Container(
//                       width: 150,
//                       child: ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount:
//                             widget.totalDoses + 1, // Include one extra button
//                         itemBuilder: (context, index) {
//                           if (index < widget.totalDoses) {
//                             // Dose button
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 8.0),
//                               child: ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                     buttonClicked[index]
//                                         ? Colors.green
//                                         : Colors.grey,
//                                   ),
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius
//                                           .zero, // Set the border radius to 0 for square corners
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   // Change the color of the button when clicked
//                                   setState(() {
//                                     buttonClicked[index] = true;
//                                   });
//                                 },
//                                 child: Text(
//                                   'Dose ${index + 1}',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 18),
//                                 ),
//                               ),
//                             );
//                           } else {
//                             // Course Complete button
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 8.0),
//                               child: ElevatedButton(
//                                 style: ButtonStyle(
//                                   backgroundColor:
//                                       MaterialStateProperty.all<Color>(
//                                     Colors.blue,
//                                   ),
//                                   shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                       borderRadius: BorderRadius
//                                           .zero, // Set the border radius to 0 for square corners
//                                     ),
//                                   ),
//                                 ),
//                                 onPressed: () {
//                                   // Handle course complete action
//                                   // For instance, show a message or navigate to another screen
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       title: Text("Course Complete"),
//                                       content: Text(
//                                           "You have completed the vaccine course!"),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: Text("OK"),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                                 child: Text(
//                                   'Course Complete',
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 18),
//                                 ),
//                               ),
//                             );
//                           }
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),*/
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
//                         onPressed: () {},
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

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/injectVaccineClass.dart';
import 'package:cattlefarming/Models/vaccineStockClass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class VaccineInjectScreen extends StatefulWidget {
  const VaccineInjectScreen({super.key});

  @override
  State<VaccineInjectScreen> createState() => _VaccineInjectScreenState();
}

class _VaccineInjectScreenState extends State<VaccineInjectScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  TextEditingController tagcon = TextEditingController();
  TextEditingController datecon = TextEditingController(text: '2023-11-14');
  int? vaccineSelectedId;
  Map<int, List<bool>> _doseInjected = {};
  List<Vaccination> vaccinationsList = [];
  ApiHandler apiHandler = ApiHandler();
  int farmId = 1;

  String? tag;

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        tag = scanData.code;
        print("-----------------------------------------ye tag hy$tag");
        tagcon.text = tag!;

        handleTagSubmit(tag!);
        controller.pauseCamera(); // Pause camera after successful scan
        Navigator.of(context).pop(); // Close the QR scanner dialog if any
      });
    });
  }

  @override
  void dispose() {
    tagcon.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      vaccinationsList = await apiHandler.getAllVaccinationsStock();

      // Initialize _doseInjected map with fetched data
      for (var vaccination in vaccinationsList) {
        _doseInjected[vaccination.id!] =
            List<bool>.filled(vaccination.totalDose ?? 0, false);
      }

      setState(() {});

      print('Fetched Vaccine Names successfully: '); // Debug print
    } catch (e) {
      print('Failed to load vaccine names: $e');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2050),
    );
    if (datePicker != null) {
      setState(() {
        datecon.text = datePicker.toString().split(' ')[0];
      });
    }
  }

  void handleDoseButtonClick(int index) {
    setState(() {
      _doseInjected[vaccineSelectedId!]![index] =
          !_doseInjected[vaccineSelectedId!]![index];
    });
  }

  void handleTagSubmit(String value) async {
    try {
      // Call your API to fetch last injected vaccine info based on the cattle tag
      var injectedVaccine =
          await apiHandler.getLastInjectedVaccineForTag(value);

      if (injectedVaccine != null) {
        setState(() {
          // Update selected vaccine ID and injected doses based on fetched data
          vaccineSelectedId = injectedVaccine.vaccinationId;
          _doseInjected[vaccineSelectedId!] = List<bool>.generate(
            _doseInjected[vaccineSelectedId!]!.length,
            (index) => index < injectedVaccine.doseNo!,
          );
        });
      } else {
        // Cattle tag not found in injected vaccines, do nothing (let user select manually)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cattle tag not found in injected vaccines')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$e')),
      );
    }
  }

  void SaveInjectVaccine() async {
    try {
      final int vaccineId = vaccineSelectedId!;
      final injectedDoses =
          _doseInjected[vaccineId]!.where((dose) => dose).length;
      var vaccine = InjectedVaccination(
          date: datecon.text,
          vaccinationId: vaccineId,
          cattleTag: tagcon.text,
          doseNo: injectedDoses,
          farmId: farmId);
      final responseMessage = await apiHandler.saveInjectedVaccine(vaccine);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save Inject Vaccine Data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Inject Vaccine",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Tag",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: const Color(0xFF02B7C8)),
                ),
                child: Center(
                  child: TextFormField(
                    controller: tagcon,
                    decoration: const InputDecoration(
                      hintText: 'C14F',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    onFieldSubmitted: handleTagSubmit,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Date",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
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
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Vaccine Name",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: const Color(0xFF02B7C8)),
                ),
                child: Center(
                  child: SizedBox(
                    width: 240,
                    child: DropdownButton<int>(
                      value: vaccineSelectedId,
                      underline: SizedBox(),
                      hint: Text("Select Vaccine"),
                      items: [
                        ...vaccinationsList.map((vaccination) {
                          return DropdownMenuItem<int>(
                            value: vaccination.id!,
                            child: Text(vaccination.type),
                          );
                        }),
                      ],
                      onChanged: (newSelectedVal) {
                        setState(() {
                          vaccineSelectedId = newSelectedVal!;
                          if (!_doseInjected.containsKey(newSelectedVal)) {
                            _doseInjected[newSelectedVal] = List<bool>.filled(
                                vaccinationsList
                                        .firstWhere(
                                            (v) => v.id == newSelectedVal)
                                        .totalDose ??
                                    0,
                                false);
                          }
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Click on the dose buttons to mark them as injected:',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: vaccineSelectedId != null
                            ? vaccinationsList
                                .firstWhere((v) => v.id == vaccineSelectedId!)
                                .totalDose!
                            : 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  _doseInjected[vaccineSelectedId]?[index] ==
                                          true
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                              ),
                              onPressed: () => handleDoseButtonClick(index),
                              child: Text(
                                'Dose ${index + 1}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF039BA8)),
                      ),
                      onPressed: SaveInjectVaccine,
                      child: const Text(
                        "Add Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
