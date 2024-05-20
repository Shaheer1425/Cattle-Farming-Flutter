// view_cattle_screen.dart
import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/cattleInfClass.dart';
import 'package:cattlefarming/Models/viewcattleClass.dart';
import 'package:cattlefarming/Screens/addCattleScreen.dart';

import 'package:cattlefarming/Screens/showCattleInfoScreen.dart';

import 'package:flutter/material.dart';

class ViewCattleScreen extends StatefulWidget {
  //final int farmId;
  const ViewCattleScreen({
    super.key,
  });

  @override
  State<ViewCattleScreen> createState() => _ViewCattleScreenState();
}

class _ViewCattleScreenState extends State<ViewCattleScreen> {
  TextEditingController tagcon = TextEditingController();
  List<String> vaccineStatusList = ['Vaccinated', 'Not Vaccinated'];
  List<String> cattleTypeList = ['Cow', 'Buffalo', 'Goat'];
  List<String> cattleAvailableList = ['Alive', 'Dead', 'Sold'];

  String? availableCattleSelected;
  String? vaccineStatusSelected;
  String? typeSelected;
  List<viewCattleRecord> cattleList = [];
  int Id = 1;
  @override
  void initState() {
    super.initState();
    // Id = widget.farmId;
    _fetchCattleData(); // Call fetchCattleData() in initState
  }

  // @override
  // void didUpdateWidget(ViewCattleScreen oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.farmId != oldWidget.farmId) {
  //     Id = widget.farmId;
  //     _fetchCattleData(); // Call fetchCattleData() whenever farmId changes
  //   }
  // }

  Future<void> _fetchCattleData() async {
    try {
      final List<viewCattleRecord> fetchedCattle =
          await ApiHandler.fetchCattlewithFarm(
        status: availableCattleSelected,
        type: typeSelected,
        isVaccinate: vaccineStatusSelected,
        id: Id,
      );
      setState(() {
        cattleList = fetchedCattle;
      });
    } catch (error) {
      // Handle error
      print(error);
    }
  }
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchCattleData();
  //   Id = widget.farmId;
  //   //didUpdateWidget();
  // }

  //int temId = 1;

  // @override
  // void didUpdateWidget(ViewCattleScreen oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (widget.farmId != oldWidget.farmId) {
  //     Id = widget.farmId;
  //     _fetchCattleData(); // Call fetchCattleData() whenever farmId changes
  //   }
  // }

  // Future<void> _fetchCattleData() async {
  //   try {
  //     final List<viewCattleRecord> fetchedCattle =
  //         await ApiHandler.fetchCattlewithFarm(
  //       status: availableCattleSelected,
  //       type: typeSelected,
  //       isVaccinate: vaccineStatusSelected,
  //       id: Id,
  //     );
  //     setState(() {
  //       cattleList = fetchedCattle;
  //     });
  //   } catch (error) {
  //     // Handle error
  //     print(error);
  //   }
  // }

  final List<CattleInfoRecord> cattleInfoList = [
    CattleInfoRecord(tag: 'B10F', weight: '200'),
    CattleInfoRecord(tag: 'C12F', weight: '200'),
    // Add more cattle records as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "View Cattle",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddCattle()));
        },
        child: Icon(Icons.add, color: Colors.white),
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
            // SizedBox(
            //   height: 5,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 18),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDropdown(
                      "Alive",
                      cattleAvailableList,
                      availableCattleSelected,
                      (newValue) {
                        setState(() {
                          availableCattleSelected = newValue;
                          _fetchCattleData();
                        });
                      },
                    ),
                    _buildDropdown(
                      "Select Type",
                      cattleTypeList,
                      typeSelected,
                      (newValue) {
                        setState(() {
                          typeSelected = newValue;
                          _fetchCattleData();
                        });
                      },
                    ),
                    _buildDropdown(
                      "Select Vaccine Status",
                      vaccineStatusList,
                      vaccineStatusSelected,
                      (newValue) {
                        setState(() {
                          vaccineStatusSelected = newValue;
                          _fetchCattleData();
                        });
                      },
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
                        // record.tag == cattleInfoList.elementAt(index);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CattleInfoScreen(cTag: cattleList[index].tag)));
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
                              child: Text(record.vaccineStatus),
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
                                Text('Weight : ${record.weight}',
                                    style: TextStyle(fontSize: 16)),
                                Text('Cattle Type: ${record.cattleType}',
                                    style: TextStyle(fontSize: 16)),
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

  Widget _buildDropdown(
    String hint,
    List<String> items,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              value: selectedValue,
              underline: SizedBox(),
              hint: Text(hint),
              items: items.map((String option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: onChanged,
              isExpanded: true,
            ),
          ),
        ),
      ),
    );
  }
}








