import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:flutter/material.dart';

class AddFarmScreen extends StatefulWidget {
  const AddFarmScreen({super.key});

  @override
  State<AddFarmScreen> createState() => _AddFarmScreenState();
}

class _AddFarmScreenState extends State<AddFarmScreen> {
  TextEditingController namecon = TextEditingController();
  TextEditingController citycon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Farm",
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Text(
                "Enter Farm Name",
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
                    hintText: 'Happy Hooves Ranch',
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
                "Enter City",
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
                  controller: citycon,
                  decoration: const InputDecoration(
                    hintText: 'Rawalpindi',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF039BA8),
                      )),
                      onPressed: () async {
                        if (namecon.text.isEmpty || citycon.text.isEmpty) {
                          // Display a snackbar if any of the fields are empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields'),
                            ),
                          );
                          return;
                        }

                        // Create a Map with the input data
                        Map<String, dynamic> farmData = {
                          'Name': namecon.text,
                          'City': citycon.text,
                        };

                        try {
                          // Call the API to add the cattle
                          String response =
                              await ApiHandler().addFarm(farmData);
                          // Display a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(response),
                            ),
                          );
                        } catch (e) {
                          // Display an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to add Farm. Error: $e'),
                            ),
                          );
                        }
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
          ]),
        ),
      ),
    );
  }
}
