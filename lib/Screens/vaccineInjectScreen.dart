import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class VaccineInjectScreen extends StatefulWidget {
  final int totalDoses;

  VaccineInjectScreen({required this.totalDoses});

  @override
  State<VaccineInjectScreen> createState() => _VaccineInjectScreenState();
}

class _VaccineInjectScreenState extends State<VaccineInjectScreen> {
  TextEditingController tagcon = TextEditingController();
  TextEditingController datecon = TextEditingController();
  TextEditingController milkproducedcon = TextEditingController();
  TextEditingController milkUsedcon = TextEditingController();
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

  List<String> vaccineItem = [
    'Bovine Viral Diarrhea',
    'Leptospirosis',
    'Clostridial',
    'Infectious Bovine Rhinotracheitis',
  ];

  String? vaccineSelected;

  // List to track which buttons have been clicked
  late List<bool> buttonClicked;

  @override
  void initState() {
    super.initState();
    // Initialize buttonClicked list with false values
    buttonClicked = List.filled(widget.totalDoses, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Inject Vaccine",
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
                  "Tag",
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
              SizedBox(
                height: 10,
              ),
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
                  child: SizedBox(
                    width: 240,
                    child: DropdownButton<String>(
                      value: vaccineSelected,
                      underline: SizedBox(),
                      hint: Text("Bovine Viral Diarrhea"),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Select Type',
                          child: Text("Select Type"),
                        ),
                        ...vaccineItem.map((String e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }),
                      ],
                      onChanged: (newSelectedVal) {
                        setState(() {
                          this.vaccineSelected = newSelectedVal!;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Click on the dose buttons to mark them as injected:',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Generate buttons based on the total number of doses
                    Container(
                      width: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.totalDoses,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  buttonClicked[index]
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius
                                        .zero, // Set the border radius to 0 for square corners
                                  ),
                                ),
                              ),
                              onPressed: () {
                                // Change the color of the button when clicked
                                setState(() {
                                  buttonClicked[index] = true;
                                });
                              },
                              child: Text(
                                'Dose ${index + 1}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              /* Text(
                'Click on the dose buttons to mark them as injected:',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Generate buttons based on the total number of doses
                    Container(
                      width: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            widget.totalDoses + 1, // Include one extra button
                        itemBuilder: (context, index) {
                          if (index < widget.totalDoses) {
                            // Dose button
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    buttonClicked[index]
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero, // Set the border radius to 0 for square corners
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Change the color of the button when clicked
                                  setState(() {
                                    buttonClicked[index] = true;
                                  });
                                },
                                child: Text(
                                  'Dose ${index + 1}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            );
                          } else {
                            // Course Complete button
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.blue,
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius
                                          .zero, // Set the border radius to 0 for square corners
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  // Handle course complete action
                                  // For instance, show a message or navigate to another screen
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text("Course Complete"),
                                      content: Text(
                                          "You have completed the vaccine course!"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("OK"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: Text(
                                  'Course Complete',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),*/
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
