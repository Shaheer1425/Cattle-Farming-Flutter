import 'package:cattlefarming/Models/milkClass.dart';
import 'package:cattlefarming/Models/temperatureClass.dart';
import 'package:cattlefarming/Models/viewcattleClass.dart';
import 'package:cattlefarming/Screens/addCattleScreen.dart';
import 'package:cattlefarming/Screens/addMilkScreen.dart';
import 'package:cattlefarming/Screens/showCattleInfoScreen.dart';
import 'package:cattlefarming/Screens/temperatureScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ViewCattleScreen extends StatefulWidget {
  const ViewCattleScreen({super.key});

  @override
  State<ViewCattleScreen> createState() => _ViewCattleScreenState();
}

class _ViewCattleScreenState extends State<ViewCattleScreen> {
  List<String> VaccineStatusList = [
    'Vaccinated',
    'Not Vaccinated',
  ];
  List<String> cattleTypeList = [
    'Cow',
    'Buffalo',
    'Goat',
  ];

  List<String> CattleAvailableList = [
    'Alive',
    'Dead',
    'Sold',
  ];

  final List<viewCattleRecord> cattleList = [
    viewCattleRecord(
        tag: 'C14F',
        vaccineStatus: 'Vaccinated',
        weight: '250 KG',
        gender: 'Female'),
    viewCattleRecord(
        tag: 'B12M',
        vaccineStatus: 'Not Vaccinated',
        weight: '299 KG',
        gender: 'Male'),
    viewCattleRecord(
        tag: 'G12F',
        vaccineStatus: 'Vaccinated',
        weight: '50 KG',
        gender: 'Female'),
    viewCattleRecord(
        tag: 'C12F',
        vaccineStatus: 'Vaccinated',
        weight: '300 KG',
        gender: 'Female'),
  ];

