import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/customerClass.dart';
import 'package:cattlefarming/Models/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCustomersScreen extends StatefulWidget {
  const AddCustomersScreen({super.key});

  @override
  State<AddCustomersScreen> createState() => _AddCustomersScreenState();
}

class _AddCustomersScreenState extends State<AddCustomersScreen> {
  TextEditingController namecon = TextEditingController();
  TextEditingController addresscon = TextEditingController();
  TextEditingController contactcon = TextEditingController();

  final ApiHandler apiHandler = ApiHandler();
  int farmId = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //farmId = FarmManager.getSelectedFarmId();
  }

  Future<void> saveCustomer() async {
    try {
      // Create a Weight object with the input values
      final customer = CustomerRecord(
        Name: namecon.text,
        address: addresscon.text,
        contact: contactcon.text,
        //   farmId: farmId
      );

      // Call the API to save the weight
      final responseMessage = await apiHandler.saveCustomer(customer);
      if (responseMessage == 'Customer ${namecon.text} added successfully') {
        Navigator.pop(context, customer);
      }

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseMessage)),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save Customer: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Customer",
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
                      "assets/images/customer.png",
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
                "Name",
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
                  controller: namecon,
                  decoration: const InputDecoration(
                    hintText: 'Mazhar',
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
                "Address",
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
                  controller: addresscon,
                  keyboardType: TextInputType.streetAddress,
                  decoration: const InputDecoration(
                    hintText: 'Satelite Twon, Rawalpindi',
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
                "Contact",
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
                  controller: contactcon,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: '03012345678',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
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
                      onPressed: saveCustomer,
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
