//-----------------------Below is origional screen code
import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/cattleSaleClass.dart';
import 'package:cattlefarming/Models/global.dart';
import 'package:cattlefarming/Models/milksaleClass.dart';
import 'package:cattlefarming/Screens/addCustomers.dart';
import 'package:cattlefarming/Screens/expenseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class NewIncomeScreen extends StatefulWidget {
  final String? Stag;
  const NewIncomeScreen({Key? key, this.Stag}) : super(key: key);

  @override
  State<NewIncomeScreen> createState() => _NewIncomeScreenState();
}

class _NewIncomeScreenState extends State<NewIncomeScreen> {
  TextEditingController datecon = TextEditingController();
  TextEditingController milkQtycon = TextEditingController();
  TextEditingController salingPricePerLtrcon = TextEditingController();
  TextEditingController milkEarncon = TextEditingController();
  TextEditingController tagcon = TextEditingController();
  TextEditingController cattleEarncon = TextEditingController();
  TextEditingController notecon = TextEditingController();
  String? selectedCattle;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));
    if (datePicker != null) {
      setState(() {
        datecon.text = datePicker.toString().split(' ')[0];
      });
    }
  }

  List<String> incomeTypeItem = [
    'Cattle Sale',
    'Milk Sale',
  ];

  bool isMilkSaleSelected = false;
  bool isCattleSaleSelected = false;
  String? incomeTypeSelected = 'Cattle Sale';
  // List<String> customerList = [
  //   'Aslam',
  //   'Ali',
  //   'Barkat',
  // ];

  int? customerSelected;
  // @override
  // void dispose() {
  //   milkQtycon.dispose()
  //   salingPricePerLtrcon.dispose();
  //   super.dispose();
  // }

  double totalPrice = 0;
  void calculateTotalPrice() {
    double quantity = double.tryParse(milkQtycon.text) ?? 0.0;
    double pricePerLiter = double.tryParse(salingPricePerLtrcon.text) ?? 0.0;

    setState(() {
      totalPrice = (quantity * pricePerLiter).toDouble();
      milkEarncon.text = 'Rs $totalPrice';
    });
  }

  List<MilkSaleRecord> milkSaleEntries = [];

  int farmId = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isMilkSaleSelected = true;
    isCattleSaleSelected = true;
    fetchCustomerList();
    // tagcon.text = widget.Stag!;
    tagcon.text = widget.Stag ?? '';
    //farmId = FarmManager.getSelectedFarmId();
    //calculateTotalPrice();
  }

  // void addMilkSaleEntry() {
  //   // Create a new MilkSaleEntry object with the entered data
  //   MilkSaleRecord newEntry = MilkSaleRecord(
  //       date: datecon.text,
  //       cattleType: selectedCattle,
  //       quantity: double.tryParse(milkQtycon.text) ?? 0.0,
  //       pricePerLitre: double.tryParse(salingPricePerLtrcon.text) ?? 0.0,
  //       totalPrice: totalPrice,
  //       customerName: customerSelected,
  //       note: notecon.text,
  //       farmId: 1,
  //       );

  //   // Add the new entry to the list
  //   setState(() {
  //     milkSaleEntries.add(newEntry);
  //   });

  //   // Clear the input fields
  //   datecon.clear();
  //   milkQtycon.clear();
  //   salingPricePerLtrcon.clear();
  //   milkEarncon.clear();
  //   tagcon.clear();
  //   cattleEarncon.clear();
  // }

  // // Function to save all milk sale entries to the database
  // void saveMilkSales() {
  //   // You can implement database saving logic here
  //   // For demonstration, I'm just printing the entries
  //   for (var entry in milkSaleEntries) {
  //     print(
  //         'Date: ${entry.date}, Cattle Type: ${entry.cattleType}, Quantity: ${entry.quantity}, Price per litre: ${entry.pricePerLitre}, Total Price: ${entry.totalPrice}');
  //     // Save each entry to the database
  //   }

  //   // Clear the milk sale entries list after saving
  //   setState(() {
  //     milkSaleEntries.clear();
  //   });

  //   // Clear other input fields
  //   datecon.clear();
  //   milkQtycon.clear();
  //   salingPricePerLtrcon.clear();
  //   milkEarncon.clear();
  //   tagcon.clear();
  //   cattleEarncon.clear();
  // }

  //-------------------------------------
  // Inside _NewIncomeScreenState class

  final ApiHandler apiHandler = ApiHandler();

  void saveCattleSale(String cattleTag) async {
    try {
      final response = await apiHandler.saleCattle(
        CattleSale(
          id: 0, // Set the ID according to your requirement
          date: datecon.text, // Set the date
          amount:
              double.tryParse(cattleEarncon.text), // Set the amount if needed
          customerId: customerSelected!, // Set the customer ID
          cattleTag: tagcon.text,
          farmId: farmId, // Set the farm ID
        ),
      );
      print(response); // Print the response or handle it as needed
    } catch (e) {
      print('Error saving cattle sale: $e');
      // Handle the error as needed
    }
  }

  void saveMilkSales(List<MilkSaleRecord> milkSales) {
    try {
      apiHandler.saveMilkSales(milkSales);
    } catch (e) {
      print('Error saving milk sales: $e');
    }
  }

