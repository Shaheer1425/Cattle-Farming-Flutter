import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Models/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddCattle extends StatefulWidget {
  const AddCattle({super.key});

  @override
  State<AddCattle> createState() => _AddCattleState();
}

class _AddCattleState extends State<AddCattle> {
  TextEditingController tagcon = TextEditingController();
  TextEditingController weightcon = TextEditingController();
  TextEditingController birthcon = TextEditingController();
  TextEditingController entryOnFarmcon = TextEditingController();
  TextEditingController breedcon = TextEditingController();
  TextEditingController costcon = TextEditingController();

  String? selectedGender;

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1947),
        lastDate: DateTime(2050));
    if (datePicker != null) {
      setState(() {
        controller.text = datePicker.toString().split(' ')[0];
      });
    }
  }

  int farmId = 1;
  @override
  void initState() {
    super.initState();
    // farmId = FarmManager.getSelectedFarmId();
  }

  // List<String> cattleBreedItem = [
  //   'Sahiwal',
  //   'Red Sindhi',
  //   'Cholistan',
  //   'Nili-Ravi',
  //   'Bhagnari',
  //   'Kundhi',
  //   'Dajal',
  //   'Barbari',
  //   'Beetal',
  // ];
  List<String> cattleTypeItem = [
    'Cow',
    'Buffalo',
    'Goat',
  ];
  List<String> cattleObtainedItem = [
    'Born on Farm',
    'Purchased',
  ];
  bool isPurchasedSelected = false;
  String? breedSelected;
  String? typeSelected;
  String? obtainedSelected;

  @override
  Widget build(BuildContext context) {
    // Retrieve the hint color from the theme
    final hintColor = Theme.of(context).inputDecorationTheme.hintStyle?.color;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Add Cattle",
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
              // Tag Input
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
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),
              // Gender Selection
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Radio(
                      value: "Male",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value as String;
                        });
                      }),
                  Text("Male"),
                  SizedBox(
                    width: 20,
                  ),
                  Radio(
                      value: "Female",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value as String;
                        });
                      }),
                  Text("Female"),
                ],
              ),
              // Weight Input
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
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),
              // Date of Birth Input
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Date of Birth",
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
                    onTap: () => selectDate(context, birthcon),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: birthcon,
                        decoration: InputDecoration(
                            hintText: '2023-11-14',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: hintColor,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              // Date of Entry on Farm Input
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Date of Entry on Farm",
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
                    onTap: () => selectDate(context, entryOnFarmcon),
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: entryOnFarmcon,
                        decoration: InputDecoration(
                            hintText: '2023-11-14',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10.0),
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: hintColor,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              // Cattle Breed Dropdown
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Cattle Breed",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // Cattle Breed Dropdown
              // Container(
              //   width: 300,
              //   height: 60,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20.0),
              //     border: Border.all(color: const Color(0xFF02B7C8)),
              //   ),
              //   child: Center(
              //     child: SizedBox(
              //       width: 240,
              //       child: DropdownButton<String>(
              //         value: breedSelected,
              //         underline: const SizedBox(),
              //         hint: const Text("Sahiwal"),
              //         items: cattleBreedItem.map((String e) {
              //           return DropdownMenuItem<String>(
              //             value: e,
              //             child: Text(e),
              //           );
              //         }).toList(),
              //         onChanged: (newSelectedVal) {
              //           setState(() {
              //             breedSelected = newSelectedVal;
              //           });
              //         },
              //         isExpanded: true,
              //       ),
              //     ),
              //   ),
              // ),

              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: const Color(0xFF02B7C8))),
                child: Center(
                  child: TextFormField(
                    controller: breedcon,
                    decoration: const InputDecoration(
                      hintText: 'Sahiwali',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Cattle Type",
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
                      value: typeSelected,
                      underline: const SizedBox(),
                      hint: const Text("Cow"),
                      items: cattleTypeItem.map((String e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (newSelectedVal) {
                        setState(() {
                          typeSelected = newSelectedVal;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              // Obtained From Dropdown
              Padding(
                padding: const EdgeInsets.only(bottom: 8, left: 8),
                child: Text(
                  "Obtained From",
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
                      value: obtainedSelected,
                      underline: const SizedBox(),
                      hint: const Text("Born on Farm"),
                      items: cattleObtainedItem.map((String e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (newSelectedVal) {
                        setState(() {
                          obtainedSelected = newSelectedVal;
                          isPurchasedSelected = (newSelectedVal == "Purchased");
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              // Cost Input (only if Purchased is selected)
              if (isPurchasedSelected)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8, left: 8),
                      child: Text(
                        "Cost",
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
                          controller: costcon,
                          decoration: const InputDecoration(
                            hintText: '20,000',
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 30.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 30),
              // Add Now Button
              Center(
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF02B7C8),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF02B7C8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: () async {
                      if (tagcon.text.isEmpty ||
                          weightcon.text.isEmpty ||
                          birthcon.text.isEmpty ||
                          entryOnFarmcon.text.isEmpty ||
                          breedSelected == null ||
                          typeSelected == null ||
                          obtainedSelected == null ||
                          (isPurchasedSelected && costcon.text.isEmpty)) {
                        // Display a snackbar if any of the fields are empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill in all fields'),
                          ),
                        );
                        return;
                      }

                      // Create a Map with the input data
                      Map<String, dynamic> cattleData = {
                        'tag': tagcon.text,
                        'gender': selectedGender,
                        'weight': weightcon.text,
                        'dob': birthcon.text,
                        'DateOfEntryFarm': entryOnFarmcon.text,
                        'CattleBreed': breedSelected,
                        'CattleType': typeSelected,
                        'CattleObtained': obtainedSelected,
                        'Status': 'Alive',
                        'FarmID': farmId,
                        if (isPurchasedSelected) 'cost': costcon.text,
                      };

                      try {
                        // Call the API to add the cattle
                        String response =
                            await ApiHandler().addCattle(cattleData);
                        // Display a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Cattle added successfully! $response'),
                          ),
                        );
                      } catch (e) {
                        // Display an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to add cattle. Error: $e'),
                          ),
                        );
                      }
                    },
                    child: const Center(
                      child: Text(
                        "Add Now",
                        style: TextStyle(color: Colors.white, fontSize: 25),
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




// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// class AddCattle extends StatefulWidget {
//   const AddCattle({super.key});

//   @override
//   State<AddCattle> createState() => _AddCattleState();
// }

// class _AddCattleState extends State<AddCattle> {
//   TextEditingController tagcon = TextEditingController();
//   TextEditingController weightcon = TextEditingController();
//   TextEditingController birthcon = TextEditingController();
//   TextEditingController entryOnFarmcon = TextEditingController();
//   TextEditingController costcon = TextEditingController();
//   String? selectedGender;

//   Future<void> selectDate(BuildContext context) async {
//     final DateTime? datePicker = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1947),
//         lastDate: DateTime(2050));
//     if (datePicker != null) {
//       setState(() {
//         entryOnFarmcon.text = datePicker.toString().split(' ')[0];
//       });
//     }
//   }

//   List<String> cattleBreedItem = [
//     'Sahiwal',
//     'Red Sindhi',
//     'Cholistan',
//     'Bhagnari',
//     'Kundhi',
//   ];
//   List<String> cattleTypeItem = [
//     'Cow',
//     'Buffalo',
//     'Goat',
//   ];
//   List<String> cattleObtainedItem = [
//     'Born on Farm',
//     'Purchased',
//   ];
//   bool isPurchasedSelected = false;
//   String? breedSelected;
//   String? typeSelected;
//   String? obtainedSelected;

//   @override
//   Widget build(BuildContext context) {
//     // Retrieve the hint color from the theme
//     final hintColor = Theme.of(context).inputDecorationTheme.hintStyle?.color;
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             "Add Cattle",
//             style: TextStyle(
//               fontSize: 25,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Tag",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: tagcon,
//                     decoration: const InputDecoration(
//                       hintText: 'C14F',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Text(
//                   "Gender",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Radio(
//                       value: "Male",
//                       groupValue: selectedGender,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedGender = value as String;
//                         });
//                       }),
//                   Text("Male"),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Radio(
//                       value: "Female",
//                       groupValue: selectedGender,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedGender = value as String;
//                         });
//                       }),
//                   Text("Female"),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Enter Weight",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: weightcon,
//                     decoration: const InputDecoration(
//                       hintText: '250 KG',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Date of Birth",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: GestureDetector(
//                     onTap: () => selectDate(context),
//                     child: AbsorbPointer(
//                       //AbsorbPointer used to prevent user input in textformfield
//                       child: TextFormField(
//                         controller: birthcon,
//                         decoration: InputDecoration(
//                             hintText: '2023-11-14',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                             suffixIcon: Icon(
//                               Icons.calendar_month_outlined,
//                               color: Theme.of(context)
//                                   .inputDecorationTheme
//                                   .hintStyle
//                                   ?.color,
//                             )),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Date of Entry on Farm",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: GestureDetector(
//                     onTap: () => selectDate(context),
//                     child: AbsorbPointer(
//                       //AbsorbPointer used to prevent user input in textformfield
//                       child: TextFormField(
//                         controller: entryOnFarmcon,
//                         decoration: InputDecoration(
//                             hintText: '2023-11-14',
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 30.0, vertical: 10.0),
//                             suffixIcon: Icon(
//                               Icons.calendar_month_outlined,
//                               color: hintColor, // Use the hint color
//                             )),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Cattle Breed",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: const Color(0xFF02B7C8)),
//                 ),
//                 child: Center(
//                   child: SizedBox(
//                     width: 240,
//                     child: DropdownButton<String>(
//                       value: breedSelected,
//                       underline: SizedBox(),
//                       hint: Text("Sahiwal"),
//                       items: [
//                         DropdownMenuItem<String>(
//                           value: "Select Breed",
//                           child: Text("Select Breed"),
//                         ),
//                         ...cattleBreedItem.map((String e) {
//                           return DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }),
//                       ],
//                       onChanged: (newSelectedVal) {
//                         setState(() {
//                           this.breedSelected = newSelectedVal!;
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Cattle Type",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: const Color(0xFF02B7C8)),
//                 ),
//                 child: Center(
//                   child: SizedBox(
//                     width: 240,
//                     child: DropdownButton<String>(
//                       value: typeSelected,
//                       underline: SizedBox(),
//                       hint: Text("Cow"),
//                       items: [
//                         DropdownMenuItem<String>(
//                           value: "Select Type",
//                           child: Text("Select Type"),
//                         ),
//                         ...cattleTypeItem.map((String e) {
//                           return DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }),
//                       ],
//                       onChanged: (newSelectedVal) {
//                         setState(() {
//                           this.typeSelected = newSelectedVal!;
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Cattle Obtained",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               /*Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: const Color(0xFF02B7C8)),
//                 ),
//                 child: Center(
//                   child: SizedBox(
//                     width: 240,
//                     child: DropdownButton<String>(
//                       value: obtainedSelected,
//                       underline: SizedBox(),
//                       hint: Text("Purchased"),
//                       items: [
//                         DropdownMenuItem<String>(
//                           value: "Select Obtained",
//                           child: Text("Select Obtained"),
//                         ),
//                         ...cattleObtainedItem.map((String e) {
//                           return DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }),
//                       ],
//                       onChanged: (newSelectedVal) {
//                         setState(() {
//                           this.obtainedSelected = newSelectedVal!;
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 8, left: 8),
//                 child: Text(
//                   "Enter Cost in PKR",
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8))),
//                 child: Center(
//                   child: TextFormField(
//                     controller: tagcon,
//                     decoration: const InputDecoration(
//                       hintText: '220000',
//                       hintStyle: TextStyle(),
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                     ),
//                   ),
//                 ),
//               ),*/

//               Container(
//                 width: 300,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.0),
//                   border: Border.all(color: const Color(0xFF02B7C8)),
//                 ),
//                 child: Center(
//                   child: SizedBox(
//                     width: 240,
//                     child: DropdownButton<String>(
//                       value: obtainedSelected,
//                       underline: const SizedBox(),
//                       hint: const Text("Purchased"),
//                       items: [
//                         DropdownMenuItem<String>(
//                           value: "Select Obtained",
//                           child: const Text("Select Obtained"),
//                         ),
//                         ...cattleObtainedItem.map((String e) {
//                           return DropdownMenuItem<String>(
//                             value: e,
//                             child: Text(e),
//                           );
//                         }),
//                       ],
//                       onChanged: (newSelectedVal) {
//                         setState(() {
//                           obtainedSelected = newSelectedVal;
//                           // Update the boolean variable based on the selection
//                           isPurchasedSelected = (newSelectedVal == 'Purchased');
//                         });
//                       },
//                       isExpanded: true,
//                     ),
//                   ),
//                 ),
//               ),

//               // Conditionally render "Enter Cost in PKR" text and TextFormField
//               if (isPurchasedSelected) ...[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8, left: 8),
//                   child: Text(
//                     "Enter Cost in PKR",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//                 Container(
//                   width: 300,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     border: Border.all(color: const Color(0xFF02B7C8)),
//                   ),
//                   child: Center(
//                     child: TextFormField(
//                       controller: costcon,
//                       decoration: const InputDecoration(
//                         hintText: '220000',
//                         hintStyle: TextStyle(),
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//               Padding(
//                 padding: const EdgeInsets.only(top: 15),
//                 child: Center(
//                   child: SizedBox(
//                       width: 200,
//                       height: 60,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                           const Color(0xFF039BA8),
//                         )),
//                         onPressed: () {},
//                         child: const Text(
//                           "Add Now",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                           ),
//                         ),
//                       )),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
