import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  TextEditingController tagcon = TextEditingController();
  TextEditingController weightcon = TextEditingController();
  TextEditingController datecon = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Weight Projection",
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 238, 243, 243),
                      borderRadius: BorderRadius.all(Radius.circular(85)),
                      border: Border.all(color: const Color(0xFF02B7C8)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                              0xFF02B7C8), // Shadow color and opacity
                          spreadRadius: 1, // Shadow spread radius
                          blurRadius: 5, // Shadow blur radius
                          offset: Offset(0, 0), // Shadow offset
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 35,
                    left: 24,
                    child: Image.asset(
                      "assets/images/weight.png",
                      //fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
                "Enter Weight",
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
                  controller: weightcon,
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
                "Select Date",
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
              padding: const EdgeInsets.only(top: 50),
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
          ]),
        ),
      ),
    );
  }
}
