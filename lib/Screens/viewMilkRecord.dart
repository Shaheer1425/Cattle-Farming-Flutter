// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/milkClass.dart';

// import 'package:cattlefarming/Screens/addmilknewscreen.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ViewMilkRecordScreen extends StatefulWidget {
//   const ViewMilkRecordScreen({super.key});

//   @override
//   State<ViewMilkRecordScreen> createState() => _ViewMilkRecordScreenState();
// }

// class _ViewMilkRecordScreenState extends State<ViewMilkRecordScreen> {
//   // List of TemperatureRecord data

//   TextEditingController datecon = TextEditingController();
//   List<MilkRecord> records = [];
//   // List<MilkRecord> recordss = [
//   //   MilkRecord(tag: 'C14F', date: '2023-11-14', totalMilk: 10, consumedMilk: 2),
//   //   MilkRecord(tag: 'B19F', date: '2023-11-13', totalMilk: 13, consumedMilk: 3),
//   // ];
//   ApiHandler apiHandler = ApiHandler();
//   @override
//   void initState() {
//     super.initState();
//     // datecon.text = DateTime.now().toString().split(' ')[0]; // Set default date
//     fetchMilkRecord(); // Fetch weights initially
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
//       fetchMilkRecord(); // Fetch weights for the selected date
//     }
//   }

//   Future<void> fetchMilkRecord() async {
//     if (datecon.text.isNotEmpty) {
//       records = await apiHandler.GetMilkCollectionByDate(datecon.text);
//     } else {
//       records = await apiHandler.getAllMilkCollection();
//     }
//     setState(() {}); // Update the UI after fetching weights
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Milk Record",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => AddMilkNewScreen()));
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
//                           Text('Date: ${record.date}'),
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
//                                   'Total : ${record.totalMilk}',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 Text(
//                                   'Time : ${record.time}',
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

//------------------Tag search and Start Date end date functionality is added in it

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/milkClass.dart';
import 'package:cattlefarming/Screens/addmilknewscreen.dart';
import 'package:flutter/material.dart';

class ViewMilkRecordScreen extends StatefulWidget {
  const ViewMilkRecordScreen({super.key});

  @override
  State<ViewMilkRecordScreen> createState() => _ViewMilkRecordScreenState();
}

class _ViewMilkRecordScreenState extends State<ViewMilkRecordScreen> {
  TextEditingController startDatecon = TextEditingController();
  TextEditingController endDatecon = TextEditingController();
  TextEditingController tagCon = TextEditingController();
  List<MilkRecord> records = [];
  List<MilkRecord> filteredRecords = [];
  ApiHandler apiHandler = ApiHandler();

  @override
  void initState() {
    super.initState();
    fetchMilkRecord();
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
      filterMilkRecords();
    }
  }

  Future<void> fetchMilkRecord() async {
    records = await apiHandler.getAllMilkCollection();
    filteredRecords = records;
    setState(() {});
  }

  void filterMilkRecords() {
    String tag = tagCon.text.toLowerCase();
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
            "Milk Record",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddMilkNewScreen()));
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
              height: 16,
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
                  controller: tagCon,
                  decoration: InputDecoration(
                    hintText: 'Search Cattle by Tag',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
                    suffixIcon: tagCon.text.isEmpty
                        ? IconButton(
                            icon: Icon(Icons.search),
                            onPressed: filterMilkRecords,
                          )
                        : IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              tagCon.clear();
                              filterMilkRecords();
                            },
                          ),
                  ),
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
            SizedBox(height: 30),
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
                          Text('Date: ${record.date}'),
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
                                  'Total : ${record.totalMilk}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'Time : ${record.time}',
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
