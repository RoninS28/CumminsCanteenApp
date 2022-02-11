import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_getx_flutter/constants/constants.dart';
import 'package:shopping_getx_flutter/screens/product_overview_screen.dart';
import 'package:shopping_getx_flutter/widget/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance; //variable is private
  bool showSpinner = false;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration:
                  kInputFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: kInputFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            kRoundedButton(
              title: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () async {
                //Implement login functionality.
                setState(() {
                  showSpinner = true;
                });

                try {
                  final newUser = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductOverviewPage()));
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
