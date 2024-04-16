import 'package:cattlefarming/Models/expenseClass.dart';
import 'package:cattlefarming/Models/incomeClass.dart';
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

  Color myColor() {
    // Return the appropriate color based on the value of isNormalSelected
    if (isIncomeSelected) {
      return Color(
          0xFF02B7C8); // Return your desired color if isNormalSelected is true
    } else {
      return Colors.grey; // Return another color if isNormalSelected is false
    }
  }

  // List of TemperatureRecord data
  final List<IncomeRecord> incomeRecordsList = [
    IncomeRecord(
      name: 'Milk Sale',
      date: '2023-11-15',
      money: 'Rs 4500',
    ),
    IncomeRecord(
      name: 'Cattle Sale',
      date: '2023-11-28',
      money: 'Rs 250000',
    ),
  ];

  final List<ExpenseRecord> expenseRecordsList = [
    ExpenseRecord(
      name: 'Food',
      date: '2023-03-09',
      money: 'Rs 7700',
    ),
    ExpenseRecord(
      name: 'Vaccination',
      date: '2023-11-17',
      money: 'Rs 5300',
    ),
  ];

  List<String> fodderItem = [
    'Choker',
    'Berseem',
    'Jowar',
  ];

  String? fodderItemSelected;

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
            child: Column(children: [
          Container(
            width: 360,
            height: 2,
            color: Color.fromARGB(255, 161, 228, 235),
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
                      isIncomeSelected ? const Color(0xFF039BA8) : Colors.grey,
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
                      //  isNormalSelected ? Color(0xFF02B7C8) : Colors.grey,
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
                        //  const Color(0xFF039BA8),
                        !isIncomeSelected
                            ? const Color(0xFF039BA8)
                            : Colors.grey,
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
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              if (isIncomeSelected) ...[
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: incomeRecordsList.length,
                      itemBuilder: (context, index) {
                        final record = incomeRecordsList[index];
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Card(
                            elevation: 3,
                            child: ListTile(
                              title:
                                  Text('Name of Transaction: ${record.name}'),
                              subtitle: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'Money: ${record.money}',
                                          style: TextStyle(
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
                                              MaterialStateProperty.all<Color>(
                                                  const Color(0xFF039BA8)),
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
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
                                          fixedSize:
                                              MaterialStateProperty.all<Size>(
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
              ],
              if (!isIncomeSelected) ...[
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: expenseRecordsList.length,
                  itemBuilder: (context, index) {
                    final record = expenseRecordsList[index];
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text('Name of Transaction: ${record.name}'),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 35.0, bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Date: ${record.date}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Money: ${record.money}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )
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
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF039BA8)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
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
                                      fixedSize:
                                          MaterialStateProperty.all<Size>(
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
            ]),
          ),
        ])),
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
          child: Icon(Icons.add),
        ));
  }
}