//------------------Original code

// import 'package:cattlefarming/Models/milkClass.dart';
// import 'package:cattlefarming/Models/temperatureClass.dart';
// import 'package:cattlefarming/Models/viewcattleClass.dart';
// import 'package:cattlefarming/Screens/addCattleScreen.dart';
// import 'package:cattlefarming/Screens/addMilkScreen.dart';
// import 'package:cattlefarming/Screens/showCattleInfoScreen.dart';
// import 'package:cattlefarming/Screens/temperatureScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// class ViewCattleScreen extends StatefulWidget {
//   const ViewCattleScreen({super.key});

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
//         vaccineStatus: 'Vaccinated',
//         weight: '250 KG',
//         cattleType: 'Cow'),
//     viewCattleRecord(
//         tag: 'B12M',
//         vaccineStatus: 'Not Vaccinated',
//         weight: '299 KG',
//         cattleType: 'Buffalo'),
//     viewCattleRecord(
//         tag: 'G12F',
//         vaccineStatus: 'Vaccinated',
//         weight: '50 KG',
//         cattleType: 'Goat'),
//     viewCattleRecord(
//         tag: 'C12F',
//         vaccineStatus: 'Vaccinated',
//         weight: '300 KG',
//         cattleType: 'Cow'),
//   ];

//   String? availableCattleSelected;
//   String? vaccineStatusSelected;
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
//               .push(MaterialPageRoute(builder: (context) => AddCattle()));
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
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//                         child: Container(
//                           width: 200,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20.0),
//                             border: Border.all(color: const Color(0xFF02B7C8)),
//                           ),
//                           child: Center(
//                             child: SizedBox(
//                               width: 140,
//                               child: DropdownButton(
//                                 value: availableCattleSelected,
//                                 underline: SizedBox(),
//                                 hint: Text("Alive"),
//                                 items: CattleAvailableList.map((String option) {
//                                   return DropdownMenuItem(
//                                     value: option,
//                                     child: Text(option),
//                                   );
//                                 }).toList(),
//                                 onChanged: (newSelectedVal) {
//                                   setState(() {
//                                     this.availableCattleSelected =
//                                         newSelectedVal!;
//                                   });
//                                 },
//                                 isExpanded: true,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Container(
//                           width: 200,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20.0),
//                             border: Border.all(color: const Color(0xFF02B7C8)),
//                           ),
//                           child: Center(
//                             child: SizedBox(
//                               width: 140,
//                               child: DropdownButton(
//                                 value: typeSelected,
//                                 underline: SizedBox(),
//                                 hint: Text("Select Type"),
//                                 items: cattleTypeList.map((String option) {
//                                   return DropdownMenuItem(
//                                     value: option,
//                                     child: Text(option),
//                                   );
//                                 }).toList(),
//                                 onChanged: (newSelectedVal) {
//                                   setState(() {
//                                     this.typeSelected = newSelectedVal!;
//                                   });
//                                 },
//                                 isExpanded: true,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Padding(
//                         padding: const EdgeInsets.only(right: 8.0),
//                         child: Container(
//                           width: 230,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20.0),
//                             border: Border.all(color: const Color(0xFF02B7C8)),
//                           ),
//                           child: Center(
//                             child: SizedBox(
//                               width: 190,
//                               child: DropdownButton(
//                                 value: vaccineStatusSelected,
//                                 underline: SizedBox(),
//                                 hint: Text("Select Vaccine Status"),
//                                 items: VaccineStatusList.map((String option) {
//                                   return DropdownMenuItem(
//                                     value: option,
//                                     child: Text(option),
//                                   );
//                                 }).toList(),
//                                 onChanged: (newSelectedVal) {
//                                   setState(() {
//                                     this.vaccineStatusSelected =
//                                         newSelectedVal!;
//                                   });
//                                 },
//                                 isExpanded: true,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: cattleList.length,
//               itemBuilder: (context, index) {
//                 final record = cattleList[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 3,
//                     child: ListTile(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => CattleInfoScreen()));
//                       },
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Tag: ${record.tag}'),
//                           Container(
//                             width: 135,
//                             height: 25,
//                             decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(10)),
//                               color: record.vaccineStatus == 'Vaccinated'
//                                   ? Colors.green
//                                   : Colors.red,
//                             ),
//                             child: Center(
//                               child: Text(
//                                 record.vaccineStatus,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       subtitle: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 35, bottom: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Weight : ${record.weight}',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 Text(
//                                   'Cattle Type: ${record.cattleType}',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ],
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
