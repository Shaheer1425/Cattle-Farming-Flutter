import 'package:cattlefarming/Models/cattleAvgMilkClass.dart';
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

class ViewCattleAvgMilkScreen extends StatefulWidget {
  const ViewCattleAvgMilkScreen({super.key});

  @override
  State<ViewCattleAvgMilkScreen> createState() =>
      _ViewCattleAvgMilkScreenState();
}

class _ViewCattleAvgMilkScreenState extends State<ViewCattleAvgMilkScreen> {
  final List<cattleAvgMilkRecord> cattleList = [
    cattleAvgMilkRecord(tag: 'C14F', averageMilk: '10 KG', cattletype: 'Cow'),
    cattleAvgMilkRecord(
        tag: 'B12F', averageMilk: '12 KG', cattletype: 'Buffalo'),
    cattleAvgMilkRecord(tag: 'G12F', averageMilk: '4 KG', cattletype: 'Goat'),
    cattleAvgMilkRecord(tag: 'C12F', averageMilk: '14 KG', cattletype: 'Cow'),
  ];

  TextEditingController tagcon = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "View Average Milk",
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
              padding: const EdgeInsets.all(20.0),
              child: Container(
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
                      hintText: 'Enter Cattle Tag',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
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
                            builder: (context) => CattleInfoScreen(
                                  cTag: cattleList[index].tag,
                                )));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tag: ${record.tag}'),
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
                                  'Avg Milk: ${record.averageMilk}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Type: ${record.cattletype}',
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


// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// class MilkData {
//   final DateTime date;
//   final int milkProduced;

//   MilkData(this.date, this.milkProduced);
// }

// class Cattle {
//   final String tag;
//   final List<MilkData> milkData;

//   Cattle(this.tag, this.milkData);
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Cattle> _cattles = [];
//   List<DropdownMenuItem<Cattle>> _dropdownMenuItems = [];
//   Cattle? _selectedCattle;
//   DateTime _startDate = DateTime.now().subtract(Duration(days: 30));
//   DateTime _endDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     _dropdownMenuItems = buildDropdownMenuItems(_cattles);
//   }

//   List<DropdownMenuItem<Cattle>> buildDropdownMenuItems(List<Cattle> cattles) {
//     List<DropdownMenuItem<Cattle>> items = [];
//     for (Cattle cattle in cattles) {
//       items.add(
//         DropdownMenuItem(
//           value: cattle,
//           child: Text(cattle.tag),
//         ),
//       );
//     }
//     return items;
//   }

//   void _addNewCattle() {
//     setState(() {
//       _cattles.add(
//         Cattle(
//           'Cattle ${_cattles.length + 1}',
//           List.generate(
//             30,
//             (index) => MilkData(
//               DateTime.now().subtract(Duration(days: 30 - index)),
//               (index % 10) + 5,
//             ),
//           ),
//         ),
//       );
//       _dropdownMenuItems = buildDropdownMenuItems(_cattles);
//       _selectedCattle = _cattles.last;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cattle Milk Graph'),
//         actions: [
//           IconButton(
//             onPressed: _addNewCattle,
//             icon: Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             DropdownButton(
//               value: _selectedCattle,
//               items: _dropdownMenuItems,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCattle = value as Cattle?;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('Start Date:'),
//                 TextButton(
//                   onPressed: () => _selectDate(context, true),
//                   child: Text(
//                     '${_startDate.day}/${_startDate.month}/${_startDate.year}',
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('End Date:'),
//                 TextButton(
//                   onPressed: () => _selectDate(context, false),
//                   child: Text(
//                     '${_endDate.day}/${_endDate.month}/${_endDate.year}',
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: _selectedCattle != null
//                   ? Container(
//                       decoration: BoxDecoration(border: Border.all()),
//                       child: _buildChart(_selectedCattle!))
//                   : Center(
//                       child: Text('No cattle selected'),
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context, bool isStartDate) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: isStartDate ? _startDate : _endDate,
//       firstDate: DateTime(2000),
//       lastDate: DateTime.now(),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         if (isStartDate) {
//           _startDate = pickedDate;
//         } else {
//           _endDate = pickedDate;
//         }
//       });
//     }
//   }

//   Widget _buildChart(Cattle cattle) {
//     final filteredData = cattle.milkData.where((data) =>
//         data.date.isAfter(_startDate.subtract(Duration(days: 1))) &&
//         data.date.isBefore(_endDate.add(Duration(days: 1))));

//     List<charts.Series<MilkData, DateTime>> series = [
//       charts.Series(
//         id: 'Milk',
//         data: filteredData.toList(),
//         domainFn: (MilkData milk, _) => milk.date,
//         measureFn: (MilkData milk, _) => milk.milkProduced,
//       ),
//     ];

//     return charts.TimeSeriesChart(
//       series,
//       animate: true,
//       dateTimeFactory: const charts.LocalDateTimeFactory(),
//     );
//   }
// }
