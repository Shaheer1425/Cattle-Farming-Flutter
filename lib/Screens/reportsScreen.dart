// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ProgressReport extends StatefulWidget {
//   @override
//   _ProgressReportState createState() => _ProgressReportState();
// }

// class _ProgressReportState extends State<ProgressReport> {
//   TextEditingController startDatecon = TextEditingController();
//   TextEditingController endDatecon = TextEditingController();

//   String? selectedCattle;

//   // Sample data for demonstration
//   final List<Map<String, dynamic>> cattleSales = [
//     {'price': 300000, 'status': 'sold'},
//     {'price': 310000, 'status': 'sold'},
//   ];

//   final List<Map<String, dynamic>> cattleDeaths = [
//     {'cost': 290000, 'status': 'dead'}, // Cost is unknown
//   ];

//   double calculateProfit() {
//     double profit = 0;
//     for (var sale in cattleSales) {
//       if (sale['status'] == 'sold') {
//         profit += sale['price'];
//       }
//     }
//     return profit;
//   }

//   double calculateLoss() {
//     double loss = 0;
//     for (var death in cattleDeaths) {
//       if (death['status'] == 'dead' && death['cost'] != null) {
//         loss += death['cost'];
//       }
//     }
//     return loss;
//   }

//   double calculateOverallProfitOrLoss() {
//     double profit = calculateProfit();
//     double loss = calculateLoss();
//     return profit - loss;
//   }

