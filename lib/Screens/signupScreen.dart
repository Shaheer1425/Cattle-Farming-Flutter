import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/signInScreen.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecon = TextEditingController();
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  TextEditingController confirmPassCon = TextEditingController();
  TextEditingController contactCon = TextEditingController();
  List<dynamic> farmList = [];
  int farmSelected = -1;
  String? roleSelected;

  @override
  void initState() {
    super.initState();
    fetchFarmList();
  }

  List<String> roleItem = ['Admin', 'Manager', 'Worker', 'Doctor'];

  Future<void> fetchFarmList() async {
    ApiHandler apiHandler = ApiHandler();
    farmList = await apiHandler.getallfarm();
    setState(() {
      farmSelected = farmList.isNotEmpty ? 0 : -1;
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                  width: 400,
                  height: 330,
                  child: Stack(
                    children: <Widget>[
                      Image.asset("assets/images/loginScreen.jpg",
                          fit: BoxFit.cover),
                      const Positioned(
                          bottom: 20,
                          left: 100,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: const Color(0xFF02B7C8))),
                child: Center(
                  child: TextFormField(
                    controller: namecon,
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: const Color(0xFF02B7C8))),
                child: Center(
                  child: TextFormField(
                    controller: emailcon,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   width: 300,
              //   height: 70,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(40.0),
              //       border: Border.all(color: const Color(0xFF02B7C8))),
              //   child: Center(
              //     child: TextFormField(
              //       controller: passcon,
              //       decoration: const InputDecoration(
              //         hintText: 'Password',
              //         hintStyle: TextStyle(),
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
              //       ),
              //       validator: (value) {
              //         if (value == null || value.isEmpty) {
              //           return 'Please enter a password.';
              //         }
              //         if (value.length < 6) {
              //           return 'Password must be at least 6 characters long.';
              //         }
              //         passcon.text = value;
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: 300,
              //   height: 70,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(40.0),
              //       border: Border.all(color: const Color(0xFF02B7C8))),
              //   child: Center(
              //     child: TextFormField(
              //       controller: confirmPassCon,
              //       decoration: const InputDecoration(
              //         hintText: 'Confirm Password',
              //         hintStyle: TextStyle(),
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
              //       ),
              //       validator: (value) {
              //         if (value == null || value.isEmpty) {
              //           return 'Please confirm your password.';
              //         }
              //         if (value != passcon) {
              //           return 'Passwords do not match.';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),

              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: const Color(0xFF02B7C8)),
                ),
                child: Center(
                  child: TextFormField(
                    controller: passcon,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),

              // Container(
              //   width: 300,
              //   height: 70,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(40.0),
              //     border: Border.all(color: const Color(0xFF02B7C8)),
              //   ),
              //   child: Center(
              //     child: TextFormField(
              //       controller: passcon,
              //       decoration: const InputDecoration(
              //         hintText: 'Password',
              //         hintStyle: TextStyle(),
              //         border: InputBorder.none,
              //         contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
              //       ),
              //       validator: (value) {
              //         if (value == null || value.isEmpty) {
              //           return 'Please enter a password.';
              //         }
              //         if (value.length < 6) {
              //           return 'Password must be at least 6 characters long.';
              //         }
              //         return null;
              //       },
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: const Color(0xFF02B7C8)),
                ),
                child: Center(
                  child: TextFormField(
                    controller: confirmPassCon,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password.';
                      }
                      if (value != passcon.text) {
                        // return 'Passwords do not match.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              if (confirmPassCon.text.isNotEmpty &&
                  confirmPassCon.text != passcon.text)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0), // Adjust padding as needed
                  child: Text(
                    'Passwords do not match',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 197, 23, 10),
                        fontSize: 12),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: const Color(0xFF02B7C8))),
                child: Center(
                  child: TextFormField(
                    controller: contactCon,
                    decoration: const InputDecoration(
                      hintText: 'Contact',
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: const Color(0xFF02B7C8)),
                ),
                child: Center(
                  child: SizedBox(
                    width: 240,
                    child: DropdownButton<String>(
                      value: roleSelected,
                      underline: SizedBox(),
                      hint: Text("Select Role"),
                      items: [
                        DropdownMenuItem<String>(
                          value: "Select Role",
                          child: Text("Select Role"),
                        ),
                        ...roleItem.map((String e) {
                          return DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          );
                        }),
                      ],
                      onChanged: (newSelectedVal) {
                        setState(() {
                          this.roleSelected = newSelectedVal!;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  border: Border.all(color: const Color(0xFF02B7C8)),
                ),
                child: Center(
                  child: SizedBox(
                    width: 240,
                    child: DropdownButton<int>(
                      value: farmSelected,
                      underline: SizedBox(),
                      hint: Text("Select Farm"),
                      items: [
                        DropdownMenuItem<int>(
                          value: -1,
                          child: Text("Select Farm"),
                        ),
                        for (var farm in farmList)
                          DropdownMenuItem<int>(
                            value: farmList.indexOf(farm),
                            child: Text(farm['Name']),
                          ),
                      ],
                      onChanged: (newSelectedIndex) {
                        setState(() {
                          this.farmSelected = newSelectedIndex!;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF039BA8),
                    )),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        int statuscode = 0;
                        if (passcon != confirmPassCon) {
                        } else {
                          statuscode = await ApiHandler().signupnew(
                              namecon.text,
                              emailcon.text,
                              confirmPassCon.text,
                              contactCon.text,
                              farmSelected,
                              roleSelected!);
                        }
                        ;

                        if (statuscode == 200) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Account  created'),
                                  actions: [
                                    // InkWell(): Icon(Icons.one_k_rounded))
                                  ],
                                );
                              });
                        } else if (statuscode == 201) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Account Already created'),
                                );
                              });
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ));
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Error....'),
                                );
                              });
                        }
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  )),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Color(0xFF02B7C8)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
