import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class consumeFodderScreen extends StatefulWidget {
  const consumeFodderScreen({super.key});

  @override
  State<consumeFodderScreen> createState() => _consumeFodderScreenState();
}

class _consumeFodderScreenState extends State<consumeFodderScreen> {
  TextEditingController tagcon = TextEditingController();
  TextEditingController datecon = TextEditingController();
  TextEditingController qtycon = TextEditingController();

  String? selectedCattle;
  bool isNormalSelected = true;

  Color myColor() {
    // Return the appropriate color based on the value of isNormalSelected
    if (isNormalSelected) {
      return Color(
          0xFF02B7C8); // Return your desired color if isNormalSelected is true
    } else {
      return Colors.grey; // Return another color if isNormalSelected is false
    }
  }
  // bool isSpecialSelected = false;

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
            "Consume Fodder",
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
                        isNormalSelected
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
                        isNormalSelected = true;
                      });
                    },
                    child: const Text(
                      "Normal",
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
                          !isNormalSelected
                              ? const Color(0xFF039BA8)
                              : Colors.grey,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .zero, // Set the border radius to 0 for square corners
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isNormalSelected = false;
                        });
                      },
                      child: const Text(
                        "Special",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isNormalSelected) ...[
                    SizedBox(
                      height: 10,
                    ),
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
                            value: "Cow and Buffalo",
                            groupValue: selectedCattle,
                            onChanged: (value) {
                              setState(() {
                                selectedCattle = value as String;
                              });
                            }),
                        Text(
                          "Cow and Buffalo",
                          style: TextStyle(fontSize: 17),
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
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        "Select Fodder",
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
                            value: fodderItemSelected,
                            underline: SizedBox(),
                            hint: Text("Choker"),
                            items: [
                              DropdownMenuItem<String>(
                                value: "Select Fodder",
                                child: Text("Select Fodder"),
                              ),
                              ...fodderItem.map((String e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                );
                              }),
                            ],
                            onChanged: (newSelectedVal) {
                              setState(() {
                                this.fodderItemSelected = newSelectedVal!;
                              });
                            },
                            isExpanded: true,
                          ),
                        ),
                      ),
                    ),
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
                  ],
                  if (!isNormalSelected) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        "Cattle Tag",
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
                          decoration: InputDecoration(
                            hintText: 'C14F',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        "Select Food",
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
                          controller: qtycon,
                          decoration: InputDecoration(
                            hintText: 'Choker',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        "Quantity",
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
                          controller: qtycon,
                          decoration: InputDecoration(
                            hintText: '30 KG',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30.0,
                              vertical: 10.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                        border: Border.all(color: const Color(0xFF02B7C8)),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () => selectDate(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: datecon,
                              decoration: InputDecoration(
                                hintText: '2023-11-14',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 10.0,
                                ),
                                suffixIcon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Theme.of(context)
                                      .inputDecorationTheme
                                      .hintStyle
                                      ?.color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Center(
                      child: SizedBox(
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                              const Color(0xFF039BA8),
                            )),
                            onPressed: () {},
                            child: const Text(
                              "Consume",
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
          ],
        ),
      ),
    );
  }
}