//   Future<void> selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? datePicker = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1947),
//         lastDate: DateTime(2050));
//     if (datePicker != null) {
//       setState(() {
//         controller.text = datePicker.toString().split(' ')[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double profit = calculateProfit();
//     double loss = calculateLoss();
//     double overallProfitOrLoss = calculateOverallProfitOrLoss();
//     final hintColor = Theme.of(context).inputDecorationTheme.hintStyle?.color;
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Progress Reports",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Select Date", style: TextStyle(fontSize: 18)),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: 160,
//                   height: 60,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: const Color(0xFF02B7C8))),
//                   child: Center(
//                     child: GestureDetector(
//                       onTap: () => selectDate(context, startDatecon),
//                       child: AbsorbPointer(
//                         child: TextFormField(
//                           controller: startDatecon,
//                           decoration: InputDecoration(
//                               hintText: 'Start Date',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                               suffixIcon: Icon(
//                                 Icons.calendar_month_outlined,
//                                 color: hintColor,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Container(
//                   width: 160,
//                   height: 60,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: const Color(0xFF02B7C8))),
//                   child: Center(
//                     child: GestureDetector(
//                       onTap: () => selectDate(context, endDatecon),
//                       child: AbsorbPointer(
//                         child: TextFormField(
//                           controller: endDatecon,
//                           decoration: InputDecoration(
//                               hintText: 'End Date',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                               suffixIcon: Icon(
//                                 Icons.calendar_month_outlined,
//                                 color: hintColor,
//                               )),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildProgressSection("Overall Progress",
//                 profit: overallProfitOrLoss, loss: loss),
//             _buildCattleSaleSection(profit: profit, loss: loss),
//             Container(
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
//                       value: typeSelected,
//                       underline: const SizedBox(),
//                       hint: const Text("Cow"),
//                       items: cattleTypeItem.map((String e) {
//                         return DropdownMenuItem<String>(
//                           value: e,
//                           child: Text(e),
//                         );
//                       }).toList(),
//                       onChanged: (newSelectedVal) {
//                         setState(() {
//                           typeSelected = newSelectedVal;
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProgressSection(String title,
//       {required double profit, required double loss}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle(title),
//         _buildDataRow("Profit", "Rs. $profit"),
//         _buildDataRow("Loss", "Rs. $loss"),
//       ],
//     );
//   }

//   Widget _buildCattleSaleSection(
//       {required double profit, required double loss}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle("Cattle Sale"),
//         _buildDataRow("Cattle Sold", "2"), // Hardcoded for demonstration
//         _buildDataRow("Cattle Dead", "1"), // Hardcoded for demonstration
//         _buildDataRow("Profit", "Rs. $profit"),
//         _buildDataRow("Loss", "Rs. $loss"),
//       ],
//     );
//   }

//   Widget _buildCattleMilkSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildSectionTitle("Cattle Milk"),
//         DropdownButtonFormField<String>(
//           decoration: InputDecoration(
//             labelText: "Select Cattle",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),
//           items: ['Cattle 1', 'Cattle 2', 'Cattle 3'].map((String value) {
//             return DropdownMenuItem<String>(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             setState(() {
//               selectedCattle = newValue;
//             });
//           },
//         ),
//         _buildDataRow("", "79 Ltr"),
//       ],
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 20,
//           color: Colors.white,
//           backgroundColor: Color(0xFF02B7C8),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _buildDataRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 18)),
//           Text(value, style: TextStyle(fontSize: 18)),
//         ],
//       ),
//     );
//   }
// }

//----------------------------------------------------new

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressReport extends StatefulWidget {
  @override
  _ProgressReportState createState() => _ProgressReportState();
}

class _ProgressReportState extends State<ProgressReport> {
  TextEditingController startDatecon = TextEditingController();
  TextEditingController endDatecon = TextEditingController();

  String? selectedCattle;
  String? typeSelected = 'All Cattle';

  // Sample data for demonstration
  final List<Map<String, dynamic>> cattleSales = [
    {'price': 300000, 'status': 'sold'},
    {'price': 310000, 'status': 'sold'},
  ];

  final List<Map<String, dynamic>> cattleDeaths = [
    {'cost': 290000, 'status': 'dead'}, // Cost is known
  ];

  List<String> cattleTypeItem = ['All Cattle', 'Cow', 'Buffalo', 'Goat'];

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));
    if (datePicker != null) {
      setState(() {
        controller.text = datePicker.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double profit = 0;
    double totalMilk = 480;
    double loss = 0;
    for (var sale in cattleSales) {
      if (sale['status'] == 'sold') {
        profit += sale['price'];
      }
    }
    for (var death in cattleDeaths) {
      if (death['status'] == 'dead' && death['cost'] != null) {
        loss += death['cost'];
      }
    }
    double overallProfitOrLoss = profit - loss;
    final hintColor = Theme.of(context).inputDecorationTheme.hintStyle?.color;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Progress Reports",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Date", style: TextStyle(fontSize: 18)),
            SizedBox(
              height: 10,
            ),
            Row(
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
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Overall Progress",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: Color(0xFF02B7C8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profit", style: TextStyle(fontSize: 18)),
                  Text("Rs. $overallProfitOrLoss",
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Loss", style: TextStyle(fontSize: 18)),
                  Text("Rs. $loss", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Cattle Sale",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: Color(0xFF02B7C8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cattle Sold", style: TextStyle(fontSize: 18)),
                  Text("2",
                      style: TextStyle(
                          fontSize: 18)), // Hardcoded for demonstration
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Cattle Dead", style: TextStyle(fontSize: 18)),
                  Text("1",
                      style: TextStyle(
                          fontSize: 18)), // Hardcoded for demonstration
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profit", style: TextStyle(fontSize: 18)),
                  Text("Rs. $profit", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Loss", style: TextStyle(fontSize: 18)),
                  Text("Rs. $loss", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Cattle Milk",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  backgroundColor: Color(0xFF02B7C8),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
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
                  child: DropdownButton<String>(
                    value: typeSelected,
                    underline: const SizedBox(),
                    // hint: const Text("Cow"),
                    items: cattleTypeItem.map((String e) {
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (newSelectedVal) {
                      setState(() {
                        typeSelected = newSelectedVal;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Milk", style: TextStyle(fontSize: 18)),
                  Text("$totalMilk Ltr", style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:ffi';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class ProgressReport extends StatefulWidget {
//   @override
//   _ProgressReportState createState() => _ProgressReportState();
// }

// class _ProgressReportState extends State<ProgressReport> {
//   TextEditingController startDatecon = TextEditingController();
//   TextEditingController endDatecon = TextEditingController();

//   String? selectedCattle;
//   String? typeSelected = 'All Cattle';

//   // Sample data for demonstration
//   final List<Map<String, dynamic>> cattleSales = [
//     {'price': 300000, 'status': 'sold'},
//     {'price': 310000, 'status': 'sold'},
//   ];

//   final List<Map<String, dynamic>> cattleDeaths = [
//     {'cost': 290000, 'status': 'dead'}, // Cost is known
//   ];

//   final List<Map<String, dynamic>> milkProduction = [
//     {'date': '2023-06-01', 'quantity': 120},
//     {'date': '2023-06-02', 'quantity': 130},
//   ];

//   final List<Map<String, dynamic>> foodStock = [
//     {'item': 'Hay', 'quantity': 500},
//     {'item': 'Grain', 'quantity': 300},
//   ];

//   final List<Map<String, dynamic>> foodConsumption = [
//     {'date': '2023-06-01', 'item': 'Hay', 'quantity': 50},
//     {'date': '2023-06-02', 'item': 'Grain', 'quantity': 30},
//   ];

//   final List<Map<String, dynamic>> vaccinations = [
//     {'date': '2023-06-01', 'vaccine': 'Vaccine A', 'status': 'done'},
//     {'date': '2023-06-02', 'vaccine': 'Vaccine B', 'status': 'done'},
//   ];

//   final List<Map<String, dynamic>> roomTemperatures = [
//     {'date': '2023-06-01', 'temperature': 22},
//     {'date': '2023-06-02', 'temperature': 23},
//   ];

//   final List<Map<String, dynamic>> cattleMetrics = [
//     {'tag': 'C1', 'weight': 500, 'height': 150},
//     {'tag': 'C2', 'weight': 600, 'height': 160},
//   ];

//   final List<Map<String, dynamic>> customers = [
//     {'name': 'John Doe', 'purchases': 5},
//     {'name': 'Jane Smith', 'purchases': 3},
//   ];

//   List<String> cattleTypeItem = ['All Cattle', 'Cow', 'Buffalo', 'Goat'];

//   Future<void> selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? datePicker = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1947),
//         lastDate: DateTime(2050));
//     if (datePicker != null) {
//       setState(() {
//         controller.text = datePicker.toString().split(' ')[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double profit = 0;
//     double totalMilk = 0;
//     double loss = 0;
//     for (var sale in cattleSales) {
//       if (sale['status'] == 'sold') {
//         profit += sale['price'];
//       }
//     }
//     for (var death in cattleDeaths) {
//       if (death['status'] == 'dead' && death['cost'] != null) {
//         loss += death['cost'];
//       }
//     }
//     for (var milk in milkProduction) {
//       totalMilk += milk['quantity'];
//     }
//     double overallProfitOrLoss = profit - loss;
//     final hintColor = Theme.of(context).inputDecorationTheme.hintStyle?.color;

//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Progress Reports",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Select Date", style: TextStyle(fontSize: 18)),
//             SizedBox(height: 10),
//             Row(
//               children: [
//                 buildDateContainer(
//                     context, startDatecon, hintColor, 'Start Date'),
//                 SizedBox(width: 8),
//                 buildDateContainer(context, endDatecon, hintColor, 'End Date'),
//               ],
//             ),
//             SizedBox(height: 16),
//             buildSectionTitle("Overall Progress"),
//             buildDataRow("Profit", "Rs. $overallProfitOrLoss"),
//             buildDataRow("Loss", "Rs. $loss"),
//             buildSectionTitle("Cattle Sale"),
//             buildDataRow("Cattle Sold", "2"), // Hardcoded for demonstration
//             buildDataRow("Cattle Dead", "1"), // Hardcoded for demonstration
//             buildDataRow("Profit", "Rs. $profit"),
//             buildDataRow("Loss", "Rs. $loss"),
//             buildSectionTitle("Cattle Milk"),
//             buildMilkSection(totalMilk),
//             buildSectionTitle("Food Stock"),
//             buildFoodSection(foodStock, "Stock"),
//             buildSectionTitle("Food Consumption"),
//             buildFoodSection(foodConsumption, "Consumption"),
//             buildSectionTitle("Vaccination"),
//             buildVaccinationSection(vaccinations),
//             buildSectionTitle("Room Temperature"),
//             buildTemperatureSection(roomTemperatures),
//             buildSectionTitle("Cattle Metrics"),
//             buildMetricsSection(cattleMetrics),
//             buildSectionTitle("Customers"),
//             buildCustomersSection(customers),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildDateContainer(BuildContext context,
//       TextEditingController controller, Color? hintColor, String hintText) {
//     return Container(
//       width: 160,
//       height: 60,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20.0),
//         border: Border.all(color: const Color(0xFF02B7C8)),
//       ),
//       child: Center(
//         child: GestureDetector(
//           onTap: () => selectDate(context, controller),
//           child: AbsorbPointer(
//             child: TextFormField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 border: InputBorder.none,
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//                 suffixIcon:
//                     Icon(Icons.calendar_month_outlined, color: hintColor),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildSectionTitle(String title) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 20,
//           color: Colors.white,
//           backgroundColor: Color(0xFF02B7C8),
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget buildDataRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(fontSize: 18)),
//           Text(value, style: TextStyle(fontSize: 18)),
//         ],
//       ),
//     );
//   }

//   Widget buildMilkSection(double totalMilk) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         buildDataRow("Total Milk", "$totalMilk Ltr"),
//         Container(
//           width: 300,
//           height: 60,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20.0),
//             border: Border.all(color: const Color(0xFF02B7C8)),
//           ),
//           child: Center(
//             child: SizedBox(
//               width: 240,
//               child: DropdownButton<String>(
//                 value: typeSelected,
//                 underline: const SizedBox(),
//                 items: cattleTypeItem.map((String e) {
//                   return DropdownMenuItem<String>(
//                     value: e,
//                     child: Text(e),
//                   );
//                 }).toList(),
//                 onChanged: (newSelectedVal) {
//                   setState(() {
//                     typeSelected = newSelectedVal;
//                   });
//                 },
//                 isExpanded: true,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildFoodSection(List<Map<String, dynamic>> foodData, String type) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: foodData.map((food) {
//         return buildDataRow(
//             "${food['item']} ($type)", "${food['quantity']} kg");
//       }).toList(),
//     );
//   }

//   Widget buildVaccinationSection(List<Map<String, dynamic>> vaccinations) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: vaccinations.map((vaccine) {
//         return buildDataRow("${vaccine['date']}",
//             "${vaccine['vaccine']} (${vaccine['status']})");
//       }).toList(),
//     );
//   }

//   Widget buildTemperatureSection(List<Map<String, dynamic>> temperatures) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: temperatures.map((temp) {
//         return buildDataRow("${temp['date']}", "${temp['temperature']} °C");
//       }).toList(),
//     );
//   }

//   Widget buildMetricsSection(List<Map<String, dynamic>> metrics) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: metrics.map((metric) {
//         return buildDataRow("${metric['tag']}",
//             "Weight: ${metric['weight']} kg, Height: ${metric['height']} cm");
//       }).toList(),
//     );
//   }

//   Widget buildCustomersSection(List<Map<String, dynamic>> customers) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: customers.map((customer) {
//         return buildDataRow(
//             "${customer['name']}", "Purchases: ${customer['purchases']}");
//       }).toList(),
//     );
//   }
// }
