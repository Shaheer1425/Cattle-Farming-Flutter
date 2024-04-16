import 'package:flutter/material.dart';

class NewExpenseScreen extends StatefulWidget {
  const NewExpenseScreen({super.key});

  @override
  State<NewExpenseScreen> createState() => _NewExpenseScreenState();
}

class _NewExpenseScreenState extends State<NewExpenseScreen> {
  TextEditingController datecon = TextEditingController();
  TextEditingController fodderQtycon = TextEditingController();

  TextEditingController fodderSpendcon = TextEditingController();
  TextEditingController vaccineNamecon = TextEditingController();
  TextEditingController vaccineSpendcon = TextEditingController();
  TextEditingController notecon = TextEditingController();

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

  List<String> expenseTypeItem = [
    'Fodder',
    'Vaccination',
  ];
  bool isFodderSelected = false;
  bool isVaccineSelected = false;
  String? expenseTypeSelected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFodderSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "New Expense",
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
                  "Select Expense Type",
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
                      value: expenseTypeSelected,
                      underline: const SizedBox(),
                      hint: const Text("Fodder"),
                      items: [
                        DropdownMenuItem<String>(
                          value: "Select Expense Type",
                          child: const Text("Select Expense Type"),
                        ),
                        ...expenseTypeItem.map((String e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }),
                      ],
                      onChanged: (newSelectedVal) {
                        setState(() {
                          expenseTypeSelected = newSelectedVal;
                          // Update the boolean variable based on the selection
                          isFodderSelected = (newSelectedVal == 'Fodder');
                          isVaccineSelected = (newSelectedVal == 'Vaccination');
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),

              // Conditionally render "Enter Cost in PKR" text and TextFormField
              if (isFodderSelected) ...[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 8),
                  child: Text(
                    "Fodder Quantity",
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
                      controller: fodderQtycon,
                      decoration: const InputDecoration(
                        hintText: '250 KG',
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
                    "How much you Spend",
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
                      controller: fodderSpendcon,
                      decoration: const InputDecoration(
                        hintText: 'Rs 8000',
                        hintStyle: TextStyle(),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                      ),
                    ),
                  ),
                ),
              ],

              if (isVaccineSelected) ...[
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
                    child: TextFormField(
                      controller: vaccineNamecon,
                      decoration: const InputDecoration(
                        hintText: 'Bovine Viral Diarrhea',
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
                    "How much you Spend",
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
                      controller: vaccineSpendcon,
                      decoration: const InputDecoration(
                        hintText: 'Rs 1500',
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
                        onPressed: () {},
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
