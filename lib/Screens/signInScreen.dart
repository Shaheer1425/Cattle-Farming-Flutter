import 'dart:convert';

import 'package:cattlefarming/Models/apiHandler.dart';
import 'package:cattlefarming/Screens/homeScreen.dart';
import 'package:cattlefarming/Screens/signupScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  bool isVisibal = false;
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
                      bottom: 90,
                      left: 30,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Color(0xFF02B7C8),
                          fontSize: 27,
                        ),
                      )),
                  const Positioned(
                      bottom: 60,
                      left: 30,
                      child: Text(
                        "Please Login or Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
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
                controller: emailcon,
                decoration: const InputDecoration(
                  hintText: 'Email or Phone',
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
            padding: const EdgeInsets.symmetric(
                horizontal: 30.0), // Added padding directly to Container
            child: Center(
              child: TextFormField(
                controller: passwordcon,
                obscureText: !isVisibal,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisibal ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisibal = !isVisibal;
                      });
                    },
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
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
                  Response response =
                      await ApiHandler().login(emailcon.text, passwordcon.text);
                  print('This is Response$response');
                  if (response.statusCode == 204) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Invalid Email or password'),
                          );
                        });
                  } else if (response.statusCode == 200) {
                    dynamic obj = jsonDecode(response.body);
                    print(obj);
                    // uobj=obj;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error....'),
                          );
                        });
                  }
                },

                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => SignUp(),
                // ));

                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 3),
            child: Row(
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Color(0xFF02B7C8)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