  String? availableCattleSelected;
  String? vaccineStatusSelected;
  String? typeSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "View Cattle",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddCattle()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 140,
                              child: DropdownButton(
                                value: availableCattleSelected,
                                underline: SizedBox(),
                                hint: Text("Alive"),
                                items: CattleAvailableList.map((String option) {
                                  return DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (newSelectedVal) {
                                  setState(() {
                                    this.availableCattleSelected =
                                        newSelectedVal!;
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 140,
                              child: DropdownButton(
                                value: typeSelected,
                                underline: SizedBox(),
                                hint: Text("Select Type"),
                                items: cattleTypeList.map((String option) {
                                  return DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (newSelectedVal) {
                                  setState(() {
                                    this.typeSelected = newSelectedVal!;
                                  });
                                },
                                isExpanded: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 230,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 190,
                              child: DropdownButton(
                                value: vaccineStatusSelected,
                                underline: SizedBox(),
                                hint: Text("Select Vaccine Status"),
                                items: VaccineStatusList.map((String option) {
                                  return DropdownMenuItem(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (newSelectedVal) {
                                  setState(() {
                                    this.vaccineStatusSelected =
                                        newSelectedVal!;
                                  });
                                },
                                isExpanded: true,
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
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cattleList.length,
              itemBuilder: (context, index) {
                final record = cattleList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CattleInfoScreen()));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tag: ${record.tag}'),
                          Container(
                            width: 135,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: record.vaccineStatus == 'Vaccinated'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            child: Center(
                              child: Text(
                                record.vaccineStatus,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Weight : ${record.weight}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Gender : ${record.gender}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
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

//-------------------------------------------------ChatGPT Code

// import 'package:cattlefarming/Models/milkClass.dart';
// import 'package:cattlefarming/Models/temperatureClass.dart';
// import 'package:cattlefarming/Models/viewcattleClass.dart';
// import 'package:cattlefarming/Screens/addMilkScreen.dart';
// import 'package:cattlefarming/Screens/temperatureScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ViewCattleScreen extends StatefulWidget {
//   const ViewCattleScreen({Key? key}) : super(key: key);

//   @override
//   State<ViewCattleScreen> createState() => _ViewCattleScreenState();
// }

// class _ViewCattleScreenState extends State<ViewCattleScreen> {
//   List<String> VaccineStatusList = [
//     'Vaccinated',
//     'Not Vaccinated',
//   ];
//   List<String> cattleTypeList = [
//     'Cow',
//     'Buffalo',
//     'Goat',
//   ];

//   List<String> CattleAvailableList = [
//     'Alive',
//     'Dead',
//     'Sold',
//   ];

//   final List<viewCattleRecord> cattleList = [
//     viewCattleRecord(
//         tag: 'C14F',
//         vaccineStatus: 'Veccinated',
//         weight: '250 KG',
//         gender: 'Female'),
//     viewCattleRecord(
//         tag: 'B12M',
//         vaccineStatus: 'Not Veccinated',
//         weight: '299 KG',
//         gender: 'Male'),
//   ];

//   String? availableCattleSelected;
//   String? breedSelected;
//   String? typeSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "View Cattle",
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
//               .push(MaterialPageRoute(builder: (context) => AddMilkScreen()));
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
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: SizedBox(
//                           width: 240,
//                           child: DropdownButton<String>(
//                             value: typeSelected,
//                             underline: SizedBox(),
//                             hint: Text("All"),
//                             items: [
//                               DropdownMenuItem<String>(
//                                 value: "All",
//                                 child: Text("All"),
//                               ),
//                               ...CattleAvailableList.map((String e) {
//                                 return DropdownMenuItem<String>(
//                                   value: e,
//                                   child: Text(e),
//                                 );
//                               }),
//                             ],
//                             onChanged: (newSelectedVal) {
//                               setState(() {
//                                 this.typeSelected = newSelectedVal!;
//                               });
//                             },
//                             isExpanded: true,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: SizedBox(
//                           width: 240,
//                           child: DropdownButton<String>(
//                             value: typeSelected,
//                             underline: SizedBox(),
//                             hint: Text("Cow"),
//                             items: [
//                               DropdownMenuItem<String>(
//                                 value: "Select Type",
//                                 child: Text("Select Type"),
//                               ),
//                               ...cattleTypeList.map((String e) {
//                                 return DropdownMenuItem<String>(
//                                   value: e,
//                                   child: Text(e),
//                                 );
//                               }),
//                             ],
//                             onChanged: (newSelectedVal) {
//                               setState(() {
//                                 this.typeSelected = newSelectedVal!;
//                               });
//                             },
//                             isExpanded: true,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 20),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: SizedBox(
//                           width: 240,
//                           child: DropdownButton<String>(
//                             value: typeSelected,
//                             underline: SizedBox(),
//                             hint: Text("Cow"),
//                             items: [
//                               DropdownMenuItem<String>(
//                                 value: "Select Veccine Status",
//                                 child: Text("Select Veccine Status"),
//                               ),
//                               ...VaccineStatusList.map((String e) {
//                                 return DropdownMenuItem<String>(
//                                   value: e,
//                                   child: Text(e),
//                                 );
//                               }),
//                             ],
//                             onChanged: (newSelectedVal) {
//                               setState(() {
//                                 this.typeSelected = newSelectedVal!;
//                               });
//                             },
//                             isExpanded: true,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   for (final record in cattleList)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         elevation: 3,
//                         child: ListTile(
//                           title: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text('Tag: ${record.tag}'),
//                               Text('Veccine: ${record.vaccineStatus}'),
//                             ],
//                           ),
//                           subtitle: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(top: 35, bottom: 10),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Weight : ${record.weight}',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     Text(
//                                       'Gender : ${record.gender}',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   ElevatedButton(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               const Color(0xFF039BA8)),
//                                       foregroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               Colors.white),
//                                       fixedSize:
//                                           MaterialStateProperty.all<Size>(
//                                               Size(90, 15)),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text('Edit'),
//                                   ),
//                                   ElevatedButton(
//                                     style: ButtonStyle(
//                                       backgroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               const Color(0xFF039BA8)),
//                                       foregroundColor:
//                                           MaterialStateProperty.all<Color>(
//                                               Colors.white),
//                                       fixedSize:
//                                           MaterialStateProperty.all<Size>(
//                                               Size(90, 15)),
//                                     ),
//                                     onPressed: () {},
//                                     child: Text('Delete'),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
