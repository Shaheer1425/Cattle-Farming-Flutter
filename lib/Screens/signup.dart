import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController namecon = new TextEditingController();
  TextEditingController emailcon = new TextEditingController();
  TextEditingController passcon = new TextEditingController();
  TextEditingController confirmPassCon = new TextEditingController();
  TextEditingController contactCon = new TextEditingController();

  List<String> roleItem = [
    'Admin',
    'Manager',
    'Worker',
    'Doctor',
  ];

  List<String> farmItem = [
    'Select Farm',
    'Farm1',
    'Farm2',
    'Farm3',
  ];
  String? roleSelected;
  String farmSelected = "Select Farm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                              fontFamily: 'Jomolhari',
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
                    hintStyle: TextStyle(
                      fontFamily: 'Jomolhari',
                    ),
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
                    hintStyle: TextStyle(
                      fontFamily: 'Jomolhari',
                    ),
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
                  controller: passcon,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Jomolhari',
                    ),
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
                  controller: confirmPassCon,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      fontFamily: 'Jomolhari',
                    ),
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
                  controller: namecon,
                  decoration: const InputDecoration(
                    hintText: 'Contact',
                    hintStyle: TextStyle(
                      fontFamily: 'Jomolhari',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            /*    DropdownButton<String>(
                value: roleSelected,
                //hint: Text("Select Role"),
                items: roleItem.map((String e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (newSelectedVal) {
                  setState(() {
                    this.roleSelected = newSelectedVal!;
                  });
                })*/
            /*Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    border: Border.all(color: const Color(0xFF02B7C8))),
                child: Center(
                    child: DropdownButton<String>(
                      
               
                  value: roleSelected,
                  hint: Text(
                      "Select Role"), // Add a hint for when no item is selected
                  items: [
                    DropdownMenuItem<String>(
                      value: "Select Role", // Default value
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
                )))*/

            Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(color: const Color(0xFF02B7C8)),
              ),
              child: Center(
                child: SizedBox(
                  width:
                      240, // Adjust the width here to fit the dropdown button within the container
                  child: DropdownButton<String>(
                    value: roleSelected,
                    hint: Text(
                        "Select Role"), // Add a hint for when no item is selected
                    items: [
                      DropdownMenuItem<String>(
                        value: "Select Role", // Default value
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
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