// Call these methods where appropriate, for example, when adding a new milk sale entry
  void addMilkSaleEntry() {
    // Create a new MilkSaleRecord object with the entered data
    MilkSaleRecord newEntry = MilkSaleRecord(
      date: datecon.text,
      cattleType: selectedCattle,
      quantity: double.tryParse(milkQtycon.text) ?? 0.0,
      pricePerLitre: double.tryParse(salingPricePerLtrcon.text) ?? 0.0,
      totalPrice: totalPrice,
      customerid: customerSelected!,
      note: notecon.text,
      farmId: farmId,
    );

    // Add the new entry to the list
    setState(() {
      milkSaleEntries.add(newEntry);
    });

    // Clear the input fields
    // datecon.clear();
    milkQtycon.clear();
    salingPricePerLtrcon.clear();
    milkEarncon.clear();

    // Save milk sales to the server
    // saveMilkSales(milkSaleEntries);
  }

  bool checkMilk = true;
  void MilkSaleCondition() {
    if (checkMilk == true) {
      addMilkSaleEntry();
      saveMilkSales(milkSaleEntries);
    } else {
      // saveMilkSales(milkSaleEntries);
      addMilkSaleEntry();
    }
  }

  List<dynamic> customersList = [];
  Future<void> fetchCustomerList() async {
    ApiHandler apiHandler = ApiHandler();
    customersList = await apiHandler.getAllCustomer();
    setState(() {
      // customerSelected = customersList.isNotEmpty ? 0 : -1;
      customerSelected = customersList.isNotEmpty ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "New Income",
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
                    border: Border.all(color: const Color(0xFF02B7C8))),
                child: Center(
                  child: GestureDetector(
                    onTap: () => selectDate(context),
                    child: AbsorbPointer(
                      //AbsorbPointer used to prevent user input in textformfield
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
                            )),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Select Customer",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 250,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFF02B7C8)),
                    ),
                    // const EdgeInsets.symmetric(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: SizedBox(
                        width: 240,
                        child: DropdownButton<int>(
                          value: customerSelected,
                          underline: SizedBox(),
                          hint: Text("Select Customer"),
                          items: [
                            DropdownMenuItem<int>(
                              value: 0,
                              child: Text("Select Customer"),
                            ),
                            if (customersList.isNotEmpty)
                              for (var i = 0; i < customersList.length; i++)
                                DropdownMenuItem<int>(
                                  value: i + 1, // Start index from 1
                                  child: Text(
                                      '${customersList[i]['Name']}\n${customersList[i]['Contact']}'),
                                ),
                          ],
                          onChanged: (newSelectedIndex) {
                            setState(() {
                              customerSelected = newSelectedIndex!;
                            });
                          },
                          isExpanded: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xFF039BA8),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddCustomersScreen()));
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Select Income Type",
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
                    child: DropdownButton<String>(
                      value: incomeTypeSelected,
                      underline: const SizedBox(),
                      hint: const Text("Cattle Sale"),
                      items: [
                        DropdownMenuItem<String>(
                          value: "Select Income Type",
                          child: const Text("Select Income Type"),
                        ),
                        ...incomeTypeItem.map((String e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }),
                      ],
                      onChanged: (newSelectedVal) {
                        setState(() {
                          incomeTypeSelected = newSelectedVal;
                          // Update the boolean variable based on the selection
                          isMilkSaleSelected = (newSelectedVal == 'Milk Sale');
                          isCattleSaleSelected =
                              (newSelectedVal == 'Cattle Sale');
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),

              // Conditionally render "Enter Cost in PKR" text and TextFormField
              if (isMilkSaleSelected) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Select Cattle",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                        value: "Cow",
                        groupValue: selectedCattle,
                        onChanged: (value) {
                          setState(() {
                            selectedCattle = value as String;
                          });
                        }),
                    Text(
                      "Cow",
                      style: TextStyle(fontSize: 15),
                    ),
                    Radio(
                        value: "Buffalo",
                        groupValue: selectedCattle,
                        onChanged: (value) {
                          setState(() {
                            selectedCattle = value as String;
                          });
                        }),
                    Text(
                      "Buffalo",
                      style: TextStyle(fontSize: 15),
                    ),
                    Radio(
                        value: "Goat",
                        groupValue: selectedCattle,
                        onChanged: (value) {
                          setState(() {
                            selectedCattle = value as String;
                          });
                        }),
                    Text(
                      "Goat",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Text(
                    "Milk Quantity",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFF02B7C8))),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: milkQtycon,
                      decoration: const InputDecoration(
                        hintText: '30 ltr',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Text(
                    "Saling Price Per Litre",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFF02B7C8))),
                  child: Center(
                    child: TextFormField(
                      controller: salingPricePerLtrcon,
                      decoration: const InputDecoration(
                        hintText: 'Rs 120',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Text(
                    "Total Price",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                InkWell(
                  onTap: () => calculateTotalPrice(),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: const Color(0xFF02B7C8))),
                    child: Center(
                      child: TextFormField(
                        enabled: false,
                        controller: milkEarncon,
                        decoration: const InputDecoration(
                          hintText: 'Rs 3600',
                          hintStyle: TextStyle(),
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    //addMilkSaleEntry(); // Add a new milk sale entry
                    checkMilk = false;
                    MilkSaleCondition();
                  },
                  child: Text('Add More Milk'),
                ),

                // List of entered milk sale entries
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: milkSaleEntries.length,
                  itemBuilder: (context, index) {
                    // Display each milk sale entry in a ListTile
                    final entry = milkSaleEntries[index];
                    return ListTile(
                      title: Text('Cattle Type: ${entry.cattleType}'),
                      subtitle: Text(
                          'Quantity: ${entry.quantity} litres\nPrice per litre: Rs ${entry.pricePerLitre}\nTotal Price: Rs ${entry.totalPrice}'),
                    );
                  },
                ),
              ],

              if (isCattleSaleSelected) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Text(
                    "Enter Tag",
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Text(
                    "How much earn",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: const Color(0xFF02B7C8))),
                  child: Center(
                    child: TextFormField(
                      controller: cattleEarncon,
                      decoration: const InputDecoration(
                        hintText: '230000',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                    ),
                  ),
                ),
              ],

              // Padding(
              //   padding: const EdgeInsets.only(bottom: 8, left: 8),
              //   child: Text(
              //     "Write Note",
              //     style: TextStyle(fontSize: 20),
              //   ),
              // ),
              // Container(
              //   width: 300,
              //   height: 60,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.0),
              //       border: Border.all(color: const Color(0xFF02B7C8))),
              //   child: Center(
              //     child: TextFormField(
              //       controller: notecon,
              //       decoration: const InputDecoration(
              //         hintText: 'Write Some Note',
              //         hintStyle: TextStyle(),
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
              //       ),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 60,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF039BA8),
                        )),
                        onPressed: () {
                          if (isMilkSaleSelected) {
                            //  saveMilkSales(milkSaleEntries);
                            checkMilk = true;
                            MilkSaleCondition();
                          } else {
                            if (tagcon.text.isNotEmpty) {
                              saveCattleSale(tagcon.text);
                            } else {
                              print('Cattle tag is null');
                            }
                          }
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------Below is code with print invoice code

// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/cattleSaleClass.dart';
// import 'package:cattlefarming/Models/global.dart';
// import 'package:cattlefarming/Models/milksaleClass.dart';
// import 'package:cattlefarming/Screens/addCustomers.dart';
// import 'package:cattlefarming/Screens/expenseScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class NewIncomeScreen extends StatefulWidget {
//   final String? Stag;
//   const NewIncomeScreen({Key? key, this.Stag}) : super(key: key);

//   @override
//   State<NewIncomeScreen> createState() => _NewIncomeScreenState();
// }

// class _NewIncomeScreenState extends State<NewIncomeScreen> {
//   TextEditingController datecon = TextEditingController();
//   TextEditingController milkQtycon = TextEditingController();
//   TextEditingController salingPricePerLtrcon = TextEditingController();
//   TextEditingController milkEarncon = TextEditingController();
//   TextEditingController tagcon = TextEditingController();
//   TextEditingController cattleEarncon = TextEditingController();
//   TextEditingController notecon = TextEditingController();
//   String? selectedCattle;

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

//   List<String> incomeTypeItem = [
//     'Cattle Sale',
//     'Milk Sale',
//   ];

//   bool isMilkSaleSelected = false;
//   bool isCattleSaleSelected = false;
//   String? incomeTypeSelected = 'Cattle Sale';

//   int? customerSelected;

//   double totalPrice = 0;
//   void calculateTotalPrice() {
//     double quantity = double.tryParse(milkQtycon.text) ?? 0.0;
//     double pricePerLiter = double.tryParse(salingPricePerLtrcon.text) ?? 0.0;

//     setState(() {
//       totalPrice = (quantity * pricePerLiter).toDouble();
//       milkEarncon.text = 'Rs $totalPrice';
//     });
//   }

//   List<MilkSaleRecord> milkSaleEntries = [];

//   int farmId = 1;
//   @override
//   void initState() {
//     super.initState();
//     isCattleSaleSelected = true;
//     fetchCustomerList();
//     tagcon.text = widget.Stag ?? '';
//   }

//   final ApiHandler apiHandler = ApiHandler();

//   void saveCattleSale(String cattleTag) async {
//     try {
//       final response = await apiHandler.saleCattle(
//         CattleSale(
//           id: 0,
//           date: datecon.text,
//           amount: double.tryParse(cattleEarncon.text),
//           customerId: customerSelected!,
//           cattleTag: tagcon.text,
//           farmId: farmId,
//         ),
//       );
//       print(response);
//     } catch (e) {
//       print('Error saving cattle sale: $e');
//     }
//   }

//   void saveMilkSales(List<MilkSaleRecord> milkSales) {
//     try {
//       apiHandler.saveMilkSales(milkSales);
//     } catch (e) {
//       print('Error saving milk sales: $e');
//     }
//   }

//   void addMilkSaleEntry() {
//     MilkSaleRecord newEntry = MilkSaleRecord(
//       date: datecon.text,
//       cattleType: selectedCattle,
//       quantity: double.tryParse(milkQtycon.text) ?? 0.0,
//       pricePerLitre: double.tryParse(salingPricePerLtrcon.text) ?? 0.0,
//       totalPrice: totalPrice,
//       customerid: customerSelected!,
//       note: notecon.text,
//       farmId: farmId,
//     );

//     setState(() {
//       milkSaleEntries.add(newEntry);
//     });

//     milkQtycon.clear();
//     salingPricePerLtrcon.clear();
//     milkEarncon.clear();
//   }

//   bool checkMilk = true;
//   void MilkSaleCondition() {
//     if (checkMilk == true) {
//       addMilkSaleEntry();
//       saveMilkSales(milkSaleEntries);
//       generateMilkInvoice(milkSaleEntries);
//     } else {
//       addMilkSaleEntry();
//     }
//   }

//   List<dynamic> customersList = [];
//   Future<void> fetchCustomerList() async {
//     ApiHandler apiHandler = ApiHandler();
//     customersList = await apiHandler.getAllCustomer();
//     setState(() {
//       customerSelected = customersList.isNotEmpty ? 1 : 0;
//     });
//   }

//   Future<void> generateMilkInvoice(List<MilkSaleRecord> milkSales) async {
//     final pdf = pw.Document();
//     final List<pw.Widget> saleWidgets = [];

//     for (var sale in milkSales) {
//       saleWidgets.add(
//         pw.Padding(
//           padding: const pw.EdgeInsets.symmetric(vertical: 8.0),
//           child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('Date: ${sale.date}'),
//               pw.Text('Cattle Type: ${sale.cattleType}'),
//               pw.Text('Quantity: ${sale.quantity} litres'),
//               pw.Text('Price per litre: Rs ${sale.pricePerLitre}'),
//               pw.Text('Total Price: Rs ${sale.totalPrice}'),
//               pw.Divider(),
//             ],
//           ),
//         ),
//       );
//     }

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text('Milk Sale Invoice', style: pw.TextStyle(fontSize: 24)),
//               pw.SizedBox(height: 20),
//               ...saleWidgets,
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => pdf.save());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "New Income",
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
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Select Customer",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 250,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: const Color(0xFF02B7C8)),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                     child: Center(
//                       child: SizedBox(
//                         width: 240,
//                         child: DropdownButton<int>(
//                           value: customerSelected,
//                           underline: SizedBox(),
//                           hint: Text("Select Customer"),
//                           items: [
//                             DropdownMenuItem<int>(
//                               value: 0,
//                               child: Text("Select Customer"),
//                             ),
//                             if (customersList.isNotEmpty)
//                               for (var i = 0; i < customersList.length; i++)
//                                 DropdownMenuItem<int>(
//                                   value: i + 1,
//                                   child: Text(
//                                       '${customersList[i]['Name'] ?? customersList[i]['name']}'),
//                                 ),
//                           ],
//                           onChanged: (value) {
//                             setState(() {
//                               customerSelected = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 20),
//                   FloatingActionButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => AddCustomersScreen(),
//                         ),
//                       ).then((_) => fetchCustomerList());
//                     },
//                     child: const Icon(Icons.add),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Select Income Type",
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
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Center(
//                   child: SizedBox(
//                     width: 250,
//                     child: DropdownButton<String>(
//                       value: incomeTypeSelected,
//                       underline: SizedBox(),
//                       items: incomeTypeItem.map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String? value) {
//                         setState(() {
//                           incomeTypeSelected = value!;
//                           if (incomeTypeSelected == 'Milk Sale') {
//                             isMilkSaleSelected = true;
//                             isCattleSaleSelected = false;
//                           } else if (incomeTypeSelected == 'Cattle Sale') {
//                             isCattleSaleSelected = true;
//                             isMilkSaleSelected = false;
//                           }
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               isMilkSaleSelected
//                   ? Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Milk Quantity (in Litres)",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               border:
//                                   Border.all(color: const Color(0xFF02B7C8))),
//                           child: TextFormField(
//                             controller: milkQtycon,
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               calculateTotalPrice();
//                             },
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Selling Price per Litre (in Rupees)",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               border:
//                                   Border.all(color: const Color(0xFF02B7C8))),
//                           child: TextFormField(
//                             controller: salingPricePerLtrcon,
//                             keyboardType: TextInputType.number,
//                             onChanged: (value) {
//                               calculateTotalPrice();
//                             },
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Total Earnings from Milk (in Rupees)",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               border:
//                                   Border.all(color: const Color(0xFF02B7C8))),
//                           child: TextFormField(
//                             controller: milkEarncon,
//                             enabled: false,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Select Cattle Type",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20.0),
//                             border: Border.all(color: const Color(0xFF02B7C8)),
//                           ),
//                           padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                           child: Center(
//                             child: SizedBox(
//                               width: 250,
//                               child: DropdownButton<String>(
//                                 value: selectedCattle,
//                                 underline: SizedBox(),
//                                 items: <String>['Cow', 'Buffalo', 'Goat']
//                                     .map((String value) {
//                                   return DropdownMenuItem<String>(
//                                     value: value,
//                                     child: Text(value),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String? value) {
//                                   setState(() {
//                                     selectedCattle = value!;
//                                   });
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Note",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               border:
//                                   Border.all(color: const Color(0xFF02B7C8))),
//                           child: TextFormField(
//                             controller: notecon,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     )
//                   : Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Cattle Tag",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               border:
//                                   Border.all(color: const Color(0xFF02B7C8))),
//                           child: TextFormField(
//                             controller: tagcon,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 8, left: 8),
//                           child: Text(
//                             "Earnings from Cattle Sale (in Rupees)",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         Container(
//                           width: 300,
//                           height: 60,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               border:
//                                   Border.all(color: const Color(0xFF02B7C8))),
//                           child: TextFormField(
//                             controller: cattleEarncon,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//               const SizedBox(height: 20),
//               Center(
//                 child: FloatingActionButton.extended(
//                   onPressed: () {
//                     if (isMilkSaleSelected) {
//                       MilkSaleCondition();
//                     } else {
//                       saveCattleSale(tagcon.text);
//                     }
//                   },
//                   label: Text("Save"),
//                   icon: Icon(Icons.save),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//--------------below code have pdf functionality but not print

// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/cattleSaleClass.dart';
// import 'package:cattlefarming/Models/global.dart';
// import 'package:cattlefarming/Models/milksaleClass.dart';
// import 'package:cattlefarming/Screens/addCustomers.dart';
// import 'package:cattlefarming/Screens/expenseScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';

// class NewIncomeScreen extends StatefulWidget {
//   final String? Stag;
//   const NewIncomeScreen({Key? key, this.Stag}) : super(key: key);

//   @override
//   State<NewIncomeScreen> createState() => _NewIncomeScreenState();
// }

// class _NewIncomeScreenState extends State<NewIncomeScreen> {
//   TextEditingController datecon = TextEditingController();
//   TextEditingController milkQtycon = TextEditingController();
//   TextEditingController salingPricePerLtrcon = TextEditingController();
//   TextEditingController milkEarncon = TextEditingController();
//   TextEditingController tagcon = TextEditingController();
//   TextEditingController cattleEarncon = TextEditingController();
//   TextEditingController notecon = TextEditingController();
//   String? selectedCattle;

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

//   List<String> incomeTypeItem = [
//     'Cattle Sale',
//     'Milk Sale',
//   ];

//   bool isMilkSaleSelected = false;
//   bool isCattleSaleSelected = false;
//   String? incomeTypeSelected = 'Cattle Sale';

//   int? customerSelected;

//   double totalPrice = 0;
//   void calculateTotalPrice() {
//     double quantity = double.tryParse(milkQtycon.text) ?? 0.0;
//     double pricePerLiter = double.tryParse(salingPricePerLtrcon.text) ?? 0.0;

//     setState(() {
//       totalPrice = (quantity * pricePerLiter).toDouble();
//       milkEarncon.text = 'Rs $totalPrice';
//     });
//   }

//   List<MilkSaleRecord> milkSaleEntries = [];

//   int farmId = 1;

//   @override
//   void initState() {
//     super.initState();
//     isCattleSaleSelected = true;
//     fetchCustomerList();
//     tagcon.text = widget.Stag ?? '';
//   }

//   final ApiHandler apiHandler = ApiHandler();

//   void saveCattleSale(String cattleTag) async {
//     try {
//       final response = await apiHandler.saleCattle(
//         CattleSale(
//           id: 0, // Set the ID according to your requirement
//           date: datecon.text, // Set the date
//           amount:
//               double.tryParse(cattleEarncon.text), // Set the amount if needed
//           customerId: customerSelected!, // Set the customer ID
//           cattleTag: tagcon.text,
//           farmId: farmId, // Set the farm ID
//         ),
//       );
//       print(response); // Print the response or handle it as needed
//     } catch (e) {
//       print('Error saving cattle sale: $e');
//     }
//   }

//   void saveMilkSales(List<MilkSaleRecord> milkSales) {
//     try {
//       apiHandler.saveMilkSales(milkSales);
//     } catch (e) {
//       print('Error saving milk sales: $e');
//     }
//   }

//   void addMilkSaleEntry() {
//     MilkSaleRecord newEntry = MilkSaleRecord(
//       date: datecon.text,
//       cattleType: selectedCattle,
//       quantity: double.tryParse(milkQtycon.text) ?? 0.0,
//       pricePerLitre: double.tryParse(salingPricePerLtrcon.text) ?? 0.0,
//       totalPrice: totalPrice,
//       customerid: customerSelected!,
//       note: notecon.text,
//       farmId: farmId,
//     );

//     setState(() {
//       milkSaleEntries.add(newEntry);
//     });

//     milkQtycon.clear();
//     salingPricePerLtrcon.clear();
//     milkEarncon.clear();
//   }

//   bool checkMilk = true;
//   void MilkSaleCondition() {
//     if (checkMilk == true) {
//       addMilkSaleEntry();
//       saveMilkSales(milkSaleEntries);
//     } else {
//       addMilkSaleEntry();
//     }
//   }

//   List<dynamic> customersList = [];
//   Future<void> fetchCustomerList() async {
//     ApiHandler apiHandler = ApiHandler();
//     customersList = await apiHandler.getAllCustomer();
//     setState(() {
//       customerSelected = customersList.isNotEmpty ? 1 : 0;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "New Income",
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
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Select Customer",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 250,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: const Color(0xFF02B7C8)),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                     child: Center(
//                       child: SizedBox(
//                         width: 240,
//                         child: DropdownButton<int>(
//                           value: customerSelected,
//                           underline: SizedBox(),
//                           hint: Text("Select Customer"),
//                           items: [
//                             DropdownMenuItem<int>(
//                               value: 0,
//                               child: Text("Select Customer"),
//                             ),
//                             if (customersList.isNotEmpty)
//                               for (var i = 0; i < customersList.length; i++)
//                                 DropdownMenuItem<int>(
//                                   value: i + 1, // Start index from 1
//                                   child: Text(
//                                       '${customersList[i]['Name']}\n${customersList[i]['Contact']}'),
//                                 ),
//                           ],
//                           onChanged: (newSelectedIndex) {
//                             setState(() {
//                               customerSelected = newSelectedIndex!;
//                             });
//                           },
//                           isExpanded: true,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                         color: const Color(0xFF039BA8),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: IconButton(
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => AddCustomersScreen()));
//                         },
//                         icon: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                         )),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Select Income Type",
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
//                       value: incomeTypeSelected,
//                       underline: const SizedBox(),
//                       hint: const Text("Cattle Sale"),
//                       items: [
//                         DropdownMenuItem<String>(
//                           value: "Select Income Type",
//                           child: const Text("Select Income Type"),
//                         ),
//                         ...incomeTypeItem.map((String e) {
//                           return DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }).toList(),
//                       ],
//                       onChanged: (newValueSelected) {
//                         setState(() {
//                           incomeTypeSelected = newValueSelected!;
//                           if (incomeTypeSelected == "Milk Sale") {
//                             isMilkSaleSelected = true;
//                             isCattleSaleSelected = false;
//                           } else {
//                             isMilkSaleSelected = false;
//                             isCattleSaleSelected = true;
//                           }
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),
//               Visibility(
//                 visible: isCattleSaleSelected,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Cattle Tag",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: tagcon,
//                           decoration: InputDecoration(
//                             hintText: 'Cattle Tag',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Cattle Earnings",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: cattleEarncon,
//                           decoration: InputDecoration(
//                             hintText: 'Rs. 20000',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Visibility(
//                 visible: isMilkSaleSelected,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Milk Quantity",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: milkQtycon,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             hintText: 'Liter',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                           ),
//                           onChanged: (value) {
//                             calculateTotalPrice();
//                           },
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Saling Price/Litre",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: salingPricePerLtrcon,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             hintText: 'Rs. 20000',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                           ),
//                           onChanged: (value) {
//                             calculateTotalPrice();
//                           },
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Milk Earning",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: milkEarncon,
//                           readOnly: true,
//                           decoration: InputDecoration(
//                             hintText: 'Rs. 20000',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Cattle Type",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: DropdownButton<String>(
//                           value: selectedCattle,
//                           underline: const SizedBox(),
//                           hint: const Text("Select Cattle Type"),
//                           items: [
//                             DropdownMenuItem<String>(
//                               value: "Buffalo",
//                               child: Text("Buffalo"),
//                             ),
//                             DropdownMenuItem<String>(
//                               value: "Cow",
//                               child: Text("Cow"),
//                             ),
//                           ],
//                           onChanged: (newValueSelected) {
//                             setState(() {
//                               selectedCattle = newValueSelected!;
//                             });
//                           },
//                           isExpanded: true,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(bottom: 8, left: 8, top: 8),
//                       child: Text(
//                         "Note",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: notecon,
//                           decoration: InputDecoration(
//                             hintText: 'Write your note',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Visibility(
//                 visible: isMilkSaleSelected,
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 20),
//                   width: double.infinity,
//                   alignment: Alignment.center,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (customerSelected == 0 || datecon.text.isEmpty) {
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text('Error'),
//                               content:
//                                   Text('Please select a customer and date.'),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () => Navigator.of(context).pop(),
//                                   child: Text('OK'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       } else {
//                         if (isMilkSaleSelected) {
//                           MilkSaleCondition();
//                         }
//                       }
//                     },
//                     child: Text(
//                       'Add Milk Sale Entry',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(top: 20),
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (customerSelected == 0 || datecon.text.isEmpty) {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text('Error'),
//                             content: Text('Please select a customer and date.'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.of(context).pop(),
//                                 child: Text('OK'),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     } else {
//                       if (isCattleSaleSelected) {
//                         saveCattleSale(tagcon.text);
//                       } else if (isMilkSaleSelected) {
//                         saveMilkSales(milkSaleEntries);
//                       }
//                     }
//                   },
//                   child: Text(
//                     'Save',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//----------------New code
// import 'dart:io';
// import 'package:cattlefarming/Models/apiHandler.dart';
// import 'package:cattlefarming/Models/cattleSaleClass.dart';
// import 'package:cattlefarming/Models/global.dart';
// import 'package:cattlefarming/Models/milksaleClass.dart';
// import 'package:cattlefarming/Screens/addCustomers.dart';
// import 'package:cattlefarming/Screens/expenseScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';

// class NewIncomeScreen extends StatefulWidget {
//   final String? Stag;
//   const NewIncomeScreen({Key? key, this.Stag}) : super(key: key);

//   @override
//   State<NewIncomeScreen> createState() => _NewIncomeScreenState();
// }

// class _NewIncomeScreenState extends State<NewIncomeScreen> {
//   TextEditingController datecon = TextEditingController();
//   TextEditingController milkQtycon = TextEditingController();
//   TextEditingController salingPricePerLtrcon = TextEditingController();
//   TextEditingController milkEarncon = TextEditingController();
//   TextEditingController tagcon = TextEditingController();
//   TextEditingController cattleEarncon = TextEditingController();
//   TextEditingController notecon = TextEditingController();
//   String? selectedCattle;

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

//   List<String> incomeTypeItem = [
//     'Cattle Sale',
//     'Milk Sale',
//   ];

//   bool isMilkSaleSelected = false;
//   bool isCattleSaleSelected = false;
//   String? incomeTypeSelected = 'Cattle Sale';
//   int? customerSelected;

//   double totalPrice = 0;

//   List<Map<String, dynamic>> customers = [
//     {'Customer_id': 1, 'Name': 'Customer 1'},
//     {'Customer_id': 2, 'Name': 'Customer 2'},
//     // Add more customers
//   ];
//   void calculateTotalPrice() {
//     double quantity = double.tryParse(milkQtycon.text) ?? 0.0;
//     double pricePerLiter = double.tryParse(salingPricePerLtrcon.text) ?? 0.0;

//     setState(() {
//       totalPrice = (quantity * pricePerLiter).toDouble();
//       milkEarncon.text = 'Rs $totalPrice';
//     });
//   }

//   List<MilkSaleRecord> milkSaleEntries = [];
//   int farmId = 1;

//   @override
//   void initState() {
//     super.initState();
//     isCattleSaleSelected = true;
//     fetchCustomerList();
//     tagcon.text = widget.Stag ?? '';
//   }

//   final ApiHandler apiHandler = ApiHandler();

//   void saveCattleSale(String cattleTag) async {
//     try {
//       final response = await apiHandler.saleCattle(
//         CattleSale(
//           id: 0,
//           date: datecon.text,
//           amount: double.tryParse(cattleEarncon.text),
//           customerId: customerSelected!,
//           cattleTag: tagcon.text,
//           farmId: farmId,
//         ),
//       );
//       print(response);
//     } catch (e) {
//       print('Error saving cattle sale: $e');
//     }
//   }

//   void saveMilkSales(List<MilkSaleRecord> milkSales) {
//     try {
//       apiHandler.saveMilkSales(milkSales);
//     } catch (e) {
//       print('Error saving milk sales: $e');
//     }
//   }

//   void addMilkSaleEntry() {
//     MilkSaleRecord newEntry = MilkSaleRecord(
//       date: datecon.text,
//       cattleType: selectedCattle,
//       quantity: double.tryParse(milkQtycon.text) ?? 0.0,
//       pricePerLitre: double.tryParse(salingPricePerLtrcon.text) ?? 0.0,
//       totalPrice: totalPrice,
//       customerid: customerSelected!,
//       note: notecon.text,
//       farmId: farmId,
//     );

//     setState(() {
//       milkSaleEntries.add(newEntry);
//     });

//     milkQtycon.clear();
//     salingPricePerLtrcon.clear();
//     milkEarncon.clear();
//   }

//   bool checkMilk = true;
//   void MilkSaleCondition() {
//     if (checkMilk == true) {
//       addMilkSaleEntry();
//       saveMilkSales(milkSaleEntries);
//       generateInvoice(milkSaleEntries); // Generate invoice when saving
//     } else {
//       addMilkSaleEntry();
//     }
//   }

//   List<dynamic> customersList = [];
//   Future<void> fetchCustomerList() async {
//     ApiHandler apiHandler = ApiHandler();
//     customersList = await apiHandler.getAllCustomer();
//     setState(() {
//       customerSelected = customersList.isNotEmpty ? 1 : 0;
//     });
//   }

//   Future<void> generateInvoice(List<MilkSaleRecord> milkSales) async {
//     final pdf = pw.Document();
//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text("Invoice", style: pw.TextStyle(fontSize: 24)),
//               pw.SizedBox(height: 20),
//               pw.Text("Date: ${DateTime.now()}"),
//               pw.Text(
//                   "Customer: ${customersList[customerSelected! - 1]['Name']}"),
//               pw.SizedBox(height: 20),
//               pw.Text("Milk Sale Entries:"),
//               pw.Table.fromTextArray(
//                 context: context,
//                 data: <List<String>>[
//                   <String>[
//                     'Date',
//                     'Cattle Type',
//                     'Quantity (ltr)',
//                     'Price per Litre',
//                     'Total Price'
//                   ],
//                   ...milkSales.map((entry) => [
//                         entry.date,
//                         entry.cattleType ?? '',
//                         entry.quantity.toString(),
//                         entry.pricePerLitre.toString(),
//                         entry.totalPrice.toString(),
//                       ]),
//                 ],
//               ),
//               pw.SizedBox(height: 20),
//               pw.Text(
//                   "Total Amount: Rs ${milkSales.fold<double>(0.0, (sum, entry) => sum + entry.totalPrice)}"),
//             ],
//           );
//         },
//       ),
//     );

//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/invoice.pdf');
//     await file.writeAsBytes(await pdf.save());

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Invoice saved as invoice.pdf')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "New Income",
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
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Select Customer",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Container(
//                     width: 250,
//                     height: 70,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20.0),
//                       border: Border.all(color: const Color(0xFF02B7C8)),
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                     child: Center(
//                       child: SizedBox(
//                         width: 240,
//                         child: DropdownButton<int>(
//                           value: customerSelected,
//                           underline: SizedBox(),
//                           hint: Text("Select Customer"),
//                           items:
//                               customers.map<DropdownMenuItem<int>>((customer) {
//                             return DropdownMenuItem<int>(
//                               value: customer['Customer_id'],
//                               child: Text(
//                                 customer['Name'],
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             );
//                           }).toList(),
//                           onChanged: (value) {
//                             setState(() {
//                               customerSelected = value;
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => AddCustomersScreen()));
//                     },
//                     child: Icon(Icons.add, size: 35),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Income Type",
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
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Center(
//                   child: DropdownButton<String>(
//                     value: incomeTypeSelected,
//                     underline: SizedBox(),
//                     hint: Text("Select"),
//                     items: incomeTypeItem
//                         .map((item) => DropdownMenuItem<String>(
//                               value: item,
//                               child: Text(
//                                 item,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         incomeTypeSelected = value;
//                         if (incomeTypeSelected == 'Milk Sale') {
//                           isMilkSaleSelected = true;
//                           isCattleSaleSelected = false;
//                         } else {
//                           isMilkSaleSelected = false;
//                           isCattleSaleSelected = true;
//                         }
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               if (isMilkSaleSelected)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Milk Quantity in Liter",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: milkQtycon,
//                           decoration: InputDecoration(
//                               hintText: 'Liters',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Selling Price per Liter",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: salingPricePerLtrcon,
//                           decoration: InputDecoration(
//                               hintText: 'Price per Liter',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                           onChanged: (value) {
//                             calculateTotalPrice();
//                           },
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Total Earnings",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: milkEarncon,
//                           decoration: InputDecoration(
//                               hintText: 'Rs',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Note",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: notecon,
//                           decoration: InputDecoration(
//                               hintText: 'Note',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: MilkSaleCondition,
//                       child: Text("Save Milk Sale"),
//                     ),
//                   ],
//                 ),
//               if (isCattleSaleSelected)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Cattle Tag",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: tagcon,
//                           decoration: InputDecoration(
//                               hintText: 'Cattle Tag',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Cattle Earnings",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: cattleEarncon,
//                           decoration: InputDecoration(
//                               hintText: 'Rs',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 8, left: 8),
//                       child: Text(
//                         "Note",
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ),
//                     Container(
//                       width: 300,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         border: Border.all(color: const Color(0xFF02B7C8)),
//                       ),
//                       child: Center(
//                         child: TextFormField(
//                           controller: notecon,
//                           decoration: InputDecoration(
//                               hintText: 'Note',
//                               border: InputBorder.none,
//                               contentPadding: EdgeInsets.symmetric(
//                                   horizontal: 30.0, vertical: 10.0)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         saveCattleSale(tagcon.text);
//                       },
//                       child: Text("Save Cattle Sale"),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
