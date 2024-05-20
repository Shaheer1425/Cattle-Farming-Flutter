import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/temperatureClass.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  TextEditingController temperaturecon = TextEditingController();
  ApiHandler apiHandler = ApiHandler();
  Future<void> _addTemperature() async {
    final temperature = temperaturecon.text;
    if (temperature.isEmpty) {
      // Show an error message if the temperature is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter a temperature')),
      );
      return;
    }

    final now = DateTime.now();
    final date = DateFormat('yyyy-MM-dd').format(now);
    final time = DateFormat('hh:mm a').format(now); // Includes AM/PM

    final record = TemperatureRecord(
      temperature: temperature,
      date: date,
      time: time,
    );

    final responseMessage = await apiHandler.saveTemperature(record);
    if (responseMessage ==
        'Temperature ${temperaturecon.text} added successfully') {
      Navigator.pop(context, record);
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(responseMessage)),
    );
    // if (success) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Temperature added successfully')),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Failed to add temperature')),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Temperature",
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
                  "Enter Temperature",
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
                    controller: temperaturecon,
                    decoration: const InputDecoration(
                      hintText: '30 °C',
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
                        ),
                      ),
                      onPressed: _addTemperature,
                      child: const Text(
                        "Add Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
