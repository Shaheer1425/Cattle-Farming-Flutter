import 'package:cattlefarming/Models/FoodStockClass.dart';
import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/cattleSaleClass.dart';
import 'package:cattlefarming/Models/expenseClass.dart';
import 'package:cattlefarming/Models/global.dart';
import 'package:cattlefarming/Models/incomeClass.dart';
import 'package:cattlefarming/Models/milksaleClass.dart';
import 'package:cattlefarming/Models/vaccineStockClass.dart';
import 'package:cattlefarming/Screens/expenseScreen.dart';
import 'package:cattlefarming/Screens/incomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String? selectedCattle;
  bool isIncomeSelected = true;
  String isMilkIncomeSelected = "Milk Sale";
  String isFodderExpenseSelected = 'Fodder';

  Color myColor() {
    // Return the appropriate color based on the value of isNormalSelected
    if (isIncomeSelected) {
      return const Color(
          0xFF02B7C8); // Return your desired color if isNormalSelected is true
    } else {
      return Colors.grey; // Return another color if isNormalSelected is false
    }
  }

  // List of TemperatureRecord data
  // final List<IncomeRecord> incomeRecordsList = [
  //   IncomeRecord(
  //     name: 'Milk Sale',
  //     date: '2023-11-15',
  //     money: 'Rs 4500',
  //   ),
  //   IncomeRecord(
  //     name: 'Cattle Sale',
  //     date: '2023-11-28',
  //     money: 'Rs 250000',
  //   ),
  // ];

  List<String> incomeItem = [
    "Milk Sale",
    "Cattle Sale",
  ];
  List<String> expenseItem = [
    'Fodder',
    'Vaccination',
  ];

  String? fodderItemSelected;

  ApiHandler apiHandler = ApiHandler();
  //List<dynamic> combinedList = [];
  int farmId = 1;
  @override
  void initState() {
    super.initState();
    //  farmId = FarmManager.getSelectedFarmId();
    fetchData();
  }

  List<Vaccination> vaccinationsList = [];
  List<FoodStock> foodStockList = [];
  List<MilkSaleRecord> saledMilkList = [];
  List<CattleSale> saledCattleList = [];
  Future<void> fetchData() async {
    try {
      vaccinationsList = await apiHandler.getAllVaccinationsStock();
      foodStockList = await apiHandler.getAllFoodStock();
      saledMilkList = await apiHandler.getAllSaledMilk();
      saledCattleList = await apiHandler.getAllSaledCattle();

      setState(() {});

      print('Fetched data successfully: '); // Debug print
    } catch (e) {
      print('Failed to load data: $e');
    }
  }

  // Future<void> fetchData() async {
  //   try {
  //     List<dynamic> vaccinations = await apiHandler.getAllVaccinationsStock();
  //     List<dynamic> foodStock = await apiHandler.getAllFoodStock();

  //     setState(() {
  //       combinedList = [...vaccinations, ...foodStock];
  //     });

  //     print('Fetched data successfully: $combinedList'); // Debug print
  //   } catch (e) {
  //     print('Failed to load data: $e');
  //   }
  // }

  // Future<void> fetchIncomData() async {
  //   try {
  //     List<dynamic> saledMilk = await apiHandler.getAllSaledMilk();
  //     List<dynamic> saledCattle = await apiHandler.getAllSaledCattle();

  //     setState(() {
  //       combinedList = [...saledMilk, ...saledCattle];
  //     });

  //     print('Fetched data successfully: $combinedList'); // Debug print
  //   } catch (e) {
  //     print('Failed to load data: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Transactions",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360,
              height: 2,
              color: const Color.fromARGB(255, 161, 228, 235),
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
                        isIncomeSelected
                            ? Colors.grey
                            : const Color(0xFF039BA8),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .zero, // Set the border radius to 0 for square corners
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isIncomeSelected = true;
                      });
                    },
                    child: const Text(
                      "Income",
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
                        !isIncomeSelected
                            ? Colors.grey
                            : const Color(0xFF039BA8),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius
                              .zero, // Set the border radius to 0 for square corners
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        isIncomeSelected = false;
                      });
                    },
                    child: const Text(
                      "Expense",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isIncomeSelected)
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 140,
                              child: DropdownButton<String>(
                                value: isMilkIncomeSelected,
                                underline: SizedBox(),
                                hint: Text("Milk Sale"),
                                items: incomeItem.map((String e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (newSelectedVal) {
                                  setState(() {
                                    isMilkIncomeSelected = newSelectedVal!;
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
                        if (isMilkIncomeSelected == 'Milk Sale')
                          Column(children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: saledMilkList.length,
                              itemBuilder: (context, index) {
                                final record = saledMilkList[index];
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text(
                                          'Cattle Type: ${record.cattleType}'),
                                      subtitle: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35.0, bottom: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Date: ${record.date}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Money: ${record.totalPrice}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          const Color(
                                                              0xFF039BA8)),
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  fixedSize:
                                                      MaterialStateProperty.all<
                                                              Size>(
                                                          const Size(90, 15)),
                                                ),
                                                onPressed: () {},
                                                child: const Text('Edit'),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          const Color(
                                                              0xFF039BA8)),
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  fixedSize:
                                                      MaterialStateProperty.all<
                                                              Size>(
                                                          const Size(90, 15)),
                                                ),
                                                onPressed: () {},
                                                child: const Text('Delete'),
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
                          ])
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: saledCattleList.length,
                            itemBuilder: (context, index) {
                              final record = saledCattleList[index];
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                  elevation: 3,
                                  child: ListTile(
                                    title: Text('Tag: ${record.cattleTag}'),
                                    subtitle: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 35.0, bottom: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Date: ${record.date}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Money: ${record.amount}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(const Color(
                                                            0xFF039BA8)),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(
                                                        const Size(90, 15)),
                                              ),
                                              onPressed: () {},
                                              child: const Text('Edit'),
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(const Color(
                                                            0xFF039BA8)),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(
                                                        const Size(90, 15)),
                                              ),
                                              onPressed: () {},
                                              child: const Text('Delete'),
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
                    )
                  else
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: const Color(0xFF02B7C8)),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 140,
                              child: DropdownButton<String>(
                                value: isFodderExpenseSelected,
                                underline: SizedBox(),
                                hint: Text("Fodder"),
                                items: expenseItem.map((String e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                                onChanged: (newSelectedVal) {
                                  setState(() {
                                    isFodderExpenseSelected = newSelectedVal!;
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
                        if (isFodderExpenseSelected == 'Fodder')
                          Column(children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: foodStockList.length,
                              itemBuilder: (context, index) {
                                final record = foodStockList[index];
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Card(
                                    elevation: 3,
                                    child: ListTile(
                                      title: Text('Name: ${record.item}'),
                                      subtitle: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 35.0, bottom: 10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Date: ${record.date}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Text(
                                                  'Money: ${record.price}',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          const Color(
                                                              0xFF039BA8)),
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  fixedSize:
                                                      MaterialStateProperty.all<
                                                              Size>(
                                                          const Size(90, 15)),
                                                ),
                                                onPressed: () {},
                                                child: const Text('Edit'),
                                              ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          const Color(
                                                              0xFF039BA8)),
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(Colors.white),
                                                  fixedSize:
                                                      MaterialStateProperty.all<
                                                              Size>(
                                                          const Size(90, 15)),
                                                ),
                                                onPressed: () {},
                                                child: const Text('Delete'),
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
                          ])
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: vaccinationsList.length,
                            itemBuilder: (context, index) {
                              final record = vaccinationsList[index];
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Card(
                                  elevation: 3,
                                  child: ListTile(
                                    title: Text('Name: ${record.type}'),
                                    subtitle: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 35.0, bottom: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Date: ${record.date}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                'Money: ${record.price}',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(const Color(
                                                            0xFF039BA8)),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(
                                                        const Size(90, 15)),
                                              ),
                                              onPressed: () {},
                                              child: const Text('Edit'),
                                            ),
                                            ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty
                                                        .all<Color>(const Color(
                                                            0xFF039BA8)),
                                                foregroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                                fixedSize: MaterialStateProperty
                                                    .all<Size>(
                                                        const Size(90, 15)),
                                              ),
                                              onPressed: () {},
                                              child: const Text('Delete'),
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
                    )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to different screens based on isIncomeSelected
          if (isIncomeSelected) {
            // Navigate to income screen
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NewIncomeScreen()));
          } else {
            // Navigate to expense screen
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NewExpenseScreen()));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTransactionListView({
    required List<dynamic> records,
    required String Function(dynamic) getName,
    required String Function(dynamic) getDate,
    required String Function(dynamic) getMoney,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: records.length,
      itemBuilder: (context, index) {
        final record = records[index];
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            elevation: 3,
            child: ListTile(
              title: Text('Name of Transaction: ${getName(record)}'),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date: ${getDate(record)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Money: ${getMoney(record)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF039BA8),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(90, 15),
                          ),
                        ),
                        onPressed: onEdit,
                        child: const Text('Edit'),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF039BA8),
                          ),
                          foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                          fixedSize: MaterialStateProperty.all<Size>(
                            const Size(90, 15),
                          ),
                        ),
                        onPressed: onDelete,
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// import 'package:cattlefarming/Models/FoodStockClass.dart';
// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/expenseClass.dart';
// import 'package:cattlefarming/Models/incomeClass.dart';
// import 'package:cattlefarming/Models/vaccineStockClass.dart';
// import 'package:cattlefarming/Screens/expenseScreen.dart';
// import 'package:cattlefarming/Screens/incomeScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class TransactionsScreen extends StatefulWidget {
//   const TransactionsScreen({super.key});

//   @override
//   State<TransactionsScreen> createState() => _TransactionsScreenState();
// }

// class _TransactionsScreenState extends State<TransactionsScreen> {
//   String? selectedCattle;
//   bool isIncomeSelected = true;

//   Color myColor() {
//     // Return the appropriate color based on the value of isNormalSelected
//     if (isIncomeSelected) {
//       return Color(
//           0xFF02B7C8); // Return your desired color if isNormalSelected is true
//     } else {
//       return Colors.grey; // Return another color if isNormalSelected is false
//     }
//   }

//   // List of TemperatureRecord data
//   final List<IncomeRecord> incomeRecordsList = [
//     IncomeRecord(
//       name: 'Milk Sale',
//       date: '2023-11-15',
//       money: 'Rs 4500',
//     ),
//     IncomeRecord(
//       name: 'Cattle Sale',
//       date: '2023-11-28',
//       money: 'Rs 250000',
//     ),
//   ];

//   // final List<ExpenseRecord> expenseRecordsList = [
//   //   ExpenseRecord(
//   //     name: 'Food',
//   //     date: '2023-03-09',
//   //     money: 'Rs 7700',
//   //   ),
//   //   ExpenseRecord(
//   //     name: 'Vaccination',
//   //     date: '2023-11-17',
//   //     money: 'Rs 5300',
//   //   ),
//   // ];

//   // List<String> fodderItem = [
//   //   'Choker',
//   //   'Berseem',
//   //   'Jowar',
//   // ];

//   String? fodderItemSelected;

//   ApiHandler apiHandler = ApiHandler();
//   List<dynamic> combinedList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       List<dynamic> vaccinations = await apiHandler.getAllVaccinationsStock();
//       List<dynamic> foodStock = await apiHandler.getAllFoodStock();

//       setState(() {
//         combinedList = [...vaccinations, ...foodStock];
//       });
//     } catch (e) {
//       print('Failed to load data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Center(
//             child: Text(
//               "Transactions",
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//             child: Column(children: [
//           Container(
//             width: 360,
//             height: 2,
//             color: Color.fromARGB(255, 161, 228, 235),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 179,
//                 height: 60,
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                       isIncomeSelected ? Colors.grey : const Color(0xFF039BA8),
//                     ),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius
//                             .zero, // Set the border radius to 0 for square corners
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       isIncomeSelected = true;
//                     });
//                   },
//                   child: const Text(
//                     "Income",
//                     style: TextStyle(
//                       color: Colors.white,
//                       //  isNormalSelected ? Color(0xFF02B7C8) : Colors.grey,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                   width: 179,
//                   height: 60,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         //  const Color(0xFF039BA8),
//                         !isIncomeSelected
//                             ? Colors.grey
//                             : const Color(0xFF039BA8),
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius
//                               .zero, // Set the border radius to 0 for square corners
//                         ),
//                       ),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         isIncomeSelected = false;
//                       });
//                     },
//                     child: const Text(
//                       "Expense",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               if (isIncomeSelected) ...[
//                 Column(
//                   children: [
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: incomeRecordsList.length,
//                       itemBuilder: (context, index) {
//                         final record = incomeRecordsList[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Card(
//                             elevation: 3,
//                             child: ListTile(
//                               title:
//                                   Text('Name of Transaction: ${record.name}'),
//                               subtitle: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 35.0, bottom: 10.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'Date: ${record.date}',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                         Text(
//                                           'Money: ${record.money}',
//                                           style: TextStyle(
//                                             fontSize: 16,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       ElevatedButton(
//                                         style: ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all<Color>(
//                                                   const Color(0xFF039BA8)),
//                                           foregroundColor:
//                                               MaterialStateProperty.all<Color>(
//                                                   Colors.white),
//                                           fixedSize:
//                                               MaterialStateProperty.all<Size>(
//                                                   Size(90, 15)),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text('Edit'),
//                                       ),
//                                       ElevatedButton(
//                                         style: ButtonStyle(
//                                           backgroundColor:
//                                               MaterialStateProperty.all<Color>(
//                                                   const Color(0xFF039BA8)),
//                                           foregroundColor:
//                                               MaterialStateProperty.all<Color>(
//                                                   Colors.white),
//                                           fixedSize:
//                                               MaterialStateProperty.all<Size>(
//                                                   Size(90, 15)),
//                                         ),
//                                         onPressed: () {},
//                                         child: Text('Delete'),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//               if (!isIncomeSelected) ...[
//                 ListView.builder(
//                   // shrinkWrap: true,
//                   // physics: NeverScrollableScrollPhysics(),
//                   itemCount: combinedList.length,
//                   itemBuilder: (context, index) {
//                     final record = combinedList[index];
//                     if (record is Vaccination) {
//                       return Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Card(
//                           elevation: 3,
//                           child: ListTile(
//                             title: Text('Name of Transaction: ${record.type}'),
//                             subtitle: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 35.0, bottom: 10),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Date: ${record.date}',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Money: ${record.price}',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     ElevatedButton(
//                                       style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 const Color(0xFF039BA8)),
//                                         foregroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 Colors.white),
//                                         fixedSize:
//                                             MaterialStateProperty.all<Size>(
//                                                 Size(90, 15)),
//                                       ),
//                                       onPressed: () {},
//                                       child: Text('Edit'),
//                                     ),
//                                     ElevatedButton(
//                                       style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 const Color(0xFF039BA8)),
//                                         foregroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 Colors.white),
//                                         fixedSize:
//                                             MaterialStateProperty.all<Size>(
//                                                 Size(90, 15)),
//                                       ),
//                                       onPressed: () {},
//                                       child: Text('Delete'),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     } else if (record is FoodStock) {
//                       return Padding(
//                         padding: const EdgeInsets.all(2.0),
//                         child: Card(
//                           elevation: 3,
//                           child: ListTile(
//                             title: Text('Name of Transaction: ${record.item}'),
//                             subtitle: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       top: 35.0, bottom: 10),
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         'Date: ${record.date}',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       ),
//                                       Text(
//                                         'Money: ${record.price}',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     ElevatedButton(
//                                       style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 const Color(0xFF039BA8)),
//                                         foregroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 Colors.white),
//                                         fixedSize:
//                                             MaterialStateProperty.all<Size>(
//                                                 Size(90, 15)),
//                                       ),
//                                       onPressed: () {},
//                                       child: Text('Edit'),
//                                     ),
//                                     ElevatedButton(
//                                       style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 const Color(0xFF039BA8)),
//                                         foregroundColor:
//                                             MaterialStateProperty.all<Color>(
//                                                 Colors.white),
//                                         fixedSize:
//                                             MaterialStateProperty.all<Size>(
//                                                 Size(90, 15)),
//                                       ),
//                                       onPressed: () {},
//                                       child: Text('Delete'),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ]),
//           ),
//         ])),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Navigate to different screens based on isIncomeSelected
//             if (isIncomeSelected) {
//               // Navigate to income screen
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => NewIncomeScreen()));
//             } else {
//               // Navigate to expense screen
//               Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => NewExpenseScreen()));
//             }
//           },
//           child: Icon(Icons.add),
//         ));
//   }
// }
