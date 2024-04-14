import 'package:cattlefarming/Screens/expenseScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class NewIncomeScreen extends StatefulWidget {
  const NewIncomeScreen({super.key});

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
    'Milk Sale',
    'Cattle Sale',
  ];
  bool isMilkSaleSelected = false;
  bool isCattleSaleSelected = false;
  String? incomeTypeSelected;

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
                      hint: const Text("Milk Sale"),
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
                      controller: milkEarncon,
                      decoration: const InputDecoration(
                        hintText: 'Rs 3600',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                    ),
                  ),
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

              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Write Note",
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
                    controller: notecon,
                    decoration: const InputDecoration(
                      hintText: 'Write Some Note',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
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
                          const Color(0xFF039BA8),
                        )),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewExpenseScreen()));
                        },
                        child: const Text(
                          "Add Now",
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
