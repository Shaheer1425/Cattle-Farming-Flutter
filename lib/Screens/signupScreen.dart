import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/signInScreen.dart';
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
    'Farm1',
    'Farm2',
    'Farm3',
  ];
  String? roleSelected;
  String? farmSelected;
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
                  controller: confirmPassCon,
                  decoration: const InputDecoration(
                    hintText: 'Confirm Password',
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
                  controller: namecon,
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
                  child: DropdownButton<String>(
                    value: farmSelected,
                    underline: SizedBox(),
                    hint: Text("Select Farm"),
                    items: [
                      DropdownMenuItem<String>(
                        value: "Select Type",
                        child: Text("Select Type"),
                      ),
                      ...farmItem.map((String e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      }),
                    ],
                    onChanged: (newSelectedVal) {
                      setState(() {
                        this.farmSelected = newSelectedVal!;
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
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: const Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(),
                  ),
                  InkWell(
                    //onTap: ,
                    child: Text(
                      " Sign In",
                      style: TextStyle(color: Color(0xFF02B7C8)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFF039BA8),
                  )),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                )),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
