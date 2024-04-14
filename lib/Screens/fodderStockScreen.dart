import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FodderStockScreen extends StatefulWidget {
  const FodderStockScreen({super.key});

  @override
  State<FodderStockScreen> createState() => _FodderStockScreenState();
}

class _FodderStockScreenState extends State<FodderStockScreen> {
  TextEditingController datecon = TextEditingController();
  TextEditingController foodQtycon = TextEditingController();
  TextEditingController foodPricecon = TextEditingController();
  TextEditingController foodcon = TextEditingController();

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
            "Add Fooder Stock",
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
                  "Enter Food",
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
                    controller: foodcon,
                    decoration: const InputDecoration(
                      hintText: 'Choker',
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
                  "Enter Quantity",
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
                    controller: foodQtycon,
                    decoration: const InputDecoration(
                      hintText: '220 KG',
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
                  "Enter Amount in PKR",
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
                    controller: foodPricecon,
                    decoration: const InputDecoration(
                      hintText: '3600',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
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
