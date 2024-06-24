import 'package:cattlefarming/Screens/vaccineInjectScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VaccineCourseScreen extends StatefulWidget {
  const VaccineCourseScreen({super.key});

  @override
  State<VaccineCourseScreen> createState() => _VaccineCourseScreenState();
}

class _VaccineCourseScreenState extends State<VaccineCourseScreen> {
  TextEditingController vaccineNamecon = TextEditingController();
  TextEditingController totalDosecon = TextEditingController();
  TextEditingController durationcon = TextEditingController();
  TextEditingController pricecon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Vaccination Course",
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
                "Vaccine Name",
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
                "Total Dose",
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
                  controller: totalDosecon,
                  decoration: const InputDecoration(
                    hintText: '3',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8),
              child: Text(
                "Duration",
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
                  controller: durationcon,
                  decoration: const InputDecoration(
                    hintText: '3 Month',
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
                "Price",
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
                  controller: durationcon,
                  decoration: const InputDecoration(
                    hintText: 'Rs 1500',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 170, left: 140),
            //   child: SizedBox(
            //       width: 140,
            //       height: 60,
            //       child: ElevatedButton(
            //         style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all<Color>(
            //           const Color(0xFF039BA8),
            //         )),
            //         onPressed: () {
            //           final totalDoses = int.tryParse(totalDosecon.text) ?? 0;
            //           if (totalDoses > 0) {
            //             // Navigate to InjectVaccinationScreen with the totalDoses value
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => VaccineInjectScreen(
            //                   totalDoses: totalDoses,
            //                 ),
            //               ),
            //             );
            //           }
            //         },
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //           children: [
            //             Icon(
            //               Icons.add,
            //               color: Colors.white,
            //             ),
            //             Text(
            //               "Add",
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 25,
            //               ),
            //             ),
            //           ],
            //         ),
            //       )),
            // ),
          ]),
        ),
      ),
    );
  }
}
