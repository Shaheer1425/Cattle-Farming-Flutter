import 'package:cattlefarming/Screens/signup.dart';
import 'package:flutter/material.dart';

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
                          fontFamily: 'Jomolhari',
                        ),
                      )),
                  const Positioned(
                      bottom: 60,
                      left: 30,
                      child: Text(
                        "Please Login or Sign Up",
                        style: TextStyle(
                          fontFamily: 'Jomolhari',
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
                  hintStyle: TextStyle(
                    fontFamily: 'Jomolhari',
                  ),
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
            child: const Row(
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontFamily: 'Jomolhari',
                  ),
                ),
                InkWell(
                  //onTap: ,
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                        fontFamily: 'Jomolhari', color: Color(0xFF02B7C8)),
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
                onPressed: () {},
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontFamily: 'Jomolhari',
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              )),
        ],
      ),
    ));
  }
}
